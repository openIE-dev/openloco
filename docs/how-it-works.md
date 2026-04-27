---
title: How it works
nav_order: 4
---


A walkthrough from one descriptor file to a robot that walks in
MuJoCo. We'll trace [`descriptors/anymal_wl.udd.json`](descriptors/anymal_wl.udd.json) all the way
through.

## 1 · The descriptor

A robot is described in one JSON file. Here's the shape:

```jsonc
{
  "schema_version": 1,
  "meta": { "name": "anymal_wl", "version": "0.1", "units_length": "Metre", … },
  "robot": {
    "links":      [ /* every body part: chassis, hip housings, leg segments, wheels */ ],
    "joints":     [ /* every joint: revolute/prismatic/continuous, with axes + limits */ ],
    "actuator_slots": [ /* which joints are driven, by what tier of actuator */ ],
    "modes":      [ /* operating modes: walking, driving, flying, etc. */ ]
  }
}
```

Open [`descriptors/anymal_wl.udd.json`](descriptors/anymal_wl.udd.json) and you'll see one entry per
link:

```jsonc
{ "name": "FL_lower_leg",
  "mass_kg": 0.200,
  "inertia": [8.23e-4, 8.23e-4, 3.24e-5, 0, 0, 0],
  "geometry_ref": { "type": "mesh_hash",
                    "hash": "catalog_brackets_leg_segment__length-220" } }
```

The `geometry_ref.hash` is **content-addressable** — same hash means same
mesh, regardless of which descriptor uses it. The mesh comes from a
parametric catalog part (`brackets/leg_segment` with `length=220`),
baked once and shared across every descriptor that needs that bracket.

Joints look like this:

```jsonc
{ "name": "FL_KNEE_pitch",
  "joint_type": "revolute",
  "parent_link": "FL_knee_housing", "child_link": "FL_lower_leg",
  "axis": [0, 1, 0],
  "origin_xyz": [0, 0, 0],
  "limits": { "lower": 0.2, "upper": 2.8,
              "effort_max": 25.0, "velocity_max": 20.0 } }
```

Every URDF / MJCF emitter in the world reads similar things; OpenLoco
just keeps it in one canonical schema instead of re-deriving it per
target format.

## 2 · The compile step

Hand the descriptor to the OpenLoco CLI and out come the artifacts.
Look in [`examples/baked/anymal_wl/`](examples/baked/anymal_wl/) — those four files +
`meshes/` were generated from `anymal_wl.udd.json` alone:

```text
descriptors/anymal_wl.udd.json
        │
        ├─► anymal_wl.urdf   ← ROS 2, RViz, every URDF tool consumes this
        ├─► anymal_wl.xml    ← MuJoCo MJCF: bodies, joints, geoms, sensors
        ├─► bom.csv          ← every BOM entry from every link, tier-aware
        ├─► assembly.md      ← topological-order assembly steps
        └─► meshes/*.stl     ← parametric catalog parts → STL via cad-kernel
```

In v0.7.9 (when source ships), the command will be:

```bash
openloco generate --all descriptors/anymal_wl.udd.json --output-dir out/
openloco bake             descriptors/anymal_wl.udd.json --output-dir out/meshes/
```

## 3 · The MJCF emit's secret sauce

Look at [`examples/baked/anymal_wl/anymal_wl.xml`](examples/baked/anymal_wl/anymal_wl.xml). A handful of
choices that matter for physics-stable simulation:

```xml
<asset>
  <mesh name="…" file="….stl" scale="0.001 0.001 0.001"/>
  <!-- ↑ cad-kernel tessellation is in mm; MuJoCo reads metres. -->
</asset>

<default>
  <joint damping="0.1" armature="0.01"/>
  <geom contype="0" conaffinity="1" friction="1.0 0.005 0.0001"/>
  <!-- ↑ body geoms receive ground contact but never self-collide. -->
</default>

<body name="FL_wheel" pos="0 0 -0.22" euler="-1.5707963 0 0">
  <joint name="FL_WHEEL_drive" type="hinge" axis="0 0 1" limited="false"
         damping="0.001" armature="0.0001" pos="0 0 0" ref="0.0"/>
  <!--                                              ↑ initial qpos
       Wheel's mesh axle is in mesh-Y, so we rotate the body by -π/2
       around X. Joint axis is then the body's Z = mesh's Y = wheel
       axle. Wheel rolls correctly; doesn't tilt sideways like a
       horizontal disk would. -->
</body>
```

Each of these decisions came from a real failure mode that bit during
the v0.5 reproduction; see [CHANGELOG.md](CHANGELOG.md) v0.7.2 (mesh-scale
fix), v0.7.5 (rotor-thrust), v0.7.7 (mesh-axis pass) for the bug-hunt
narratives.

## 4 · The run

In v0.7.9, the gait test for this descriptor is one command:

```bash
cargo test --features mujoco-ffi --test gait_anymal_wl -- --nocapture
```

It loads the MJCF, spawns the robot, runs the trot+stance controller
for 5 s, and prints:

```text
=== anymal_wl walk @ vx=0.20 m/s for 5s ===
  mean vx after 2.5s warmup: 0.144 m/s
  mean planar speed:         0.243 m/s  (cmd 0.20, ratio 1.21)
  total forward drift:       0.69 m
  RMS body tilt:             15.6°
  test result: ok
```

That's the v0.5 reference walking number (≈83% in Python; we get 72%
world-X / 121% planar speed), reproduced.

## 5 · Why it composes

Because every artifact derives from one descriptor, you can do things
that aren't possible when each step is a different tool:

- **Swap an actuator tier.** Change one
  `actuator_slots[*].tier: 2 → 0` line, recompile — every URDF /
  MJCF / BOM / assembly entry updates consistently.
- **Mutate a morphology.** Take `m4_morphobot.udd.json`, change
  `wheel.kind = rotor_wheel → wheel_simple`, recompile — get a
  ground-only m4 variant with a fraction of the mass.
- **Add a new sensor.** Drop a `<Sensor kind="Rgbd" mount_link="…">`
  into the perception block; URDF emits a sensor frame, MJCF emits
  a `<camera>`, the perception runtime auto-wires the skill graph.

You don't need to update three files in three formats; you update one
JSON and the rest follow.

## What's in this repo

- [`descriptors/`](descriptors/) — the six robots that ship in v0.7.8.
- [`examples/baked/`](examples/baked/) — exactly what the compiler emits, frozen at
  v0.7.8. Drop the URDFs into ROS 2 / Gazebo / RViz, drop the MJCFs
  into MuJoCo, fab the parts from the BOM. No OpenLoco binary required.
- [`CHANGELOG.md`](CHANGELOG.md) — the v0.7.0 → v0.7.8 release narrative,
  including every bug we hit and how the schema fixed it.
- [`SOURCE.md`](SOURCE.md) — the upcoming v0.7.9 source release plan.
