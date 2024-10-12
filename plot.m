clc; clear all; close all;

% Define joint angles in radians and segment lengths in meters
theta1 = deg2rad(0); % Convert degree to radian
theta2 = deg2rad(90);
theta3 = deg2rad(270);
x1 = 415 / 1000; % Convert mm to meters
x2 = 400 / 1000;
x3 = 435 / 1000;

% Rotation matrix about the Y-axis
Yrot = @(theta) [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];

% Homogeneous Transformation Matrices for each segment, including rotations
H1 = [Yrot(theta1) [x1;0;0]; 0 0 0 1];
H2 = [Yrot(theta2) [x2;0;0]; 0 0 0 1];
H3 = [Yrot(theta3) [x3;0;0]; 0 0 0 1];

% Compute the Forward Kinematics by multiplying the transformation matrices
H_cumulative1 = H1;
H_cumulative2 = H_cumulative1 * H2;
H_cumulative3 = H_cumulative2 * H3;

% Extract positions of each joint including end-effector
joint1_pos = H_cumulative1(1:3, 4);
joint2_pos = H_cumulative2(1:3, 4);
end_effector_pos = H_cumulative3(1:3, 4);

% Print the position of the end-effector in the command window
disp('End-effector position:');
disp(end_effector_pos);

% Visualization of the Robotic Arm
figure;
hold on;
grid on;
axis equal;
xlabel('X (meters)');
ylabel('Y (meters)');
zlabel('Z (meters)');
title('Robotic Arm Configuration and End-Effector Position');

% Plot the base of the robotic arm at the origin
plot3(0, 0, 0, 'ko', 'MarkerFaceColor', 'k', 'DisplayName', 'Base');

% Lines connecting base, joints, and end-effector
plot3([0 joint1_pos(1)], [0 joint1_pos(2)], [0 joint1_pos(3)], 'b-', 'LineWidth', 2, 'DisplayName', 'Base to Joint 1');
plot3([joint1_pos(1) joint2_pos(1)], [joint1_pos(2) joint2_pos(2)], [joint1_pos(3) joint2_pos(3)], 'r-', 'LineWidth', 2, 'DisplayName', 'Joint 1 to Joint 2');
plot3([joint2_pos(1) end_effector_pos(1)], [joint2_pos(2) end_effector_pos(2)], [joint2_pos(3) end_effector_pos(3)], 'g-', 'LineWidth', 2, 'DisplayName', 'Joint 2 to End-Effector');

% Mark the positions of joints and end-effector
plot3(joint1_pos(1), joint1_pos(2), joint1_pos(3), 'bo', 'MarkerSize', 8, 'DisplayName', 'Joint 1');
plot3(joint2_pos(1), joint2_pos(2), joint2_pos(3), 'ro', 'MarkerSize', 8, 'DisplayName', 'Joint 2');
plot3(end_effector_pos(1), end_effector_pos(2), end_effector_pos(3), 'go', 'MarkerSize', 8, 'DisplayName', 'End-Effector');

% Add a legend
legend show;

% Set the viewing angle for better visualization
view(30, 10);
