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
RUN apt install -y doxygen graphviz

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
  libqt6openglwidgets6 qt6-webview-dev qml6-module-qtwebview \
  qt6-webengine-dev libqt6webenginecore6 qt6-webengine-dev-tools \
  qml6-module-qtquick-controls \
  qt6-location-dev qt6-positioning-dev \
  qml6-module-qtlocation qml6-module-qtpositioning
RUN apt install -y libopengl-dev libgl-dev

RUN apt install -y pkg-config libgtkmm-3.0-dev
RUN apt install -y libgtkmm-4.0-dev libwebkitgtk-6.0-dev

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


RUN apt install -y nano

RUN apt install -y firebird-dev
RUN apt install -y libsdl3-dev libsdl3-image-dev libsdl3-ttf-dev libgl1-mesa-dev


RUN apt install -y libnotify-dev
RUN apt install -y libgstreamerd-3-dev libgstreamermm-1.0-dev libgstreamer1.0-dev
WORKDIR /src/wxWidgets
RUN git clone --branch v3.3.2 https://github.com/wxWidgets/wxWidgets.git wxWidgets
WORKDIR /src/wxWidgets/wxWidgets
RUN git submodule update --init
WORKDIR /src/wxWidgets/
RUN cmake -S wxWidgets -B wxWidgets-build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
RUN cmake --build wxWidgets-build -j$(nproc)
RUN cmake --install wxWidgets-build --prefix /usr

ARG UID=1001
ARG GID=1001
ARG USERNAME=ubuntu
ARG USERHOME=/home/${USERNAME}

RUN groupmod -g ${GID} ${USERNAME} && \
    usermod -u ${UID} -g ${GID} ${USERNAME} && \
    chown -R ${UID}:${GID} ${USERHOME}


# Installing CLAUDE as described 
# @ https://code.claude.com/docs/en/quickstart#step-4-ask-your-first-question

ARG customClaudeStarter=/usr/bin/claude
RUN echo -n "#!/bin/bash\n\n" > ${customClaudeStarter}
RUN echo -n "~/.local/bin/claude\n" >> ${customClaudeStarter}
RUN chmod +x ${customClaudeStarter}

USER ${USERNAME}

WORKDIR /src/claude

RUN wget --continue --read-timeout=10 --tries=25 https://claude.ai/install.sh
RUN chmod +x install.sh
RUN ./install.sh

WORKDIR ${USERHOME}


CMD ["bash"]
