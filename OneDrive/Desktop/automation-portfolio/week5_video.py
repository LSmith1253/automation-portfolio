import cv2
import csv
from datetime import datetime

cap = cv2.VideoCapture(r'C:\Users\lukep\OneDrive\Desktop\automation-portfolio\test_video.mp4')

ret, first_frame = cap.read()
frame_height, frame_width = first_frame.shape[:2]
line_y = frame_height // 2
cap.set(cv2.CAP_PROP_POS_FRAMES, 0)

total_count = 0
frame_count = 0
log = []
previous_centroids = []

def find_nearest(previous, cx, cy, threshold=50):
    for prev_cx, prev_cy in previous:
        dist = ((cx - prev_cx)**2 + (cy - prev_cy)**2) ** 0.5
        if dist < threshold:
            return prev_cx, prev_cy
    return None

while True:
    ret, frame = cap.read()
    if not ret:
        print("Video finished")
        break

    frame_count += 1
    grey = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    blurred = cv2.GaussianBlur(grey, (5, 5), 0)
    edges = cv2.Canny(blurred, 50, 150)
    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    output = frame.copy()
    cv2.line(output, (0, line_y), (frame_width, line_y), (255, 0, 0), 2)

    current_centroids = []

    for contour in contours:
        area = cv2.contourArea(contour)
        if area > 500:
            x, y, w, h = cv2.boundingRect(contour)
            cx = x + w // 2
            cy = y + h // 2
            current_centroids.append((cx, cy))

            cv2.rectangle(output, (x, y), (x + w, y + h), (0, 255, 0), 2)
            cv2.circle(output, (cx, cy), 4, (0, 0, 255), -1)

            # Find this object in previous frame
            match = find_nearest(previous_centroids, cx, cy)
            if match:
                prev_cy = match[1]
                # Check if it crossed the line
                if prev_cy < line_y <= cy:
                    total_count += 1
                    cv2.line(output, (0, line_y), (frame_width, line_y), (0, 0, 255), 3)
                    log.append({
                        'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                        'frame': frame_count,
                        'total_count': total_count
                    })

    previous_centroids = current_centroids

    cv2.putText(output, f'Total count: {total_count}', (10, 40),
                cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
    cv2.putText(output, f'Frame: {frame_count}', (10, 80),
                cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)

    cv2.imshow('Part Counter', output)

    if cv2.waitKey(100) & 0xFF == ord('q'):
        break

with open('count_log.csv', 'w', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=['timestamp', 'frame', 'total_count'])
    writer.writeheader()
    writer.writerows(log)

cap.release()
cv2.destroyAllWindows()
print(f"Final count: {total_count}")
print(f"Processed {frame_count} frames")
print("Log saved to count_log.csv")