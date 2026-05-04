import cv2
cap = cv2.VideoCapture(r'C:\Users\lukep\OneDrive\Desktop\automation-portfolio\test_video.mp4')
print(cap.isOpened())
print(cap.get(cv2.CAP_PROP_FRAME_COUNT))
cap.release()