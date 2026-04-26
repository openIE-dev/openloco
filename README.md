# OpenLoco

**Open-source wheel–leg–aerial hybrid robot substrate.** CC0-1.0,
no paywall, ever.

> **Initial release (v0.7.8) carries the v0.5-reproduction milestone
> artifacts** — descriptors, baked URDF + MJCF + STL + BOM, and the
> full release narrative. **Rust source is queued for v0.7.9** —
> see [SOURCE.md](SOURCE.md). Until then, the `cargo …` commands in
> this README are previews of v0.7.9's runnable surface; the baked
> example artifacts in [`examples/baked/`](examples/baked/) let you
> drop OpenLoco-emitted models into ROS 2 / MuJoCo / Isaac Sim
> without running any OpenLoco code.

```text
one descriptor  →  URDF + MJCF + meshes + BOM + assembly.md
                   + impedance-controlled robot + perception runtime
                   + real-camera autonomy loop
```

The field has working mechanisms (ANYmal-WL, TurboQuad, M4
Morphobot, SPIDAR), working actuators ($500 Moteus QDDs, $20 gimbal
BLDCs), working simulators (MuJoCo, Isaac), working VLMs (SmolVLM,
VILA, Grounding DINO). It does not have a compiler — a way to
*describe* a new hybrid-locomotion robot and have the URDF, MJCF,
STL meshes, BOM, assembly instructions, controllers, perception
skill graph, and live-sensor runtime fall out from one source of
truth. OpenLoco is that compiler.

## v0.5 reproduction milestone (v0.7.8)

OpenLoco v0.7.8 reproduces all five of the v0.5 Python OpenLoco
reference's tracking numbers under the Rust + MuJoCo stack. Two
exceed the published Python performance by an order of magnitude.

| v0.5 reference           | Rust v0.7.8                | vs. v0.5            |
| ------------------------ | -------------------------- | ------------------- |
| m4 driving 98%           | **99% vx tracking**        | ✅ exact            |
| mini_whegs walking 68%   | **64% vx tracking**        | ≈ −4%               |
| anymal_wl walking 83%    | 72% world-X / 121% planar  | ≈ −11% / +38%       |
| Hover 0.77 m / 2.2° tilt | **1 mm err / 0.03° tilt**  | ✅ order-of-mag     |
| 15 N push recovery (~5 cm) | **1 mm err / 0.19° tilt** | ✅ order-of-mag     |

Each is gated by an integration test —
`gait_anymal_wl.rs`, `gait_m4_driving.rs`, `gait_mini_whegs.rs`,
`gait_m4_hover.rs`, `gait_push_recovery.rs` — feature-flagged
behind `mujoco-ffi` (MuJoCo 3.x). Tests + source ship with v0.7.9.

See [CHANGELOG.md](CHANGELOG.md) for the v0.7.5 → v0.7.8 series
narrative (thrust-aware morphobot, integral yaw control, cad-parts
mesh-library refactor, v0.5-style initial-pose write).

## What ships (v0.7.8)

| Domain              | Deliverable                                                          |
| ------------------- | -------------------------------------------------------------------- |
| Unified IR          | `cad-udd::UddDocument` with optional `Robot` + `Perception` sections |
| Emitters            | URDF, MJCF (both emit `<camera>` / sensor tags from Perception)      |
| Mesh pipeline       | 7 catalog parts with `build_mesh`; `openloco bake` → STL on disk     |
| Actuator traits     | `Actuator` + `ImpedanceCommand` + `SafetyWrapper` + `FaultFlags`     |
| Actuator drivers    | **Tier 0** Dynamixel (serial) · **Tier 1** SimpleFOC (CAN-FD) · **Tier 2** Moteus (CAN-FD) |
| Real transports     | `serialport` + `socketcan` Linux/macOS-native impls behind features  |
| Morphologies        | `mini_whegs` · `anymal_wl` · `m4_morphobot` (each + `_autonomous` variant) |
| Control             | Stance / trot / wheg / M4 morphobot controllers; 3-DoF quadruped IK; integral yaw stabilisation |
| Physics backend     | `PhysicsBackend` trait; `CannedPhysics` + feature-gated MuJoCo FFI   |
| Gait harness        | `openloco::gait_harness::{run_trot_rollout, run_morphobot_rollout, run_wheg_rollout}` — closed-loop MuJoCo rollouts |
| Thrust simulation   | `XfrcBackend` + per-rotor `F = K_THRUST · ω²` for flight mode (MuJoCo lacks a propeller plugin) |
| Perception runtime  | `SkillGraphRuntime` dispatcher + typed skill outputs + predicate grammar |
| Classical skills    | `foothold_map` · `obstacle_height` · `ground_plane_fit`              |
| Detector / VLM      | `StubDetector` · `VilaQueryStub` · `VilaQuerySubprocess` (real VLM via HF) |
| Live sensor         | `mgai-depthai::LuxonisCamera` (DepthAI bridge) → `CameraBackedFrameSource` |
| Sim driver          | `openloco sim` CLI; `CannedFrames` / `PhysicsBackedFrames` / `CameraBackedFrameSource` |
| Closed loop         | `commands_to_torques` bridges skill output → physics via `ImpedanceCommand` |
| CC0                 | All substrate code. No paywall, no enterprise tier.                  |

