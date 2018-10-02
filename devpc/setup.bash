#!/bin/bash
source ~/ropod-project-software/catkin_workspace/src/platform/setup.bash

export ROS_IP=`hostname -I`

alias sshpico="ssh ropod@$PICO_IP"
alias sshpico-wired="ssh ropod@$PICO_IP_WIRED"
alias pico-core="export ROS_MASTER_URI=http://$PICO_IP:11311;
		unset ROS_HOSTNAME"
alias pico-core-wired="export ROS_MASTER_URI=http://$PICO_IP_WIRED:11311
			unset ROS_HOSTNAME"

alias p-rviz="pico-core;roslaunch pico_bringup rviz.launch"

alias sshropod="ssh ropod@$ROPOD_IP"
alias sshpico-wired="ssh ropod@$ROPOD_IP_WIRED"
alias ropod-core="export ROS_MASTER_URI=http://$ROPOD_IP:11311;
		  unset ROS_HOSTNAME"
alias ropod-core-wired="export ROS_MASTER_URI=http://$ROPOD_IP_WIRED:11311;
			unset ROS_HOSTNAME"

alias ropod-rviz="ropod-core;roslaunch ropod_bringup rviz.launch"

export ROBOT_REAL=false
