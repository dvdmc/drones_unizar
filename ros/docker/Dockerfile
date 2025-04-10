FROM osrf/ros:noetic-desktop-full

RUN apt-get update && apt-get install -y  git tmux vim xterm curl ssh tree htop gdb python3-catkin-tools ros-noetic-cmake-modules python3-tk python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential python3-rosdep

RUN gem install tmuxinator

RUN echo "set -g mouse on" > /root/.tmux.conf

RUN mkdir -p /root/catkin_ws/src && cd /root/catkin_ws/src && catkin init

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

RUN sudo apt-get install -y ros-noetic-geographic-msgs \
                        ros-noetic-tf2-sensor-msgs \
                        ros-noetic-mavros \ 
                        ros-noetic-mavros-extras \
                        ros-noetic-mavros-msgs \
                        # libyaml-cpp-dev \ 
                        # protobuf-compiler \ 
                        # autoconf \
                        libompl-dev \
                        ros-noetic-hector-trajectory-server \
                        ros-noetic-vrpn-client-ros \ 
                        ros-noetic-realsense2-camera \
                        ros-noetic-pid

# https://github.com/casadi/casadi/wiki/InstallationLinux
RUN sudo apt install -y gcc g++ gfortran git cmake liblapack-dev pkg-config ipython3 python3-dev python3-numpy python3-scipy python3-matplotlib swig --install-recommends
RUN git clone https://github.com/casadi/casadi -b main /root/casadi
WORKDIR /root/casadi
RUN mkdir build
WORKDIR /root/casadi/build
RUN cmake -DWITH_PYTHON=ON -DWITH_PYTHON3=ON ..
RUN make && make install

# Simulation
RUN git clone https://github.com/PX4/PX4-Autopilot.git --recursive /root/PX4-Autopilot
WORKDIR /root/PX4-Autopilot
RUN bash ./Tools/setup/ubuntu.sh
RUN DONT_RUN=1 make px4_sitl_default gazebo-classic
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh && bash ./install_geographiclib_datasets.sh
WORKDIR /root