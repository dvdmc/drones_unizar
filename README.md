# Drones Unizar

This repository is intended to deploy software into turtlebot's from the RoPeRT group at Universidad de Zaragoza. The repository includes installation scripts, configuration files and launchfiles for basic navigation, mapping and perception.

## Requirements

This system was tested on Turtlebots' and ground station computers running __TODO!__. The installtion script will take care of ROS installation if it is not installed.

## Install

To install the system first create a workspace of your choice on the robot or ground station computer:

```
mdkir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin init
```

Then, you should clone the repository in the 'src/' folder of the workspace:

```
cd ~/catkin_ws/src/
git clone https://github.com/dvdmc/drones_unizar.git
```

Then, execute the 'install.sh' script and follow the installations steps on the terminal:

```
. install.sh
```

This script will install different tools (including ROS if required) and should work from a fresh Ubuntu __TODO!__ installation.
You can check this file to change the installation process.
If you want to reconfigure some settings without reinstalling anything you can check the 'setup.sh' file.

### Dependencies

If you want to use Optitrack within Unizar, you should also prepare the `optitrack_unizar` package.

## Usage

The main use of this repository is for starting the drone system...
__TODO!__
...additionally, there are minimal examples for navigation, mapping and perception. You can check the specific modules in 'drones_unizar'.

> **Important:**
Before running any application __TODO!__

### Reactive navigation

__TODO!__ You can start (__TODO!__: Actual procedure) the robot and use its local navigation and odometry modules to perform reactive navigation with:

```
roslaunch turtlebot_unizar_bringup single_turtlebot_no_map.launch
```

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

### search_usb.sh

Simple script that displays the serial number of the USB devices connected to the computer.
Useful for identifying ports in ssh connections.

## Structure

__TODO!__

## Contribution

If you want to contribute to the repository, you can open an issue with your problems or suggestions, or do a pull request with improvement changes. Currently, there is no specific guide for contributors.

## Acknowledgements

Main contributors to this repository are:
- Juan D. (corresponding)
- Jorge B. (corresponding)
- Pablo P.
- Caspar
- David M. (corresponding)
