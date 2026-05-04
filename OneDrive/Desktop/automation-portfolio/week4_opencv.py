import cv2
import csv
from datetime import datetime

# Load image
img = cv2.imread('test_image.jpg')
grey = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(grey, (5, 5), 0)
edges = cv2.Canny(blurred, 50, 150)

contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

output = img.copy()
object_count = 0
results = []

for contour in contours:
    area = cv2.contourArea(contour)
    
    if area > 500:
        object_count += 1
        x, y, w, h = cv2.boundingRect(contour)
        
        # Draw bounding box and label
        cv2.rectangle(output, (x, y), (x + w, y + h), (0, 255, 0), 2)
        cv2.putText(output, f'Object {object_count}', (x, y - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
        
        # Store result
        results.append({
            'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'object_id': object_count,
            'x': x, 'y': y,
            'width': w, 'height': h,
            'area': int(area)
        })

# Save results to CSV
with open('detection_log.csv', 'w', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=['timestamp','object_id','x','y','width','height','area'])
    writer.writeheader()
    writer.writerows(results)

print(f"Found {object_count} objects")
print(f"Results saved to detection_log.csv")

# Save the output image
cv2.imwrite('detection_output.jpg', output)
print("Output image saved to detection_output.jpg")

cv2.imshow('Detected Objects', output)
cv2.waitKey(0)
cv2.destroyAllWindows()