
# import the necessary packages
#import argparse
import cv2
import numpy as np
from transform import four_point_transform
import imutils
from skimage.filters import threshold_local

# initialize the list of reference points and boolean indicating
# whether cropping is being performed or not
refPt = []
lent=0
cropping = False
thickness = 2
def click_and_crop(event, x, y, flags, param):
    # grab references to the global variables
    global refPt, cropping, lent
    print("variable loaded: ",lent)
    # if the left mouse button was clicked, record the starting
    # (x, y) coordinates and indicate that cropping is being
    # performed
    if event == cv2.EVENT_LBUTTONDOWN:
        refPt.append([x, y])
        cv2.circle(image,(int(x),int(y)),thickness,(255,1,255),-1)
        cropping = True
        lent += 1
        print("inside if")        
        cv2.imshow("image", image)

# load the image, clone it, and setup the mouse callback function
#image = cv2.imread(args["image"])
img = r"C:\Users\CWDSG05\Desktop\KYC\bill5.JPG"
image = cv2.imread(img)
ratio = image.shape[0] / 600.0
orig = image.copy()
image = imutils.resize(image, height = 600)
clone = image.copy()
cv2.namedWindow("image")
cv2.setMouseCallback("image", click_and_crop)
 
# keep looping until the 'q' key is pressed
while True:
    # display the image and wait for a keypress
    cv2.imshow("image", image)
    key = cv2.waitKey(1) & 0xFF
 
    # if the 'r' key is pressed, reset the cropping region
    if key == ord("r"):
        lent = 0
        image = clone.copy()
    
    # if the 'c' key is pressed, break from the loop
    elif key == ord("c") and lent == 4:
        break
    
    elif(lent > 1 & lent <= 4):
        #cv2.polylines(image,[np.int0(refPt)],True,(0,255,255))
        if lent == 2:
            cv2.line(image,(int(refPt[0][0]),int(refPt[0][1])),(int(refPt[1][0]),int(refPt[1][1])),(255,0,0),thickness)
        elif lent == 3:
            cv2.line(image,(refPt[1][0],refPt[1][1]),(refPt[2][0],refPt[2][1]),(255,0,0),thickness)
        elif lent == 4:
            cv2.line(image,(refPt[2][0],refPt[2][1]),(refPt[3][0],refPt[3][1]),(255,0,0),thickness)
            cv2.line(image,(refPt[3][0],refPt[3][1]),(refPt[0][0],refPt[0][1]),(255,0,0),thickness)
        else: continue

 
# if there are two reference points, then crop the region of interest
# from teh image and display it
if lent == 4:
    box = np.int0(refPt)
    warped = four_point_transform(orig, box .reshape(4, 2) * ratio)
    warped = cv2.cvtColor(warped, cv2.COLOR_BGR2GRAY)
    T = cv2.threshold(warped,125,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)[1]  #doing Otsu thresholding
    T1 = threshold_local(warped, 11, offset = 10, method = "gaussian")      #doing Local gaussian thresholding
    warped_otsu = (warped < T).astype("uint8") * 255
    warped_local = (warped > T1).astype("uint8") * 255
    cv2.imshow("otsu", warped_otsu)
    cv2.imshow("gaussian", warped_local)
    key = cv2.waitKey(0) & 0xFF
    if key == ord("l"):
        warped_otsu = imutils.rotate_bound(warped_otsu, 270)
        warped_local = imutils.rotate_bound(warped_local, 270)
        cv2.destroyAllWindows()
        cv2.imshow("otsu", warped_otsu)
        cv2.imshow("gaussian", warped_local)
    elif key == ord("r"):
        warped_otsu = imutils.rotate_bound(warped_otsu, 90)
        warped_local = imutils.rotate_bound(warped_local, 90)
        cv2.destroyAllWindows()
        cv2.imshow("otsu", warped_otsu)
        cv2.imshow("gaussian", warped_local)
# close all open windows
cv2.waitKey(0)
cv2.destroyAllWindows()
