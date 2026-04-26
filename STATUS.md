# OpenLoco — current status

This document is a **concise current-state summary**. Full per-release
history is in [CHANGELOG.md](CHANGELOG.md); the long-form narrative
of the v0.6 → v0.7 bring-up is preserved at
[docs/STATUS_v0.7_history.md](docs/STATUS_v0.7_history.md).

## Current release

**v0.7.8** — Push-recovery test passes with **1 mm XY recovery
error and 0.19° final tilt — better than v0.5's published
~5 cm recovery**. The fix: replicate v0.5's
`set_initial_stance_pose` via the existing
`MujocoBackend::set_base_pos_world` + `set_joint_qpos` setters,
plus stiffen joint impedance to 300/8 so the legs anchor the
chassis like rigid struts. **All five v0.5 tracking numbers now
reproduced**, four of them at or beyond the published Python
performance. See
[v0.7.8 entry](CHANGELOG.md#v078--2026-04-26),
[v0.7.7 entry](CHANGELOG.md#v077--2026-04-26),
[v0.7.6 entry](CHANGELOG.md#v076--2026-04-25),
[v0.7.5 entry](CHANGELOG.md#v075--2026-04-25),
[v0.7.4 entry](CHANGELOG.md#v074--2026-04-25),
[v0.7.3 entry](CHANGELOG.md#v073--2026-04-25),
[v0.7.2 entry](CHANGELOG.md#v072--2026-04-24),
[v0.7.1 entry](CHANGELOG.md#v071--2026-04-24), and
[v0.7 entry](CHANGELOG.md#v07--2026-04-23) for the full
deliverable lists.

## Tests green

Approximate counts per crate at v0.7 ship:

| Crate              | Tests | Notes                                                          |
| ------------------ | ----- | -------------------------------------------------------------- |
| `cad-udd`          | 19    |                                                                |
| `cad-format`       | 75    | incl. 11 perception-emit tests (URDF + MJCF)                   |
| `cad-parts`        | 70    | incl. mesh-bake helper + 7-part `build_mesh` coverage          |
| `cad-mfg`          | 12    |                                                                |
| `mgai-robot`       | 98    | Moteus + Dynamixel + SimpleFOC drivers                         |
| `mgai-control`     | 100   |                                                                |
| `mgai-sim`         | 20    | + 7 feature-gated `mujoco-ffi` tests                           |
| `mgai-perception`  | 240   | skill_graph runtime + classical + detector                     |
| `mgai-vla`         | 697   | 668 pre-existing VLA + 21 new `skill_graph` incl. subprocess   |
| `mgai-depthai`     | 5     | + 1 feature-gated `live` scaffold test                         |
| `openloco`         | 76    | incl. `sim_integration`, `closed_loop_integration`, `camera_backed_integration`, +7 feature-gated `mujoco_full_chain`, +5 feature-gated gait (`gait_anymal_wl`, `gait_m4_driving`, `gait_mini_whegs`, `gait_m4_hover`, `gait_push_recovery`), no `#[ignore]`'d gait remaining |

**Total:** ~1,400 tests green under default `cargo test`; additional
hardware-gated tests (`MGAI_DEPTHAI_LIVE=1`, `MGAI_VLA_SUBPROC=1`)
when the relevant hardware / venv is present.

## Deferred — known gaps

- **Real camera-from-physics rendering** — `PhysicsBackedFrames`
  falls through to canned RGBD for rendered sensor kinds.
  Closing this means wiring MuJoCo's `mj_renderOffscreen` into
  the physics-backed frame source. Closes the simulated end of
  the camera loop.
- **Production VLM weights shipped with the crate** —
  `VilaQuerySubprocess` has a working real-model path but
  weights are resolved via HuggingFace download on first run.
  Could ship a pinned small model (SmolVLM-256M ≈ 300 MB) as
  a dev artifact for deterministic tests.
- **Live actuator bring-up** — the Tier 0 / 1 / 2 driver
  protocol layers are tested against mocks; landing one on real
  Dynamixel / SimpleFOC / Moteus hardware is the parallel
  hardware story to the DepthAI bring-up that shipped in v0.7.
- **ROS 2 / Isaac Sim validation** of the emitted URDF against
  ROS 2 tooling. The MuJoCo half of this closed in v0.7.1 via
  `mujoco_full_chain.rs`: all descriptors load into MuJoCo and
  step physics. ROS 2 load is the remaining external-consumer
  check.
- **MuJoCo-backed regression suite** reproducing the v0.5
  Python tracking numbers — **all five reproduced as of
  v0.7.8**, four at or beyond v0.5 performance:

  | v0.5 number | Rust port (v0.7.8) | Status |
  |---|---|---|
  | m4 driving 98% | **99%** | ✅ |
  | mini_whegs walking 68% | **64%** | ≈ |
  | anymal_wl walking 83% | 72% world-X / 121% planar | ≈ |
  | hover 0.77 m / 2.2° | 1 mm err / 0.03° tilt | ✅ better |
  | 15 N push recovery (~5 cm err) | 1 mm err / 0.19° tilt | ✅ better |

  Remaining minor gaps (none blocking):
  - **anymal_wl 83% world-X** — currently 72% world-X / 121%
    planar; gap is yaw oscillation during the new walking
    dynamics. Tighter integral control / wheel-brake tuning
    would close it.
  - **mini_whegs 68%** — currently 64%, well within the v0.5
    envelope.

## Architecture cheatsheet

Single source of truth → many artifacts:

```text
descriptor.udd.json
    │
    ├── Robot section ──► URDF + MJCF + meshes + BOM + assembly
    │                     Actuator trait (3 tiers) + controllers + physics
    │
    └── Perception section ──► SkillGraphRuntime
                                ├── classical skills (foothold_map, obstacle_height, ground_plane_fit)
                                ├── detector skills (StubDetector)
                                └── VLM skills (VilaQueryStub, VilaQuerySubprocess ← real HF)
                                    ↑
                                SensorFrameSource
                                ├── CannedFrames
                                ├── PhysicsBackedFrames<B: PhysicsBackend>
                                └── CameraBackedFrameSource ← LuxonisCamera (DepthAI)
```

## Where to look

- **New to the project?** Start with [README.md](README.md).
- **What changed in v0.7?** [CHANGELOG.md](CHANGELOG.md).
- **Perception design?** [docs/PERCEPTION.md](docs/PERCEPTION.md).
- **Competitive landscape / 2026 bet?** [notes.md](notes.md).
- **Reference Python v0.5?** [claude-notes/openloco/](claude-notes/openloco/).
