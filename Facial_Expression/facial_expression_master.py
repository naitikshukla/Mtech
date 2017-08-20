import cv2

def find_faces(image):
    face_coord = faceCascade.detectMultiScale(image,scaleFactor=1.2,minNeighbors=15,minSize=(75, 75))
    only_faces = [image[y:y + h, x:x + w] for (x, y, w, h) in face_coord]
    normalized_faces = [cv2.resize(cv2.cvtColor(face, cv2.COLOR_BGR2GRAY), (350, 350)) for face in only_faces]

    return zip(normalized_faces, face_coord)


if __name__ == '__main__':
    emotions = ['neutral', 'anger', 'disgust', 'happy', 'sadness', 'surprise']
    emoticons = [cv2.imread('graphics/%s.png' % emotion, -1) for emotion in emotions]

    fisher_face = cv2.createFisherFaceRecognizer()
    fisher_face.load('models/emotion_detection_model.xml')
    faceCascade = cv2.CascadeClassifier('models/haarcascade_frontalface_default.xml')

    update_time =10

    window_name ='WEBCAM (press ESC to exit)'
    cv2.namedWindow(window_name)
    img = cv2.VideoCapture(0)

    if img.isOpened():
        read_value, webcam_image = img.read()
    else:
        print("webcam not found")
        exit(0)

    while read_value:
        for norm_faces,(x,y,w,h) in find_faces(webcam_image):
            prediction = fisher_face.predict(norm_faces)  # do prediction
            emo = emotions[prediction[0]]
            cv2.putText(webcam_image,str(emo),(x,y),cv2.FONT_HERSHEY_SIMPLEX,3,(125,244,345))
            print(emo)
            image_to_draw = emoticons[prediction[0]]

            image_array = cv2.resize(image_to_draw,(h,w))

            for c in range(0, 3):
                webcam_image[y:y + h, x:x + w, c] = image_array[:, :, c] * .8 \
                                                    + webcam_image[y:y + h, x:x + w, c] * .2

        cv2.imshow(window_name, webcam_image)

        read_value, webcam_image = img.read()
        key = cv2.waitKey(update_time)

        if key == 27:  # exit on ESC
            break

    cv2.destroyWindow(window_name)
