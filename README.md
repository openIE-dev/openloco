# OpenLoco

Open-source schema + compiler for hybrid robots. One descriptor
emits URDF, MJCF, STL meshes, BOM, and assembly instructions.

**Site:** [openie-dev.github.io/openloco](https://openie-dev.github.io/openloco/)
**License:** CC0-1.0 (public domain)

## What's here

```
descriptors/        16 robots in OpenLoco's UDD descriptor format
examples/baked/     pre-emitted URDF + MJCF + BOM + assembly per robot
CATALOG.md          full robot index, grouped by morphology
HOW_IT_WORKS.md     descriptor → URDF/MJCF/STL/BOM walkthrough
LEARN.md            curated index of free + open robotics references
SOURCE.md           Rust source release plan
```

## Catalog

Sixteen robots across seven morphology families:

- **Quadrupeds with feet** — Stanford Pupper, Solo 12, Mini Pupper, MIT Mini Cheetah, Boston Dynamics Spot
- **Wheel-leg quadrupeds** — ANYmal-WL (+ autonomous variant)
- **Air-ground hybrids** — Caltech M4 Morphobot (+ autonomous variant)
- **Wheg locomotion** — Mini-Whegs (+ autonomous variant)
- **Wheeled bipeds** — Upkie
- **Manipulation arms** — SO-100, ALOHA, Reachy 2
- **Aerial-only** — Crazyflie

See [CATALOG.md](CATALOG.md) for the full table with origin, tier,
mass, and notes per robot.

## Drop-in artifacts

```sh
git clone https://github.com/openIE-dev/openloco
ls openloco/examples/baked/anymal_wl/
# anymal_wl.urdf   →  ROS 2 / RViz / Gazebo
# anymal_wl.xml    →  MuJoCo / MJX
# bom.csv          →  fabrication parts list
# assembly.md      →  build instructions
```

No OpenLoco binary needed to *use* these — they're plain URDF /
MJCF / CSV / Markdown.

## Modify a robot

The descriptor is the source of truth. Every artifact under
`examples/baked/<robot>/` was generated *from*
`descriptors/<robot>.udd.json` by the OpenLoco compiler. To change
a robot, edit the descriptor and recompile.

The schema is small enough that a 12-DoF quadruped is ~150 lines
of JSON:

```json
{
  "schema_version": 1,
  "meta":  { "name": "anymal_wl", "units_length": "Metre" },
  "robot": {
    "links":          [ ... ],
    "joints":         [ ... ],
    "actuator_slots": [ ... ],
    "modes":          [ ... ]
  }
}
```

See [HOW_IT_WORKS.md](HOW_IT_WORKS.md) for the descriptor → emit
pipeline and an end-to-end gait test walkthrough. Source for the
compiler itself is on the way — see [SOURCE.md](SOURCE.md).

## Architecture

```text
descriptor.udd.json   ─┐
                       ├─► urdf::emit          → <name>.urdf
                       ├─► mjcf::emit          → <name>.xml
                       ├─► mechanical_bom      → bom.csv
                       ├─► assembly_steps_md   → assembly.md
                       ├─► bake::generate_meshes → meshes/<hash>.stl
                       │
                       ├─► skill_graph::SkillGraphRuntime
                       │     ├─ classical: FootholdMap · ObstacleHeight · GroundPlaneFit
                       │     ├─ detector:  StubDetector
                       │     └─ vlm:       VilaQueryStub / VilaQuerySubprocess
                       │
                       ├─► legged_kinematics → FK/IK
                       ├─► locomotion::quadruped → stance/trot/wheg/morphobot
                       └─► sim::runner::PhysicsBackend (CannedPhysics / MuJoCo FFI)
```

The UDD `Perception` section is structurally parallel to `Robot`:

```text
Robot::{links, joints, actuator_slots, modes}
Perception::{sensors, skills, skill_graph}
```

Sensors attach to links via `mount_link` + local pose, parallel to
actuator slots attaching to joints. Skills are typed functions —
sensor frames in, structured output (Boolean / Heightmap / BoxList /
Pose / etc.) out. The skill graph declares which skills run per
mode and which skill outputs fire mode transitions.

## Three-tier actuator story

All three tiers expose the same `Actuator` trait taking
`ImpedanceCommand` as the primary control primitive:

| Tier | Hardware                                | Per-joint cost |
| ---- | --------------------------------------- | -------------- |
| 0    | Dynamixel XL-330 / XL-430 over UART     | $5–$30         |
| 1    | SimpleFOC + gimbal BLDC + encoder + CAN | $25–$60        |
| 2    | Moteus QDD + mid-power BLDC + planetary | $250–$500      |

Transports (`serialport` for Dynamixel, `socketcan` for Moteus /
SimpleFOC) are feature-gated so default builds stay
hardware-agnostic.

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

## Contributing

Want a robot that's not in the catalog? Open an issue or send a
PR with a hand-authored `.udd.json`.
