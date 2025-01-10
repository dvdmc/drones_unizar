# Drones Unizar

This repository is intended to deploy software into drones' companion computers from the RoPeRT group at Universidad de Zaragoza. The repository includes different Docker images, configuration files and ROS packages for basic navigation, mapping and perception.

## Requirements

This system was tested on a ROS2 Humble Docker container provided by Nvidia on a Jetson Nano with JetPack 4.6 JetPack 4.6.6 [L4T 32.7.6] and ground station computers running a ROS2 Humble Docker container. The Pixhawk firmware version is v1.14.

## Install

To install the system clone the repository in the companion computer:

```
cd ~/catkin_ws/src/
git clone https://github.com/dvdmc/drones_unizar.git
```


### Configure Pixhawk

The main way of configuring the Pixhawk is through QGroundControl. QGroundControl should be installed in the ground station and you can connect to a new Pixhawk by USB directly or by a USB telemetry radio.

The basic configurations for a new Pixhawk are:
- Flash the PX4 following (last tested version is 1.15.2): https://docs.px4.io/main/en/config/firmware.html
- __TODO__ (JBes, JDese):

### Connect to a companion computer

This example is based on a Jetson Nano. The Jetson serial ports (TX,RX,Ground) are connected to the TELEM2 Pixhawk port ([reference](https://www.youtube.com/watch?v=nIuoCYauW3s) NOTE: Double check the port layout numbers TX=8, RX=10, GND=6 or 9). 

### Configure udev rules

In order to grant the user permission over the serial port `ttyTHS1`of the Nvidia Jetson Nano, the udev `99-ttyths1-permissions.rule` rules have to be copied as:
```
sudo cp 99-ttyths1-permissions.rules /etc/udev/rules.d/
```
Since the rules are not applied at startup for some reason, we also create a systemd service to reload the rules:
```
sudo cp fix-ttyths1.sh /etc/init.d/
sudo chmod +x /etc/init.d/fix-ttyths1.sh
sudo update-rc.d fix-ttyths1.sh defaults
```

It might be necessary to restart the device to apply the previous. The ttyTHS1 is mapped inside the Docker container by using a volume (check `docker-compose.yml` file)

"""
NOTE: This udev rules are for the Jetson Nanno configuration explained in the video.
In order to list the serial ports to find the correct ones, you can use:
```
ls /dev/tty*
```
"""

### Starting the Docker

You can simply run the following to start the Docker **on Jetson Nano** (TODO: Create others for Orin):

```
. ./start_pixhawk_companion.sh
```
Recommended: check the script to see what it does.

### Dependencies

If you want to use Optitrack within Unizar, you should also prepare the `ground_station_unizar` package in the ground station computer.

## Usage

The main use of this repository is for starting the drone system...
__TODO!__
...additionally, there are minimal examples for navigation, mapping and perception. You can check the specific modules in 'drones_unizar'.

> **Important:**
Before running any application __TODO!__

### Reactive navigation

__TODO!__ You can start (__TODO!__: Actual procedure)

### Create a map

__TODO!__
For creating a new map, you can run the following:

```
roslaunch turtlebot_unizar_bringup single_turtlebot_gmapping.launch
```

You can send goals to the robot that will map its environment usng a Hokuyo 2D Lidar. When you think that the map is complete, you can save the map using:

```
rosrun map_server map_saver -f {PATH_TO_YOUR_MAP}
```

### Navigate of a previous map

__TODO!__
For navigation using the AMCL localization method with the Lidar on a previous map, you can use:

```
roslaunch turtlebot_unizar_bringup single_turtlebot_amcl.launch map_file:={PATH_TO_YOUR_MAP}
```

## Useful scripts

### __TODO!__ open_serial.sh

Scrip to open the serial por for connection with the PX4 controller.
__TODO!__: Is it needed in the launch script? How does it really work? Can be added to the entrypoint?

## Sources

- ROS2 Humble Desktop Docker image for Jetson Nano (old): https://github.com/dusty-nv/jetson-containers/tree/master/packages/ros
- JetPack 4.6 JetPack 4.6.6 [L4T 32.7.6] for Jetson Nano: https://developer.nvidia.com/jetpack-sdk-466
- Tutorial for setting up Pixhawk with ROS2: https://docs.px4.io/main/en/ros2/user_guide.html
- Tutorial for setting up mavros in ROS2 Humble: https://github.com/mavlink/mavros/blob/ros2/mavros/README.md#installation 
- Possible reference for DDS config: https://discuss.px4.io/t/uxrce-dds-bridge-multicast-udp-addresses-and-ports/32218/4
## Structure

__TODO!__

## Contribution

If you want to contribute to the repository, you can open an issue with your problems or suggestions, or do a pull request with improvement changes. Currently, there is no specific guide for contributors.

## Acknowledgements

Main contributors to this repository are:
- David M. (corresponding)
- Jorge B.
- Juan D.
