#!/bin/bash

echo "Preparing turtlebot_unizar installation..."

# Ask for sudo permissions on terminal
sudo echo "Sudo permissions granted"

# Set color variables for messages
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Get path to script
SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

sudo apt update
# Ask if apt upgrade should be performed
printf "${YELLOW}Do you want to perform apt upgrade? (y/n)${NC}"
read -r apt_upgrade
if [ "$apt_upgrade" = "y" ]; then
    printf "${GREEN}apt upgrade started...\n${NC}"
    sudo apt upgrade
else
    printf "${GREEN}apt upgrade skipped\n${NC}"
fi

# Check if Ubuntu version is 20.04 or output a warning TODO
if [ "$(lsb_release -rs)" != "20.04" ]; then
    printf "${RED}Warning: this script has been tested only on Ubuntu 20.04 \n${NC}"
fi

# Check if ros installed. Otherwise, ask if it should be installed
if [ -d "/opt/ros" ]; then
    printf "${GREEN}ROS is already installed ${NC}\n"
else
    printf "${YELLOW}ROS is not installed. Do you want to install it? (y/n) ${NC}"
    read -r install_ros
    if [ "$install_ros" = "y" ]; then
        . ${SCRIPT_PATH}/install/ros_install.sh
    else
        printf "${YELLOW}ROS installation skipped \n${NC}"
    fi
fi

# Install basic programs: git, vim, tmux, htop, net-tools, openssh-server
sudo apt install git vim tmux htop net-tools openssh-server tmux


# Install catkin tools
sudo apt-get install python3-rosdep python3-catkin-tools python-is-python3 # The last is required for ros-noetic-linux-peripheral-interfaces
