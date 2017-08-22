import cv2
import numpy as np
from scipy import stats

def find_faces(image):              #Function created to fetch normalized faces and their coordinates in webcam
    #gray = image
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    face1 = face_finder.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=10, minSize=(5, 5),flags=cv2.CASCADE_SCALE_IMAGE)
    face2 = face_finder2.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=10, minSize=(5, 5),flags=cv2.CASCADE_SCALE_IMAGE)
    face3 = face_finder3.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=10, minSize=(5, 5),flags=cv2.CASCADE_SCALE_IMAGE)
    face4 = face_finder4.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=10, minSize=(5, 5),flags=cv2.CASCADE_SCALE_IMAGE)
    print("Face Detected in :",len(face1),len(face2),len(face3),len(face4))
    # Go over detected faces, stop at first detected face, return empty if no face.
    if len(face1) == 1:
        only_faces = [gray[y:y + h, x:x + w] for (x, y, w, h) in face1]
        normalized_faces = [cv2.resize(face, (350, 350)) for face in only_faces]
        return zip(normalized_faces, face1)
    elif len(face2) == 1:
        only_faces = [gray[y:y + h, x:x + w] for (x, y, w, h) in face2]
        normalized_faces = [cv2.resize(face, (350, 350)) for face in only_faces]
        return zip(normalized_faces, face2)
    elif len(face3) == 1:
        only_faces = [gray[y:y + h, x:x + w] for (x, y, w, h) in face3]
        normalized_faces = [cv2.resize(face, (350, 350)) for face in only_faces]
        return zip(normalized_faces, face3)
    elif len(face4) == 1:
        only_faces = [gray[y:y + h, x:x + w] for (x, y, w, h) in face4]
        normalized_faces = [cv2.resize(face, (350, 350)) for face in only_faces]
        return zip(normalized_faces, face4)
    else: return
    '''
    face_coord = faceCascade.detectMultiScale(image,scaleFactor=1.2,minNeighbors=15,minSize=(75, 75))   #detect faces with params, it will skip any region small that 75x75 for faster processing
    only_faces = [image[y:y + h, x:x + w] for (x, y, w, h) in face_coord]       #contains all faces in current frame
    normalized_faces = [cv2.resize(cv2.cvtColor(face, cv2.COLOR_BGR2GRAY), (350, 350)) for face in only_faces]  #color changed to Gray and size 350x350
    return zip(normalized_faces, face_coord)
    '''
def classify_emotion(input_image,model):
    emotion_guesses = np.zeros((len(model), 1))
    for index in range(len(model)):
        prediction, confidence = model[index].predict(input_image)
        emotion_guesses[index][0] = prediction
        # emotion_guesses[index][1] = confidence
    print(emotion_guesses)
    return int(stats.mode(emotion_guesses)[0][0])

if __name__ == '__main__':
    emotions = ["neutral", "anger", "contempt", "disgust", "fear", "happy", "sadness", "surprise"]  #Current emotions support in list
    emoticons = [cv2.imread('graphics/%s.png' % emotion, -1) for emotion in emotions]   #having all images from path graphics/*.png with matching names as emotions above.

    models=[]
    for i in range(10):
        model_temp = cv2.createFisherFaceRecognizer()
        model_temp.load('fish_models/fish_model' + str(i) + '.xml')
        models.append(model_temp)

    face_finder = cv2.CascadeClassifier("haar_models/haarcascade_frontalface_default.xml")
    face_finder2 = cv2.CascadeClassifier("haar_models/haarcascade_frontalface_alt2.xml")
    face_finder3 = cv2.CascadeClassifier("haar_models/haarcascade_frontalface_alt.xml")
    face_finder4 = cv2.CascadeClassifier("haar_models/haarcascade_frontalface_alt_tree.xml")

    #fisher_face = cv2.createFisherFaceRecognizer()              #Initiate instance for Fisher Face Recognizer
    #fisher_face.load('models/emotion_detection_model.xml')      #Load the earlier created model from models/*.xml file
    #faceCascade = cv2.CascadeClassifier('models/haarcascade_frontalface_default.xml')   #Initiate and load xml for Frontal face detection
    update_time =10     #Time to wait

    window_name ='WEBCAM (press ESC to exit)'   #Given a name to window where output will be shown
    cv2.namedWindow(window_name)
    img = cv2.VideoCapture(0)                   #Initiate the webcam , here 0 is default for webcam if any usb camera then need to be changed.

    if img.isOpened():                          # Check for camera working ?
        read_value, webcam_image = img.read()   # If working extract first frame and continue
    else:
        print("webcam not found")               # Message for camera not working or found with 0 value.
        exit(0)

    while read_value:                           #Iterate till camera pushes frame
        for norm_faces,(x,y,w,h) in find_faces(webcam_image):   #Repeat for all faces found in find_faces() function.
            if (x,y,w,h)==None:
                continue
            else:
                prediction = classify_emotion(norm_faces,models)
                #prediction = fisher_face.predict(norm_faces)        #do prediction for emotions according to trained model
                emo = emotions[prediction]                       #according to prediction find the emotion it represent from list
                cv2.putText(webcam_image,str(emo),(x,y),cv2.FONT_HERSHEY_SIMPLEX,3,(125,244,345))   #Show emotion on screen at location found for face.
                print(emo)                             #For reference show on terminal also
                image_to_draw = emoticons[prediction]    #Extract 1 image need to be drawn as per emotion found.

                image_array = cv2.resize(image_to_draw,(h,w))   #Resize the emotion image extracted to the size of face found
                for c in range(0, 3):                           #For all 3 channel (RGB in opencv)
                    webcam_image[y:y + h, x:x + w, c] = image_array[:, :, c] * .8 \
                                                    + webcam_image[y:y + h, x:x + w, c] * .2    #append the emotion image on original image with .8 alpha and .2 beta

            cv2.imshow(window_name, webcam_image)       #Show the window created earlier our output
            read_value, webcam_image = img.read()
            key = cv2.waitKey(update_time)              #wait for 10 miliseconds mention earlier

            if key == 27:                               # exit on ESC
                break

    cv2.destroyWindow(window_name)                  #On succesfull exit destroy all windows
