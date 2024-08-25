This repository has a python script to extract frames of interest, recognize objects on the shelf and get pixel coordinates for each object.
We will get object positions by matching object pixel coordinates to surface coordinates in the main pipeline in Julia.
To be able to use the model you would need to install Docker, please find the instructions here:
https://www.docker.com

The weights for the pretrained model are in the last.pt file available here:
((https://drive.google.com/file/d/1mdHN0H1R7he6FCpdLfH9jY5eXgwWjVr2/view?usp=sharing))
If you want to train your own model, you will need to annotate around 250 pictures in Yolo format, you may consider using this annotator for example:
https://hub.docker.com/r/heartexlabs/label-studio

To be able to run the python script, you would need to install pandas and OpenCV libraries for Python.

You would have to use this module after you have created the "frame_numbers_corrected_with_tokens.csv" file with the aggregated data on all points of interest that you have in the experiment. Initially these are moments of the target object onset pronounced by the director. 

This model will extract the frames from the videos, the frames will be saved in the folder 'frames_to_recognize' in the root folder of this module (not in the main pipeline module). Make sure your .yaml file has the correct path to these frames.
 Then you will recognize object positions on these frames using YOLO computer vision model. This will create te folder 'labels' for you with text files having pixel object coordinates for all objects for all frames. You will need then to put the path to thos folder into the 'main.jl' file of the main pipeline.

Detailed explanations in this video walkthrough:

