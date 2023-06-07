FROM ros:melodic-ros-core-bionic

ENV DEBIAN_FRONTEND noninteractive

# Install libs
RUN apt-get update && apt-get install -y \
    git \
    build-essential

# Install ROS packages
RUN apt-get update && apt-get install -y \
    ros-melodic-catkin \
    ros-melodic-tf2-geometry-msgs \
    python-catkin-tools

# Set docker container username
ARG USER=docker_po2
ARG UID=1000
ARG GID=1000
ARG PW=user 
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd

WORKDIR /home/${USER}
RUN cd /home/${USER} && mkdir -p catkin_ws/src && chown -R ${UID}:${GID} ./

# Install deps
RUN cd /home/${USER}/catkin_ws/src && \
    git clone https://github.com/Steplerchik/path_optimizer_2.git && \
    bash path_optimizer_2/script/install_deps.sh
RUN cd /home/${USER}/catkin_ws/src && rm -rf path_optimizer_2

USER ${UID}:${GID}
