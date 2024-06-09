# Базовый образ Python с поддержкой ARM
FROM python:3.9-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Клонирование репозитория YOLOv7
RUN git clone https://github.com/WongKinYiu/yolov7.git /yolov7

# Установка Python-зависимостей
WORKDIR /yolov7
RUN pip install --no-cache-dir -r requirements.txt

# Установка PyTorch и других библиотек для ARM (M1)
RUN pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir opencv-python-headless

# Указание рабочей директории
WORKDIR /yolov7

# Копирование файлов проекта в контейнер
COPY . .

# Указание точки входа
ENTRYPOINT ["python"]
