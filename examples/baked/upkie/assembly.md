# Mechanical assembly

Root link(s): `base`

1. Attach **L_upper_leg** to **base** via joint `L_HIP_pitch` (revolute).
2. Attach **R_upper_leg** to **base** via joint `R_HIP_pitch` (revolute).
3. Attach **L_lower_leg** to **L_upper_leg** via joint `L_KNEE_pitch` (revolute).
4. Attach **R_lower_leg** to **R_upper_leg** via joint `R_KNEE_pitch` (revolute).
5. Attach **L_wheel** to **L_lower_leg** via joint `L_WHEEL_drive` (continuous).
6. Attach **R_wheel** to **R_lower_leg** via joint `R_WHEEL_drive` (continuous).
