FROM nvidia/cuda:9.0-devel-ubuntu16.04

RUN apt-get update
RUN apt-get install -y wget

RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh

RUN bash Anaconda3-2020.07-Linux-x86_64.sh -b

RUN wget http://www.mousemotorlab.org/s/DLC-GPU.yaml

ENV PATH=$PATH:/root/anaconda3/bin

RUN conda env create -f DLC-GPU.yaml

# Install dependencies of wxPython
RUN apt-get update --fix-missing
RUN apt-get install -y libgtk2.0-dev libgtk-3-dev \
    libjpeg-dev libtiff-dev \
    libsdl1.2-dev libgstreamer-plugins-base1.0-dev \
    libnotify-dev freeglut3 freeglut3-dev libsm-dev \
    libwebkitgtk-dev libwebkitgtk-3.0-dev
 
 
RUN pip install https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-16.04/wxPython-4.1.0-cp38-cp38-linux_x86_64.whl

RUN apt-get install -y x11-apps xserver-xorg-dev

RUN conda init bash

RUN echo '\n\
export PS1=1\n\
source /root/.bashrc\n\
conda activate DLC-GPU\n\
ipython -c "import deeplabcut; deeplabcut.launch_dlc()"\n\
' > run.sh

RUN cd /root/anaconda3/envs/DLC-GPU/lib/python3.7/site-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained && \
  bash ./download.sh

SHELL ["conda", "run", "-n", "DLC-GPU", "/bin/bash", "-c"]

RUN pip install anipose
RUN conda install mayavi ffmpeg
RUN pip install --upgrade apptools

RUN mkdir -p /home/rubi
WORKDIR /home/rubi
