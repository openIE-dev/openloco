# `assets/`

Concept art and mood imagery for the OpenLoco project.

## Renders

These are AI-generated (Flux 1.1 pro) interpretations of the morphology
families OpenLoco's catalog covers. They're evocative, not literal —
**the source of truth for each robot's exact spec is its
[descriptor](../descriptors/) + [baked artifacts](../examples/baked/).**

| File | Subject | Note |
| --- | --- | --- |
| `renders/hero.png` | Three-robot lineup | Wide-aspect hero / OpenGraph image |
| `renders/anymal_wl.png` | Wheel-leg quadruped genre | Image shows a two-wheel framing; actual `anymal_wl` is 4-legged with wheels at each foot |
| `renders/m4_morphobot.png` | Air-ground hybrid genre | Image separates wheels and rotors; actual M4 has each appendage be a shrouded rotor that *also* rolls |
| `renders/mini_whegs.png` | Wheg-driven robot genre | Image shows spoked wheels; actual mini-whegs are 3-spoke open stars (no rim) |

For the literal robot geometries see:
- [`descriptors/*.udd.json`](../descriptors/) — the source-of-truth
  schema, every dimension and joint axis explicit
- [`examples/baked/*/`](../examples/baked/) — exactly what the
  v0.7.8 compiler emits: URDF + MJCF + STL meshes

## Prompts

Source prompts for the renders live in [`prompts/`](prompts/).

## Regenerating

```bash
# Sources BFL_API_KEY etc. from a publishing/.env-style file.
set -a; source path/to/.env; set +a
./scripts/generate_image.sh assets/prompts/anymal_wl.txt \
    assets/renders/anymal_wl.png 1024 1024
```
