FROM dustynv/ros:humble-desktop-l4t-r32.7.1

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils software-properties-common -y

RUN apt install git tmux vim htop net-tools openssh-server tmuxinator nano iputils-ping net-tools -y
RUN echo "set -g mouse on" > /root/.tmux.conf

# ROS2 utils

RUN apt-get install python3-rosdep  \
                python3-pip     \
                python3-colcon-common-extensions \
                python3-colcon-mixin \
                ros-dev-tools -y

# For allowing connection between machines, fastdds has some problem.
RUN apt-get install ros-humble-rmw-cyclonedds-cpp -y

# Mavlink
RUN apt install ros-humble-mavros
RUN source /opt/ros/humble/setup.bash && ros2 run mavros install_geographiclib_datasets.sh

# AS2
RUN apt-get install ros-humble-aerostack2 ros-humble-as2-platform-mavlink ros-humble -y
RUN colcon mixin update default
RUN rm -rf log # remove log folder

RUN pip3 install colcon-lcov-result cpplint cmakelint
RUN pip3 install PySimpleGUI-4-foss