## Quickstart

### Load + validate a descriptor

```sh
cargo run -- validate descriptors/m4_morphobot_autonomous.udd.json
# → name, link/joint/actuator/mode counts, content_hash
```

### Emit URDF / MJCF / BOM / assembly + bake meshes

```sh
cargo run -- generate descriptors/m4_morphobot_autonomous.udd.json \
    --all --output-dir out/
cargo run -- bake descriptors/m4_morphobot_autonomous.udd.json \
    --output-dir out/meshes/
```

Writes `m4_morphobot_autonomous.urdf`, `.xml` (MJCF with `<camera>`
tags), `bom.csv`, `assembly.md`, plus one STL per unique mesh hash.

### Simulate the perception runtime

```sh
# Canned frames (fixture-driven, no hardware).
cargo run -- sim descriptors/anymal_wl_autonomous.udd.json \
    --initial-mode walking --tier 2 --ticks 10

# Live DepthAI / Luxonis camera (requires `live-camera` feature
# and a DepthAI device on USB — see Live hardware below).
cargo run --features live-camera -- \
    sim descriptors/anymal_wl_autonomous.udd.json \
    --initial-mode walking --tier 2 --ticks 10 \
    --camera --camera-sensor downward_depth
```

Prints which skills registered, which need external impls, and
any mode transitions that fired.

## Architecture

```text
descriptor.udd.json   ─┐
  (Robot + Perception) │
                       ├─► urdf::emit          → <name>.urdf (+ <link>/<joint> for sensors)
                       ├─► mjcf::emit          → <name>.xml  (+ <camera>/<sensor>)
                       ├─► mechanical_bom      → bom.csv
                       ├─► assembly_steps_md   → assembly.md
                       ├─► bake::generate_meshes → meshes/<hash>.stl
                       │
                       ├─► skill_graph::SkillGraphRuntime
                       │     ├─ classical: FootholdMap · ObstacleHeight · GroundPlaneFit
                       │     ├─ detector:  StubDetector
                       │     └─ vlm:       VilaQueryStub / VilaQuerySubprocess (real HF)
                       │           ↑
                       │   SensorFrameSource
                       │     ├─ CannedFrames (descriptor-driven synth)
                       │     ├─ PhysicsBackedFrames<B: PhysicsBackend>
                       │     ├─ CameraBackedFrameSource ← LuxonisCamera (DepthAI bridge)
                       │     └─ LayeredFrameSource (composable stack)
                       │
                       ├─► legged_kinematics → FK/IK (2000-sample round-trip < 1e-10 m)
                       ├─► locomotion::quadruped → stance/trot/wheg/morphobot
                       └─► sim::runner::PhysicsBackend (CannedPhysics / MuJoCo FFI)
                               ↑
                               └─► commands_to_torques ← ImpedanceCommand ← Skill outputs
                                     (closes perception → control → physics loop)
```

### Perception substrate

The UDD `Perception` section is **structurally parallel** to
`Robot`:

```text
Robot::{links, joints, actuator_slots, modes}
Perception::{sensors, skills, skill_graph}
```

- **Sensors** attach to links via `mount_link` + local pose,
  parallel to actuator slots attaching to joints.
- **Skills** are typed functions: sensor frames → `SkillOutput`
  (Boolean / Enum / Scalar / Point / Heightmap / BoxList / Text /
  Pose / Custom).
