#!/bin/bash
source ~/ropod-project-software/catkin_workspace/src/platform/setup/setup.bash

#export ROS_IP=`hostname -I`
export ROS_IP=`hostname -I | awk '{print $1}'`

alias sshpico="ssh ropod@$PICO_IP"
alias sshpico-wired="ssh ropod@$PICO_IP_WIRED"
alias pico-core="export ROS_MASTER_URI=http://$PICO_IP:11311;
		unset ROS_HOSTNAME"
alias pico-core-wired="export ROS_MASTER_URI=http://$PICO_IP_WIRED:11311
			unset ROS_HOSTNAME"

alias p-rviz="pico-core;roslaunch pico_bringup rviz.launch"

alias sshropod="ssh ropod@$ROPOD_IP"
alias sshropod-wired="ssh ropod@$ROPOD_IP_WIRED"
alias ropod-core="export ROS_MASTER_URI=http://$ROPOD_IP:11311;
		  unset ROS_HOSTNAME"
alias ropod-core-wired="export ROS_MASTER_URI=http://$ROPOD_IP_WIRED:11311;
			unset ROS_HOSTNAME"

alias sshropod2="ssh ropod@$ROPOD_TUE_2_IP"
alias sshropod2-wired="ssh ropod@$ROPOD_IP_WIRED"
alias ropod2-core="export ROS_MASTER_URI=http://$ROPOD_TUE_2_IP:11311;
		  unset ROS_HOSTNAME"
alias ropod2-core-wired="export ROS_MASTER_URI=http://$ROPOD_IP_WIRED:11311;
			unset ROS_HOSTNAME"

alias ropod-rviz="ropod-core;roslaunch ropod_tue_1_bringup rviz.launch robot_bringup:='~/ropod-project-software/catkin_workspace/src/platform/ropod_tue_1_bringup/'"
alias ropod2-rviz="ropod2-core;roslaunch ropod_tue_2_bringup rviz.launch robot_bringup:='~/ropod-project-software/catkin_workspace/src/platform/ropod_tue_2_bringup/'"

export ROBOT_REAL=false
