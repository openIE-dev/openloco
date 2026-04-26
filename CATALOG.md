# Descriptor catalog

Sixteen robots in OpenLoco's UDD format as of v0.7.8, spanning
five morphology families. Every entry has a hand-authored
[descriptor](descriptors/) plus pre-emitted artifacts in
[`examples/baked/`](examples/baked/). Drop the URDF or MJCF
straight into your sim — no OpenLoco binary required.

## Quadrupeds with feet

Classic 12-DoF (3 per leg) wheel-less quadrupeds. Hip-roll →
hip-pitch → knee-pitch chain terminating in a fixed foot.

| Descriptor | Origin | Tier | Mass | Notes |
| --- | --- | --- | --- | --- |
| [`stanford_pupper`](descriptors/stanford_pupper.udd.json) | Stanford Robotics Club | 0 | ~0.4 kg | Hobbyist BLDC; community-port |
| [`solo12`](descriptors/solo12.udd.json) | ODR (BSD-3) | 1 | ~2.5 kg | Research-grade brushless; community-port |
| [`mini_pupper`](descriptors/mini_pupper.udd.json) | Mangdang | 0 | ~0.7 kg | Mass-produced consumer kit; community-port |
| [`mini_cheetah`](descriptors/mini_cheetah.udd.json) | MIT BRL (via chvmp/champ) | 2 | ~9 kg | Dynamic-locomotion benchmark; community-port |
| [`spot`](descriptors/spot.udd.json) | Boston Dynamics (public URDF) | 2* | ~32 kg | Public URDF; placeholder actuators (real Spot motors are proprietary); community-port |

## Wheel-leg quadrupeds

Quadrupeds with continuous-drive wheels at each foot. Walking +
driving modes.

| Descriptor | Origin | Tier | Mass | Notes |
| --- | --- | --- | --- | --- |
| [`anymal_wl`](descriptors/anymal_wl.udd.json) | OpenLoco original | 2 | ~7 kg | ANYmal-class; both modes pass v0.5 tracking benchmarks |
| [`anymal_wl_autonomous`](descriptors/anymal_wl_autonomous.udd.json) | OpenLoco original | 2 | ~7 kg | + RGBD + skill graph for foothold-map perception |

## Air-ground hybrids

Quadrupeds whose appendages double as wheels (UGV mode) and
rotors (UAS mode). Walking + flying modes.

| Descriptor | Origin | Tier | Mass | Notes |
| --- | --- | --- | --- | --- |
| [`m4_morphobot`](descriptors/m4_morphobot.udd.json) | Caltech M4 (port) | 2 | ~3.6 kg | First public CC0 implementation of the Caltech M4 morphology |
| [`m4_morphobot_autonomous`](descriptors/m4_morphobot_autonomous.udd.json) | OpenLoco original | 2 | ~3.6 kg | + VLM mode-selection skill graph |

## Wheg locomotion

Three-spoke "wheg" appendages for cockroach-style emergent gaits.

| Descriptor | Origin | Tier | Mass | Notes |
| --- | --- | --- | --- | --- |
| [`mini_whegs`](descriptors/mini_whegs.udd.json) | OpenLoco original (CWRU style) | 0 | ~0.4 kg | 3-spoke wheg crawl |
| [`mini_whegs_autonomous`](descriptors/mini_whegs_autonomous.udd.json) | OpenLoco original | 0 | ~0.4 kg | + obstacle-height perception |

## Wheeled bipeds

Two-leg morphology, each leg ending in a continuous-drive wheel.
LQR-balanced (inverted-pendulum control).

| Descriptor | Origin | Tier | Mass | Notes |
| --- | --- | --- | --- | --- |
| [`upkie`](descriptors/upkie.udd.json) | upkie/upkie (Apache-2.0) | 2 | ~5 kg | First non-quadruped morphology in catalog; L/R corners, no FL/FR/RL/RR |

## Manipulation arms

Single or dual serial arms terminating in a parallel gripper.
Manipulation mode (no locomotion).

| Descriptor | Origin | Tier | DoF | Notes |
| --- | --- | --- | --- | --- |
| [`so100`](descriptors/so100.udd.json) | The Robot Studio + LeRobot | 0 | 6 | Most-installed open arm; ~$110 build; community-port |
| [`aloha`](descriptors/aloha.udd.json) | Stanford / LeRobot (Trossen ViperX 300 ×2) | 0/1 | 14 (2×7) | Bimanual teleoperation rig; community-port |
| [`reachy2`](descriptors/reachy2.udd.json) | Pollen Robotics | 0/1 | 18 | Humanoid upper body (head + neck + 2 × 7-DoF arms); community-port |

## Aerial-only

Pure UAS, no legs, no wheels.

| Descriptor | Origin | Tier | Mass | Notes |
| --- | --- | --- | --- | --- |
| [`crazyflie`](descriptors/crazyflie.udd.json) | Bitcraze (BSD-3) | 0 | ~27 g | Nano quadcopter; first pure-aerial morphology in catalog; community-port |

---

## How to use a descriptor

```bash
# Inspect the schema:
cat descriptors/anymal_wl.udd.json

# The compiler-emitted artifacts (URDF + MJCF + BOM + assembly):
ls examples/baked/anymal_wl/
```

The descriptor is the source of truth. Every artifact in
`examples/baked/<robot>/` was generated *from* the descriptor by
the OpenLoco v0.7.8 compiler — the URDF for ROS 2 / RViz / Gazebo
consumers, the MJCF for MuJoCo / MJX, the BOM for fabrication,
the Markdown for assembly. No further tooling required to *use*
these artifacts.

To *modify* a robot, edit its `.udd.json` and recompile (see
[HOW_IT_WORKS.md](HOW_IT_WORKS.md) for the v0.7.8 → v0.7.9 source
release plan).

## Caveats

- Community-port descriptors carry **approximate** inertia tensors
  and joint origin offsets adapted from each project's published
  URDF / CAD. They emit valid URDFs that load cleanly in ROS 2
  and valid MJCFs intended for MuJoCo, but haven't been
  individually verified in physics-stability tests on the v0.7.8
  toolchain. The original-OpenLoco descriptors (anymal_wl,
  m4_morphobot, mini_whegs and their `_autonomous` variants) **are**
  verified — they pass the v0.7.8 gait + push-recovery + hover
  tracking benchmarks, reproducing the v0.5 Python reference
  numbers (and beating two of them by an order of magnitude).
- Spot's actuator dynamics are placeholder Tier 2 — the real
  Spot motors are proprietary and undocumented.

Want a robot that's not in the catalog? Open an issue or send a
PR with a hand-authored `.udd.json`. The schema is small enough
that a 12-DoF quadruped is ~150 lines of JSON.
