#!/bin/bash
# script by wxd

delay=2
bag_dir="/home/${USER}/dataset/vicon_room2_01"
cd ~/ros_ws/msckf
source devel/setup.bash
echo ${bag_dir}
# bag file record
if ! screen -list | grep -q "run_msckf_vio_node"
then
	# cannot achieve full recording due to RAM limitation 
	roslaunch msckf_vio msckf_vio_euroc.launch &
        sleep ${delay}
        rosbag play ${bag_dir}/V2_01_easy.bag
	sleep ${delay}
	echo "run_msckf_vio_node ready."
else
	echo "run_msckf_vio_node already recording."	
fi

