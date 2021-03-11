#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export CATKIN_WORKSPACE=~/ropod-project-software/catkin_workspace

export ED_PLUGIN_PATH=$CATKIN_WORKSPACE/devel/lib
export ED_MODEL_PATH=$CATKIN_WORKSPACE/src/functionalities/ED/ed_object_models/models

#export PICO_IP=192.168.44.81
#export PICO_IP_WIRED=10.0.0.2

export ROPOD_IP=192.168.44.90
export ROPOD_TUE_2_IP=192.168.44.92
export ROPOD_IP_WIRED=10.0.0.2

unset ROS_HOSTNAME

source /opt/ros/$ROS_DISTRO/setup.bash
source $CATKIN_WORKSPACE/devel/setup.bash

alias buildit="cd $CATKIN_WORKSPACE; catkin_make -DUSE_SETCAP=ON"
alias clean_build="cd $CATKIN_WORKSPACE;
                   rm -rf build/ devel/;
                   cd $CATKIN_WORKSPACE/src/; 
                   rm CMakelists.txt; 
                   cd $CATKIN_WORKSPACE; 
                   catkin_make -DUSE_SETCAP=ON;"


alias catkin_workspace="cd $CATKIN_WORKSPACE"
alias applications="cd $CATKIN_WORKSPACE/src/applications"
alias functionalities="cd $CATKIN_WORKSPACE/src/functionalities"
alias platform="cd $CATKIN_WORKSPACE/src/platform"

alias teleop='rosrun robot_common teleop.py'
#alias pstart='roslaunch pico_bringup start.launch'
alias rstart='roslaunch ropod_tue_1_bringup start.launch LOAD_ATTACHED:="false"'
alias rmstart='roslaunch ropod_tue_1_bringup start.launch LOAD_ATTACHED:="true" loadName:="mobidik"'
alias r2start='roslaunch ropod_tue_2_bringup start.launch LOAD_ATTACHED:="false"'

alias git-status='functionalities; ./multi-git-status/mgitstatus ~/ropod-project-software/catkin_workspace/src/ 4; catkin_workspace'

function git_branches()
{
    if [[ -z "$1" ]]; then
        echo "Usage: $FUNCNAME <dir>" >&2
        return 1
    fi

    if [[ ! -d "$1" ]]; then
        echo "Invalid dir specified: '${1}'"
        return 1
    fi

    # Subshell so we don't end up in a different dir than where we started.
    (
        cd "$1"
        for sub in *; do
            [[ -d "${sub}/.git" ]] || continue
            echo "$sub [$(cd "$sub"; git  branch | grep '^\*' | cut -d' ' -f2)]"
        done
    )
}

alias git-check-branches='applications; git_branches .; functionalities; git_branches .; git_branches ./ED; git_branches ./ropod_comm; git_branches ./ropod_nav/; git_branches ./ros_experimental_nav/; platform; git_branches .; catkin_workspace; git_branches .'

alias update-dependencies='rosdep update;rosdep install --from-path . -i -y;'
