#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export CATKIN_WORKSPACE=~/ropod-project-software/catkin_workspace

export ED_PLUGIN_PATH=$CATKIN_WORKSPACE/devel/lib
export ED_MODEL_PATH=$CATKIN_WORKSPACE/src/functionalities/ED/ed_object_models/models

export PICO_IP=192.168.44.81
export PICO_IP_WIRED=10.0.0.2

export ROPOD_IP=192.168.44.90
export ROPOD_IP_WIRED=10.0.0.2
unset ROS_HOSTNAME

source /opt/ros/kinetic/setup.bash
source $CATKIN_WORKSPACE/devel/setup.bash

alias buildit="cd $CATKIN_WORKSPACE; catkin_make"
alias clean_build="cd $CATKIN_WORKSPACE;
                   rm -rf build/ devel/;
                   cd $CATKIN_WORKSPACE/src/; 
                   rm CMakelists.txt; 
                   cd $CATKIN_WORKSPACE; 
                   catkin_make;"


alias catkin_workspace="cd $CATKIN_WORKSPACE"
alias applications="cd $CATKIN_WORKSPACE/src/applications"
alias functionalities="cd $CATKIN_WORKSPACE/src/functionalities"
alias platform="cd $CATKIN_WORKSPACE/src/platform"

alias teleop='rosrun robot_common teleop.py'
alias pstart='roslaunch pico_bringup start.launch'
alias rstart='roslaunch ropod_bringup start.launch LOAD_ATTACHED:="false"'
alias rmstart='roslaunch ropod_bringup start.launch LOAD_ATTACHED:="true" loadName:="mobidik"'


