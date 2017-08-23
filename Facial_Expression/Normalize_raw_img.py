##################################################################################################################################################
##		Script to find all JPG files in path : "C:\Users\naitikshukla\Downloads\facial\images\raw"										##
##		and find faces in a image then send crop face to "C:\Users\naitikshukla\Downloads\facial\images\extracted" path and move currently 		##
##		processed file to "images/raw/done" , if file already processed then print the name and skips.								##
##																																				                                          ##
##		Action: 1.Find Faces	2.Convert to Grayscales		3.Resize to 350x350		4.Gaussian BLUR (5,5)										##
##		Created by : Naitik Shukla	on 23/8/2017																								                      ##
##												      Written For Python3																				                          ##
######################################################################################################################
from pathlib import Path
import cv2
import os

dir = r"C:\Users\naitikshukla\Downloads\facial\images\raw"

pathlist = Path(dir).glob('*.JPG')
for i,path in enumerate(pathlist):
	# because path is object not string
	base = os.path.basename(path)
	if base in os.listdir('images/raw/done'):
		print("File ",base," is already done, SKIPPING")
		continue
	filename = os.path.splitext(base)[0]
	extension = os.path.splitext(base)[1]
	filename1 = filename.split('_')[1]
	path_in_str = str(path)
	#print(path)
	image = cv2.imread(path_in_str)
	faceCascade = cv2.CascadeClassifier('facemoji-master/models/haarcascade_frontalface_default.xml')
	faces_coordinates = faceCascade.detectMultiScale(image,scaleFactor=1.1,minNeighbors=15,minSize=(70, 70))
	cutted_faces = [image[y:y + h, x:x + w] for (x, y, w, h) in faces_coordinates]
	normalized_faces = [cv2.resize(cv2.cvtColor(face, cv2.COLOR_BGR2GRAY), (350, 350)) for face in cutted_faces]
	
	for j, face in enumerate(normalized_faces):
		face= cv2.GaussianBlur(face,(5,5),0)
		cv2.imwrite("images/extracted/face-" + str(filename1)+".jpg", face)
		#cv2.imshow("face",face)
	if cv2.waitKey(1) == 0x1b: # ESC
		print('ESC pressed. Exiting ...')
		break
	os.rename('images/raw/'+str(base),'images/raw/done/'+str(base))
	print("Processed: ",base)
