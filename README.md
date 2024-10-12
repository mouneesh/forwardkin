# Robotic Arm Forward Kinematics Visualization

## Overview
This MATLAB code calculates the forward kinematics for a robotic arm with three rotational joints and visualizes the arm's configuration in 3D space. The forward kinematics is computed by multiplying the transformation matrices for each joint, resulting in the position of the end-effector. The robot's structure is represented as three segments connected at joints, and the final position of the end-effector is displayed graphically.

## Code Description

### Input Parameters:
- **Joint Angles (theta1, theta2, theta3):** The angles of the three rotational joints in degrees, which are converted to radians for use in trigonometric calculations.
  - `theta1`: Rotation around the Y-axis at the base (in radians).
  - `theta2`: Rotation around the Y-axis for the second joint (in radians).
  - `theta3`: Rotation around the Y-axis for the third joint (in radians).

- **Segment Lengths (x1, x2, x3):** The lengths of the three segments in meters.
  - `x1`: Length of the first segment (converted from 415 mm to meters).
  - `x2`: Length of the second segment (converted from 400 mm to meters).
  - `x3`: Length of the third segment (converted from 435 mm to meters).

### Forward Kinematics:
1. **Rotation Matrix (Yrot):** The rotation matrix about the Y-axis is defined using a lambda function to rotate points in 3D space based on the joint angles.
   
2. **Homogeneous Transformation Matrices:** The transformation matrices `H1`, `H2`, and `H3` are constructed for each joint and segment. These matrices include both rotation and translation components to define the position of each joint in the global coordinate system.

3. **Cumulative Transformation:** 
   - `H_cumulative1`: Transformation matrix for the first joint.
   - `H_cumulative2`: The result of multiplying `H_cumulative1` by `H2`, representing the position of the second joint.
   - `H_cumulative3`: The result of multiplying `H_cumulative2` by `H3`, representing the final position of the end-effector.

4. **Joint and End-Effector Positions:** The positions of each joint and the end-effector are extracted from the cumulative transformation matrices.

### Visualization:
The robotic arm is visualized in a 3D plot, where each segment is represented by lines connecting the base, joints, and end-effector. The positions of the joints and end-effector are marked for easy identification.

- **Base:** Marked at the origin (0,0,0) with a black dot.
- **Joints:** 
  - `Joint 1`: Marked with a blue dot.
  - `Joint 2`: Marked with a red dot.
- **End-Effector:** Marked with a green dot.
  
Lines are drawn to represent the segments connecting the joints:
- Blue line: Connects the base to Joint 1.
- Red line: Connects Joint 1 to Joint 2.
- Green line: Connects Joint 2 to the end-effector.

### Viewing Angle:
The view is set at an angle of `(30, 10)` for better visualization of the robotic arm in 3D space.

## How to Use
1. Copy and paste the code into a MATLAB script file.
2. Run the script in MATLAB.
3. The computed position of the end-effector will be printed in the command window.
4. The visualization of the robotic arm will appear in a figure window, showing the current configuration based on the input joint angles and segment lengths.

## Example:
For the current configuration:
- `theta1 = 0°`
- `theta2 = 90°`
- `theta3 = 270°`
- Segment lengths of `415 mm`, `400 mm`, and `435 mm`

The 3D plot will display the robotic arm's structure, and the end-effector's position will be printed in the command window.

## Future Enhancements:
- Extend the code to handle different rotation axes (X, Z) for more complex robotic configurations.
- Add inverse kinematics for determining joint angles based on a desired end-effector position.
- Implement a real-time simulation where users can change joint angles interactively and observe the movement of the robotic arm.

