# Base Python image
FROM python:3.9-slim

# installing the dependancies 
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# clone the yolov7 repository
RUN git clone https://github.com/WongKinYiu/yolov7.git /yolov7

# intall Python dependancies
WORKDIR /yolov7
RUN pip install --no-cache-dir -r requirements.txt

# install PyTorch
RUN pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir opencv-python-headless

# working directory
WORKDIR /yolov7

# copy the current directory contents into the container at /yolov7
COPY . .

ENTRYPOINT ["python"]