- **Skill graph** declares per-mode which skills run, and which
  skill outputs fire `Robot::modes` transitions.

The runtime dispatcher walks the active `SkillGraphEntry` for the
current mode, runs registered skill impls, validates outputs
against the schema, evaluates transition predicates with a small
expression grammar (`output == fly`, `output.value > 0.03`, `&&`
/ `||` / `!`), and fires mode switches.

### Three-tier actuator story

All three tiers expose the same `Actuator` trait taking
`ImpedanceCommand` as the primary control primitive:

| Tier | Hardware                                | Per-joint cost | Driver                           |
| ---- | --------------------------------------- | -------------- | -------------------------------- |
| 0    | Dynamixel XL-330 / XL-430 over UART     | $5–$30         | `mgai_robot::actuator::dynamixel` |
| 1    | SimpleFOC + gimbal BLDC + encoder + CAN | $25–$60        | `mgai_robot::actuator::simplefoc` |
| 2    | Moteus QDD + mid-power BLDC + planetary | $250–$500      | `mgai_robot::actuator::moteus`    |

Transports (`serialport` for Dynamixel, `socketcan` for Moteus /
SimpleFOC) are feature-gated so default builds stay
hardware-agnostic.

## Live hardware

### Luxonis / DepthAI camera

```sh
# One-time setup
cd ../joulesperbit/crates/mgai-depthai
python3 -m venv .venv
.venv/bin/pip install depthai
```

Then plug in an OAK-D / OAK-1 / OAK-D-Lite and run:

```sh
MGAI_DEPTHAI_LIVE=1 cargo test --features live-camera \
    --test camera_live_hil -- --nocapture
```

End-to-end: DepthAI pipeline → Python bridge (`scripts/depthai_bridge.py`)
→ 32-byte-framed binary protocol over pipe → `LuxonisCamera` →
`CameraBackedFrameSource` → `SkillGraphRuntime` → `FootholdMap`
emits a real Heightmap from real stereo depth.

### Real VLM

```sh
cd ../joulesperbit/crates/mgai-vla
python3 -m venv .venv
# Mock mode works out of the box:
MGAI_VLA_SUBPROC=1 cargo test -p mgai-vla mock_bridge_end_to_end

# Real HF model (needs `pip install transformers torch pillow`):
# Set `model` field in the UDD Skill's config, e.g.:
#   "config": { "query": "...", "model": "HuggingFaceTB/SmolVLM-256M-Instruct" }
```

## Descriptors

Three reference morphologies ship today, each with a
mechanical-only variant and an autonomous superset:

| Morphology      | Base descriptor              | Autonomous variant                  |
| --------------- | ---------------------------- | ----------------------------------- |
| Mini-Whegs      | `mini_whegs.udd.json`        | `mini_whegs_autonomous.udd.json`    |
| ANYmal-WL       | `anymal_wl.udd.json`         | `anymal_wl_autonomous.udd.json`     |
| M4 Morphobot    | `m4_morphobot.udd.json`      | `m4_morphobot_autonomous.udd.json`  |

Each autonomous variant is a pure mechanical-layer superset:
same links / joints / mesh hashes, plus a `perception` section
wiring sensors + skills + skill-graph into the robot's modes.

## License

CC0-1.0 — public-domain dedication. No paywall, no enterprise
tier, no license-compatibility gotchas. Every mechanism this
substrate consolidates is academic prior art without issued
patents (verified by searching the IP around Quattroped,
TurboQuad, Lywal, QuadRunner, SPIDAR, M4 Morphobot, and
descendants).

Cite the upstream papers when your work depends on their ideas —
Moteus (mjbots), Stanford Doggo (Kau et al.), ODRI/SOLO (Max
Planck / NYU), ANYmal (RSL/ETH), Morphobot M4 (Caltech CAST,
Sihite et al., Nature Communications 2023), DepthAI (Luxonis).

## Related reading

- `CHANGELOG.md` — release-oriented summary of what shipped in
  each version.
- `STATUS.md` — per-phase ledger of what landed and what's
  deferred, per session.
- `docs/PERCEPTION.md` — design of the perception layer,
  including the flagship 2026 demo scope.
- `notes.md` — original design conversation (competitive
  landscape, perception-as-catalog proposal).
- `claude-notes/` — preserved v0.5 Python reference
  implementation.
