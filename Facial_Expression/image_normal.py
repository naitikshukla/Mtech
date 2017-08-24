##################################################################################################################################################
##		Script to find all JPG files in path : "C:\Users\naitikshukla\Downloads\facial\final\data\source_images"								##
##		and find faces in a image then send crop face to "C:\Users\naitikshukla\Downloads\facial\final\data\sorted_set" path and move currently ##
##		processed file to "data/source_images/done" , if file already processed then print the name and skips.									##
##																																				##
##		Action: 1.Find Faces	2.Convert to Grayscales		3.Resize to 350x350		4.Gaussian BLUR (5,5)										##
##		Created by : Naitik Shukla	on 23/8/2017																								##
##												Written For Python3																				##
##################################################################################################################################################
'''
REQUIREMENTS:
	FOLDER:
		-	C:\Users\naitikshukla\Downloads\facial\final\data\source_images							(RAW Image)
		-	data/sorted_set																			(PROCESSED Image)
		-	data/source_images/done																	(RAW Image moved after done)
		-	models/																					(haarcascade_frontalface_default.xml)
	FILES:
		-	haarcascade_frontalface_default.xml														(In models/)
		-	IMG_0837.JPG																			(In data/source_images) (Split by '_' Format)
'''
from pathlib import Path
import cv2
import os

dir = r"C:\Users\naitikshukla\Downloads\facial\final\data\source_images"		#Directory for RAW images to process

pathlist = Path(dir).glob('*.JPG')												#Find all .JPG files in dir above
for i,path in enumerate(pathlist):
	# because path is object not string
	base = os.path.basename(path)												#extract file name from complete filepath (IMG_0837.JPG)
	if base in os.listdir('data/source_images/done'):							#Check if current file already processed
		print("File ",base," is already done, SKIPPING")
		continue																#SKIP file
	filename = os.path.splitext(base)[0]										#Split the FIlename (IMG_0837)
	extension = os.path.splitext(base)[1]										#Split the extension (.JPG)
	filename1 = filename.split('_')[1]											#Split Filename further usinf '_' and take 2nd part (0837)
	path_in_str = str(path)
	#print(path)
	image = cv2.imread(path_in_str)												#read the raw image from path
	faceCascade = cv2.CascadeClassifier('models/haarcascade_frontalface_default.xml')							#Load the Front face detector pretrained model
	faces_coordinates = faceCascade.detectMultiScale(image,scaleFactor=1.1,minNeighbors=15,minSize=(70, 70))	#Find faces in image (return coordinates)
	cutted_faces = [image[y:y + h, x:x + w] for (x, y, w, h) in faces_coordinates]								#Slice the face from image using return coordinates
	normalized_faces = [cv2.resize(cv2.cvtColor(face, cv2.COLOR_BGR2GRAY), (350, 350)) for face in cutted_faces]	#Convert to gray and resize the face.
	
	for j, face in enumerate(normalized_faces):
		face= cv2.GaussianBlur(face,(5,5),0)									#Perform light blur on face
		cv2.imwrite("data/sorted_set/face-" + str(filename1)+".jpg", face)		#Write the face into file with (0837) taken from original file.
		cv2.imshow("face",face)													#Show the face cropped
	if cv2.waitKey(1) == 0x1b: # ESC
		print('ESC pressed. Exiting ...')
		break
	os.rename('data/source_images/'+str(base),'data/source_images/done/'+str(base))	#Move the currently processed file to other location
	print("Processed: ",base)
