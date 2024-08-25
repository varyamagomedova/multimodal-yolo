# this code extracts frames from videos of a matcher by numbers from the .csv file with corrected target frames
# later we will use them for object recognition

import cv2
import pandas as pd
from concurrent.futures import ThreadPoolExecutor

# Function to process each video
def extract_frames(video_path, video_frames):
    cap = cv2.VideoCapture(video_path)
    if not cap.isOpened():
        print(f"Error: Could not open video {video_path}.")
        return

    frame_numbers = video_frames['new_frame_number'].tolist()
    participant = video_frames['participant'].iloc[0]
    session = video_frames['session'].iloc[0]

    for frame_number in frame_numbers:
        # Directly jump to the frame of interest
        cap.set(cv2.CAP_PROP_POS_FRAMES, frame_number)
        ret, frame = cap.read()
        if not ret:
            break  # Break if the frame can't be read
        #the frames will be saved in the folder 'frames_to_recognize' in the root folder
        frame_filename = f'/data/images/set{participant}_session{session}_frame_{frame_number}.jpg'
        cv2.imwrite(frame_filename, frame)
        print(f'Saved {frame_filename}')

    cap.release()

# Read the CSV file with corrected frame numbers (at least 5 April tags)
#path to you root folder (as in Julia pipeline)
frames = pd.read_csv('/Users/varya/Desktop/Julia/DGAME data/frame_numbers_corrected_with_tokens.csv')
set_session = frames.groupby('video_path')

# Use ThreadPoolExecutor to process videos in parallel
with ThreadPoolExecutor(max_workers=4) as executor:  # Adjust max_workers based on your CPU
    for video_path, video_frames in set_session:
        executor.submit(extract_frames, video_path, video_frames)