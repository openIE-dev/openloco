# Mechanical assembly

Root link(s): `base`

1. Attach **FL_hip_housing** to **base** via joint `FL_HIP_roll` (revolute).
2. Attach **FR_hip_housing** to **base** via joint `FR_HIP_roll` (revolute).
3. Attach **RL_hip_housing** to **base** via joint `RL_HIP_roll` (revolute).
4. Attach **RR_hip_housing** to **base** via joint `RR_HIP_roll` (revolute).
5. Attach **FL_upper_leg** to **FL_hip_housing** via joint `FL_HIP_pitch` (revolute).
6. Attach **FR_upper_leg** to **FR_hip_housing** via joint `FR_HIP_pitch` (revolute).
7. Attach **RL_upper_leg** to **RL_hip_housing** via joint `RL_HIP_pitch` (revolute).
8. Attach **RR_upper_leg** to **RR_hip_housing** via joint `RR_HIP_pitch` (revolute).
9. Attach **FL_lower_leg** to **FL_upper_leg** via joint `FL_KNEE_pitch` (revolute).
10. Attach **FR_lower_leg** to **FR_upper_leg** via joint `FR_KNEE_pitch` (revolute).
11. Attach **RL_lower_leg** to **RL_upper_leg** via joint `RL_KNEE_pitch` (revolute).
12. Attach **RR_lower_leg** to **RR_upper_leg** via joint `RR_KNEE_pitch` (revolute).
13. Attach **FL_foot** to **FL_lower_leg** via joint `FL_FOOT_mount` (fixed).
14. Attach **FR_foot** to **FR_lower_leg** via joint `FR_FOOT_mount` (fixed).
15. Attach **RL_foot** to **RL_lower_leg** via joint `RL_FOOT_mount` (fixed).
16. Attach **RR_foot** to **RR_lower_leg** via joint `RR_FOOT_mount` (fixed).
