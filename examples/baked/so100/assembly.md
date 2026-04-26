# Mechanical assembly

Root link(s): `base`

1. Attach **shoulder_pan** to **base** via joint `SHOULDER_pan` (revolute).
2. Attach **shoulder_lift** to **shoulder_pan** via joint `SHOULDER_lift` (revolute).
3. Attach **elbow** to **shoulder_lift** via joint `ELBOW_flex` (revolute).
4. Attach **wrist_flex** to **elbow** via joint `WRIST_flex` (revolute).
5. Attach **wrist_roll** to **wrist_flex** via joint `WRIST_roll` (revolute).
6. Attach **gripper_base** to **wrist_roll** via joint `GRIPPER_mount` (fixed).
7. Attach **gripper_jaw** to **gripper_base** via joint `GRIPPER` (prismatic).
