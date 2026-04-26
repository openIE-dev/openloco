# Mechanical assembly

Root link(s): `base`

1. Attach **FL_hip_roll_housing** to **base** via joint `FL_HIP_roll` (revolute).
2. Attach **FR_hip_roll_housing** to **base** via joint `FR_HIP_roll` (revolute).
3. Attach **RL_hip_roll_housing** to **base** via joint `RL_HIP_roll` (revolute).
4. Attach **RR_hip_roll_housing** to **base** via joint `RR_HIP_roll` (revolute).
5. Attach **FL_hip_pitch_housing** to **FL_hip_roll_housing** via joint `FL_HIP_bracket` (fixed).
6. Attach **FR_hip_pitch_housing** to **FR_hip_roll_housing** via joint `FR_HIP_bracket` (fixed).
7. Attach **RL_hip_pitch_housing** to **RL_hip_roll_housing** via joint `RL_HIP_bracket` (fixed).
8. Attach **RR_hip_pitch_housing** to **RR_hip_roll_housing** via joint `RR_HIP_bracket` (fixed).
9. Attach **FL_upper_leg** to **FL_hip_pitch_housing** via joint `FL_HIP_pitch` (revolute).
10. Attach **FR_upper_leg** to **FR_hip_pitch_housing** via joint `FR_HIP_pitch` (revolute).
11. Attach **RL_upper_leg** to **RL_hip_pitch_housing** via joint `RL_HIP_pitch` (revolute).
12. Attach **RR_upper_leg** to **RR_hip_pitch_housing** via joint `RR_HIP_pitch` (revolute).
13. Attach **FL_knee_housing** to **FL_upper_leg** via joint `FL_KNEE_mount` (fixed).
14. Attach **FR_knee_housing** to **FR_upper_leg** via joint `FR_KNEE_mount` (fixed).
15. Attach **RL_knee_housing** to **RL_upper_leg** via joint `RL_KNEE_mount` (fixed).
16. Attach **RR_knee_housing** to **RR_upper_leg** via joint `RR_KNEE_mount` (fixed).
17. Attach **FL_lower_leg** to **FL_knee_housing** via joint `FL_KNEE_pitch` (revolute).
18. Attach **FR_lower_leg** to **FR_knee_housing** via joint `FR_KNEE_pitch` (revolute).
19. Attach **RL_lower_leg** to **RL_knee_housing** via joint `RL_KNEE_pitch` (revolute).
20. Attach **RR_lower_leg** to **RR_knee_housing** via joint `RR_KNEE_pitch` (revolute).
21. Attach **FL_wheel** to **FL_lower_leg** via joint `FL_WHEEL_drive` (continuous).
22. Attach **FR_wheel** to **FR_lower_leg** via joint `FR_WHEEL_drive` (continuous).
23. Attach **RL_wheel** to **RL_lower_leg** via joint `RL_WHEEL_drive` (continuous).
24. Attach **RR_wheel** to **RR_lower_leg** via joint `RR_WHEEL_drive` (continuous).
