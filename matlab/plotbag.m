clear all; clc; close all
% Create a bag file object with the file name
% by omitting the semicolon this displays some information about
% the bag file
bag = rosbag('../data/myturtle.bag')
 
% Display a list of the topics and message types in the bag file
bag.AvailableTopics
 
% Since the messages on topic turtle1/pose are of type Twist,
% let's see some of the attributes of the Twist message
msg_pose = rosmessage('turtlesim/Pose')
showdetails(msg_pose)
 
% Get just the topic we are interested in
bagselect = select(bag,'Topic','turtle1/pose');
 
% Create a time series object based on the fields of the turtlesim/Pose
% message we are interested in
ts = timeseries(bagselect,'X','Y','Theta','LinearVelocity','AngularVelocity');
ts1 = timeseries(bagselect,'X','Y');
ts2 = timeseries(bagselect,'Theta');

x = ts.data(626:2358,1);
y = ts.data(626:2358,2);
vel = ts.data(626:2358,4);
th = ts.data(626:2358,3);
t=ts.time-ts.time(1);
t=t(626:2358);

% x is the x position of the turtle
% y is the y position of the turtle
% vel is the LinearVelocity of the turtle
% th is the heading angle of the turtle in radians
 
u = vel.*cos(th);
v = vel.*sin(th);
ii = 1:10:length(x);  % Decimate the data so that it plot only every Nth point.

figure
plot(t,x); title('X & Y vs Time');
xlabel('Time (sec)'); ylabel('X & Y'); 
hold on
plot(t,y); legend({'X','Y'}); hold off
figure
plot(t,th); title('Heading Angle (theta) vs Time');
xlabel('Time (sec)'); ylabel('theta'); legend({'theta'});
figure
quiver(x(ii),y(ii),u(ii),v(ii)); title('Quiver Plot of turtle1/pose');
xlabel('X'); ylabel('Y');
