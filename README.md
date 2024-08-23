This repository has a python script to extract frames of interest, recognize objects on the shelf and get pixel coordinates for each object.
We will get object positions by matching object pixel coordinates to surface coordinates in the main pipeline in Julia.
To be able to use the model you would need to install Docker, please find the instructions here:
https://www.docker.com

The weights for the pretrained model are in the last.pt file available here:
((https://drive.google.com/file/d/1mdHN0H1R7he6FCpdLfH9jY5eXgwWjVr2/view?usp=sharing))
If you want to train your own model, you will need to annotate around 250 pictures in Yolo format, you may consider using this annotator for example:
https://hub.docker.com/r/heartexlabs/label-studio

To be able to run the python script, you would need to install pandas and OpenCV libraries for Python.

