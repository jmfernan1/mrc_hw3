rosservice call /turtle1/teleport_absolute 3 5 0
rosservice call /clear
rosservice call /turtle1/set_pen 255 0 0 3 off

rosservice call /spawn 5 2.5 0 "turtle2"
rosservice call /turtle2/set_pen 0 0 255 3 off


rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[-4.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -1.5]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[3.5, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[5.0, 0.0, 0.0]' '[0.0, 0.0, -4.0]'

rostopic pub /turtle2/cmd_vel geometry_msgs/Twist -1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'
rostopic pub /turtle2/cmd_vel geometry_msgs/Twist -1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'
rostopic pub /turtle2/cmd_vel geometry_msgs/Twist -1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'
rostopic pub /turtle2/cmd_vel geometry_msgs/Twist -1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'
