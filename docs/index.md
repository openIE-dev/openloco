---
title: Home
layout: home
nav_order: 1
---

# OpenLoco
{: .fs-9 }

Open-source schema + compiler for hybrid robots. One descriptor
emits URDF, MJCF, STL meshes, BOM, and assembly instructions.
{: .fs-6 .fw-300 }

[Watch the videos](videos.html){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View the catalog](catalog.html){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[GitHub](https://github.com/openIE-dev/openloco){: .btn .fs-5 .mb-4 .mb-md-0 }

<video controls preload="metadata" width="100%" style="max-width: 960px; margin-top: 1.5em">
  <source src="assets/videos/s1.mp4" type="video/mp4">
</video>

## What you get

**16 robots** in OpenLoco's UDD descriptor format, spanning seven
morphology families:

- **Quadrupeds with feet** — Stanford Pupper, Solo 12, Mini Pupper, MIT Mini Cheetah, Boston Dynamics Spot
- **Wheel-leg quadrupeds** — ANYmal-WL (+ autonomous variant)
- **Air-ground hybrids** — Caltech M4 Morphobot (+ autonomous variant)
- **Wheg locomotion** — Mini-Whegs (+ autonomous variant)
- **Wheeled bipeds** — Upkie
- **Manipulation arms** — SO-100, ALOHA, Reachy 2
- **Aerial-only** — Crazyflie

Every entry has a hand-authored
[descriptor](https://github.com/openIE-dev/openloco/tree/main/descriptors)
plus pre-emitted artifacts in
[`examples/baked/`](https://github.com/openIE-dev/openloco/tree/main/examples/baked):
URDF, MJCF, BOM, assembly. Drop them straight into ROS 2,
MuJoCo, or Isaac Sim.

## Use a descriptor

```sh
git clone https://github.com/openIE-dev/openloco
cd openloco/examples/baked/anymal_wl
# anymal_wl.urdf       — load in ROS 2 / RViz / Gazebo
# anymal_wl.xml        — load in MuJoCo / MJX
# bom.csv              — fabrication parts list
# assembly.md          — build instructions
```

[How the compiler works →](how-it-works.html)

## Modify a descriptor

The descriptor is the source of truth. Every artifact under
`examples/baked/` was generated *from* the descriptor by
the OpenLoco compiler. To modify a robot, edit its `.udd.json`
and recompile.

The schema is small: a 12-DoF quadruped is ~150 lines of JSON.

```json
{
  "schema_version": 1,
  "meta": { "name": "anymal_wl", "units_length": "Metre" },
  "robot": {
    "links":  [ ... ],
    "joints": [ ... ],
    "actuator_slots": [ ... ],
    "modes":  [ ... ]
  }
}
```

[Browse all 16 →](catalog.html)

## Learn

OpenLoco builds on a deep stack of open robotics theory, control,
simulation, and hardware references. The [Learn page](learn.html)
indexes the canonical free + open material — Tedrake's
*Underactuated Robotics* and *Robotic Manipulation*, LaValle's
*Planning Algorithms*, MuJoCo / Drake / Brax docs, mjbots Moteus
and SimpleFOC references, and the open-hardware repos behind every
robot in the catalog.

## License

CC0-1.0 — public-domain dedication. No paywall, no enterprise
tier.

Cite the upstream papers when your work depends on their ideas:
Moteus (mjbots), Stanford Doggo (Kau et al.), ODRI/SOLO (Max
Planck / NYU), ANYmal (RSL/ETH), Morphobot M4 (Caltech CAST,
Sihite et al., Nature Communications 2023), DepthAI (Luxonis).
