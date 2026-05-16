FROM ubuntu:latest

# Most of this is from https://github.com/yuriysydor1991/cpp-app-template

RUN apt update
RUN apt upgrade -y

RUN apt install -y libstdc++6 build-essential git cmake g++ pkg-config

RUN apt install -y clang-format
RUN apt install -y cppcheck
RUN apt install -y valgrind
RUN apt install -y flatpak flatpak-builder
RUN apt install -y clang-tidy
RUN apt install -y libgtest-dev
RUN apt install -y libgmock-dev

RUN apt install -y meson
RUN apt install -y liblog4cpp5-dev
RUN apt install -y libboost-all-dev

RUN apt install -y qt6-base-dev qt6-base-dev-tools \
  qt6-declarative-dev qt6-tools-dev qt6-tools-dev-tools \
  qml6-module-qtquick qml6-module-qtqml-workerscript \
  qml6-module-qtquick-templates qml6-module-qtquick-window \
  qtquickcontrols2-5-dev libqt6gui6 qml-module-qtquick2 \
  qml-module-qtquick-controls2 qml-module-qtquick-dialogs \
  qml-module-qtquick-layouts qml-module-qtquick-shapes \
  libqt6quick6 libqt6quickcontrols2-6 libqt6opengl6-dev \
  libqt6openglwidgets6
RUN apt install -y libopengl-dev libgl-dev
RUN apt install -y qml6-module-qtquick-controls

RUN apt install -y pkg-config libgtkmm-3.0-dev
RUN apt install -y libgtkmm-4.0-dev

RUN apt install -y libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libsdl2-net-dev

RUN apt install -y freeglut3-dev libglew-dev
RUN apt install -y libcurl4-openssl-dev
RUN apt install -y libpqxx-dev
RUN apt install -y libmysqlcppconn-dev

RUN apt install -y gnuplot

RUN apt install -y snapd

RUN apt install -y mesa-common-dev ffmpeg

RUN apt install -y wget curl htop btop unrar 
RUN apt install -y nmap traceroute whois
RUN apt install -y automake autoconf autoconf-doc fdupes

RUN apt install -y libopencv-dev libopencv-dnn-dev libopencv-imgcodecs-dev \
  libopencv-imgproc-dev opencv-data opencv-doc


USER ubuntu

# Installing CLAUDE as described 
# @ https://code.claude.com/docs/en/quickstart#step-4-ask-your-first-question

WORKDIR /src/claude

RUN wget --continue --read-timeout=10 --tries=25 https://claude.ai/install.sh
RUN chmod +x install.sh
RUN ./install.sh


WORKDIR /home/ubuntu


CMD ["bash"]
