# Mechanical assembly

Root link(s): `base`

1. Attach **L_shoulder** to **base** via joint `L_WAIST` (revolute).
2. Attach **R_shoulder** to **base** via joint `R_WAIST` (revolute).
3. Attach **L_upper_arm** to **L_shoulder** via joint `L_SHOULDER` (revolute).
4. Attach **R_upper_arm** to **R_shoulder** via joint `R_SHOULDER` (revolute).
5. Attach **L_forearm** to **L_upper_arm** via joint `L_ELBOW` (revolute).
6. Attach **R_forearm** to **R_upper_arm** via joint `R_ELBOW` (revolute).
7. Attach **L_wrist_pitch** to **L_forearm** via joint `L_FOREARM_roll` (revolute).
8. Attach **R_wrist_pitch** to **R_forearm** via joint `R_FOREARM_roll` (revolute).
9. Attach **L_wrist_roll** to **L_wrist_pitch** via joint `L_WRIST_pitch` (revolute).
10. Attach **R_wrist_roll** to **R_wrist_pitch** via joint `R_WRIST_pitch` (revolute).
11. Attach **L_gripper_base** to **L_wrist_roll** via joint `L_WRIST_roll` (revolute).
12. Attach **R_gripper_base** to **R_wrist_roll** via joint `R_WRIST_roll` (revolute).
13. Attach **L_gripper_jaw** to **L_gripper_base** via joint `L_GRIPPER` (prismatic).
14. Attach **R_gripper_jaw** to **R_gripper_base** via joint `R_GRIPPER` (prismatic).
