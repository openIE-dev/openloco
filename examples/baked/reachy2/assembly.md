# Mechanical assembly

Root link(s): `torso`

1. Attach **neck_yaw_link** to **torso** via joint `NECK_yaw` (revolute).
2. Attach **L_shoulder_pitch** to **torso** via joint `L_SHOULDER_pitch` (revolute).
3. Attach **R_shoulder_pitch** to **torso** via joint `R_SHOULDER_pitch` (revolute).
4. Attach **neck_pitch_link** to **neck_yaw_link** via joint `NECK_pitch` (revolute).
5. Attach **L_shoulder_roll** to **L_shoulder_pitch** via joint `L_SHOULDER_roll` (revolute).
6. Attach **R_shoulder_roll** to **R_shoulder_pitch** via joint `R_SHOULDER_roll` (revolute).
7. Attach **head** to **neck_pitch_link** via joint `HEAD_mount` (fixed).
8. Attach **L_upper_arm** to **L_shoulder_roll** via joint `L_ARM_yaw` (revolute).
9. Attach **R_upper_arm** to **R_shoulder_roll** via joint `R_ARM_yaw` (revolute).
10. Attach **L_elbow_link** to **L_upper_arm** via joint `L_ELBOW` (revolute).
11. Attach **R_elbow_link** to **R_upper_arm** via joint `R_ELBOW` (revolute).
12. Attach **L_forearm** to **L_elbow_link** via joint `L_FOREARM_yaw` (revolute).
13. Attach **R_forearm** to **R_elbow_link** via joint `R_FOREARM_yaw` (revolute).
14. Attach **L_wrist_pitch_link** to **L_forearm** via joint `L_WRIST_pitch` (revolute).
15. Attach **R_wrist_pitch_link** to **R_forearm** via joint `R_WRIST_pitch` (revolute).
16. Attach **L_gripper_base** to **L_wrist_pitch_link** via joint `L_WRIST_roll` (revolute).
17. Attach **R_gripper_base** to **R_wrist_pitch_link** via joint `R_WRIST_roll` (revolute).
18. Attach **L_gripper_jaw** to **L_gripper_base** via joint `L_GRIPPER` (prismatic).
19. Attach **R_gripper_jaw** to **R_gripper_base** via joint `R_GRIPPER` (prismatic).
