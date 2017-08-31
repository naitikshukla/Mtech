<u>**Facial Expression detection using OpenCV and overlap images for Emotions**</u>

Please follow the same above folder structure.<br><br>
**`Models`** - Will have trained model for Fisher Face Recogniser and Haar frontal face detector<br>
**`graphics`** - will have images to overlap for emotions<br>
**`data`** - It has all images required for training, raw and processed after script run.
<br><br>
***<u>`image_normal.py`</u> -<br>***
Script to find all JPG files in path : "data/source_images"<br>
find faces in a image then send crop face to "data/sorted_set" path and move currently processed file to "data/source_images/done" , if file already processed then print the name and skips.<br>
<b>Action: </b><i>&ensp;&ensp;1.Find Faces	&ensp;&ensp;2.Convert to Grayscales		&ensp;&ensp;3.Resize to 350x350		&ensp;&ensp;4.Gaussian BLUR (5,5)</i>
<br><br>
***<u>`prepare_model.py`</u> -<br>***
This file contains logic responsible for teaching Fisher model on a processed dataset. It also prints it's accuracy.<br>
emotions = ["neutral", "anger", "disgust", "happy", "sadness", "surprise"]<br><br>

***<u>`face_emotions_master.py`</u> -<br>***
Script will show WEBCAM image with emotions emoji interpolated over face dynamically with position and size.<br>
Also put text of emotion over frame.<br>
<br><br>
__If you simply want to run classifier do below:__<br>
* Download folder __graphics__ and its content
* Download folder __models__ and it's content
* Download `emotions_self.py` and just execute from shell &nbsp;&nbsp;__python emotions_self.py__
<br><br>
***Result***:<br>
![Alt text](Result/happy.JPG?raw=true "When everyone smiling")
<br>
![Alt text](Result/surprise.JPG?raw=true "When model also surprises")
