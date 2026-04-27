---
title: Videos
nav_order: 2
---

# Videos
{: .fs-9 }

35 short-form videos covering OpenLoco end-to-end — what it is, why it
exists, the catalog, and the underlying robotics stack. ~50 minutes of
content, snackable in 60–110 second pieces.
{: .fs-6 .fw-300 }

---

## What is OpenLoco?

The hero video — what the project is and does, in 90 seconds.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s1.mp4" type="video/mp4">
</video>

---

## Robotics in 90 seconds

Three flagship explainers. Top-of-funnel, designed for sharing.

### What is a robot, actually?
The sense-plan-act loop. The body-brain-senses triad.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s2a.mp4" type="video/mp4">
</video>

### Why is robotics hard?
The integration tax. Seven disciplines that don't talk to each other.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s2b.mp4" type="video/mp4">
</video>

### What's open in robotics today?
The free + open reference material — textbooks, simulators, hardware,
courses. See the [Learn page](learn.html) for the full index.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s2c.mp4" type="video/mp4">
</video>

---

## The Whole Stack

13 chapters — one per layer of robotics. Mechanism through morphology
playbooks. ~17 minutes total if watched straight through.

### Ch. 1 — Mechanism
Links, joints, kinematic chains. Why morphology decisions cascade
downstream.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_01.mp4" type="video/mp4">
</video>

### Ch. 2 — Actuators
DC, BLDC, FOC, gear reduction. Tier 0 / Tier 1 / Tier 2.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_02.mp4" type="video/mp4">
</video>

### Ch. 3 — Power + Electronics
Battery chemistry, voltage rails, communication buses.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_03.mp4" type="video/mp4">
</video>

### Ch. 4 — Kinematics + Dynamics
FK, IK, Jacobians, the manipulator equation.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_04.mp4" type="video/mp4">
</video>

### Ch. 5 — Control
PID → impedance → MPC → whole-body control.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_05.mp4" type="video/mp4">
</video>

### Ch. 6 — Planning
Sampling-based vs. search-based vs. trajectory optimization.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_06.mp4" type="video/mp4">
</video>

### Ch. 7 — Perception
Sensors, fusion, SLAM, foundation models as perception modules.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_07.mp4" type="video/mp4">
</video>

### Ch. 8 — State Estimation
EKF / UKF / particle filters. Sensor fusion into one workable belief.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_08.mp4" type="video/mp4">
</video>

### Ch. 9 — Simulation
MuJoCo, Drake, Brax, Isaac. The sim-to-real gap.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_09.mp4" type="video/mp4">
</video>

### Ch. 10 — RL + learning-based control
When to use RL, when not. Reward shaping. Common failure modes.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_10.mp4" type="video/mp4">
</video>

### Ch. 11 — Software architecture
ROS 2 vs. custom. Real-time vs. best-effort. Embedded vs. host.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_11.mp4" type="video/mp4">
</video>

### Ch. 12 — Integration
Calibration, manufacturing tolerance, the deployment gap.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_12.mp4" type="video/mp4">
</video>

### Ch. 13 — Morphology playbooks
Quadruped / biped / manipulator / drone / hybrid: standard stack per type.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s3_13.mp4" type="video/mp4">
</video>

---

## Meet the 16

One short per descriptor in the catalog. ~50 seconds each.

### Stanford Pupper
Hobbyist BLDC quadruped, ~0.4 kg.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_01.mp4" type="video/mp4">
</video>

### Solo 12
ODR research-grade brushless quadruped, ~2.5 kg.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_02.mp4" type="video/mp4">
</video>

### Mini Pupper
Mangdang's mass-produced consumer kit, ~0.7 kg.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_03.mp4" type="video/mp4">
</video>

### MIT Mini Cheetah
Dynamic-locomotion benchmark, ~9 kg.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_04.mp4" type="video/mp4">
</video>

### Boston Dynamics Spot
Public URDF, ~32 kg. Closed system, partly opened.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_05.mp4" type="video/mp4">
</video>

### ANYmal-WL
Wheel-leg hybrid quadruped. Walking and driving modes.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_06.mp4" type="video/mp4">
</video>

### ANYmal-WL Autonomous
Same chassis plus RGBD perception and skill graph.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_07.mp4" type="video/mp4">
</video>

### M4 Morphobot
Caltech air-ground hybrid. Walks, drives, flies.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_08.mp4" type="video/mp4">
</video>

### M4 Autonomous
Same chassis plus VLM mode-selection.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_09.mp4" type="video/mp4">
</video>

### Mini-Whegs
3-spoke wheg appendages. Cockroach-style emergent gait.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_10.mp4" type="video/mp4">
</video>

### Mini-Whegs Autonomous
Same chassis plus obstacle-height perception.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_11.mp4" type="video/mp4">
</video>

### Upkie
Wheeled biped. LQR-balanced. First non-quadruped in the catalog.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_12.mp4" type="video/mp4">
</video>

### SO-100
LeRobot's $110 6-DoF arm. Most-installed open arm.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_13.mp4" type="video/mp4">
</video>

### ALOHA
Stanford bimanual rig. Twin Trossen ViperX 300, 14 DoF.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_14.mp4" type="video/mp4">
</video>

### Reachy 2
Pollen humanoid upper body. Head + neck + 2 × 7-DoF arms.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_15.mp4" type="video/mp4">
</video>

### Crazyflie
Bitcraze nano quadcopter, ~27 g. First pure aerial in the catalog.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s4_16.mp4" type="video/mp4">
</video>

---

## Descriptor → running robot

Two process demos showing what the OpenLoco pipeline actually does.

### From descriptor to running robot
Edit JSON, recompile, watch URDF reload, MJCF spin up in MuJoCo,
controller track.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s5a.mp4" type="video/mp4">
</video>

### Morphology matters
Same descriptor schema, swap the body — and behavior changes
completely.

<video controls preload="metadata" width="100%" style="max-width: 960px">
  <source src="assets/videos/s5b.mp4" type="video/mp4">
</video>

---

## Production notes

- **Voice:** ElevenLabs George (warm storyteller, voice-locked across
  the openIE family).
- **Backgrounds:** BFL Flux 2 Pro — workshop / engineering bench
  aesthetic, amber on charcoal.
- **Animations:** Manim (community v0.20). Diagrammatic overlays for
  descriptor structure, fan-out emit, control loops, morphology grids.
- **Compositing:** ffmpeg — Ken Burns slow zoom on stills, Manim
  alpha-blended at 88% opacity, narration-locked durations.
- **Total runtime:** ~50 minutes across 35 videos.
