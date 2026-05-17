# Sheng Mouth-Organ Family Packet

Generated: 2026-05-10

Status: L2 V5 build-packet candidate.

Current status: scaffold packet with two explicit architecture variants.
Fabrication authority: not build-ready.
Wolfram/runtime status: source-only; no Wolfram runtime validation has been run.

This packet promotes the Round 8 sheng split from issue #153 without choosing
a premature winner. The first workflow decision is the architecture branch:

- `traditional-side-branch/` keeps the traditional sheng-like side-branch reed
  model with both pipe ends open.
- `compact-control/` keeps the compact stopped-end prototype model with the
  reed acting as the closed end.

The two `family-spec.csv` files are intentionally separate. Do not merge them
into one universal sheng sheet unless measured reed coupon and single-pipe
control data prove that the same acoustic law and boundary condition apply to
both layouts.

## Quick Start

1. Read `architecture-choice.md` and pick exactly one branch for the next shop
   action.
2. Use `traditional-side-branch/family-spec.csv` when preserving a traditional
   sheng-like long-pipe geometry is the first design goal.
3. Use `compact-control/family-spec.csv` when proving a short, serviceable
   reed-pipe module is the first design goal.
4. Fill `p0-reed-coupon-log.csv` before claiming final reed pitch, onset
   pressure, pull-down, or cut-ready socket geometry.
5. Fill `p1-single-pipe-control-log.csv` before claiming coupled pipe pitch or
   branch promotion beyond L2.
6. Run the v4.4 acoustic-law validator on the chosen branch and the visual
   authority validator on `visual-output-register.csv`.

## File Map

| File | Purpose |
| --- | --- |
| `design.md` | Shared intent, scope, unknowns, and validation gates. |
| `architecture-choice.md` | First decision point: traditional side-branch vs compact control. |
| `traditional-side-branch/family-spec.csv` | Validator-aligned side-branch reed rows. |
| `compact-control/family-spec.csv` | Validator-aligned closed-open compact rows. |
| `p0-reed-coupon-log.csv` | Required reed coupon worksheet before full-family claims. |
| `p1-single-pipe-control-log.csv` | Required coupled reed-pipe worksheet before branch promotion. |
| `mouth-organ-dxf-checklist.csv` | Future DXF/CAD authority checklist. |
| `visual-output-register.csv` | V5 authority register for visuals, print packet, and concept support. |
| `cad/` | V5 CAD/provenance starter folder; not fabrication authority yet. |
| `validation.csv` | Gates that move each branch from scaffold to prototype evidence. |

## Validation Command

```bash
python3 /home/tony/.codex/skills/instrument-maker-v4/scripts/validate_acoustic_law.py \
  docs/build-packets/sheng-mouth-organ-family/traditional-side-branch/family-spec.csv

python3 /home/tony/.codex/skills/instrument-maker-v4/scripts/validate_acoustic_law.py \
  docs/build-packets/sheng-mouth-organ-family/compact-control/family-spec.csv
```

For this root-mode repo, run the same validator against the local files:

```bash
python3 /home/tony/.codex/skills/instrument-maker/scripts/validate_acoustic_law.py \
  traditional-side-branch/family-spec.csv

python3 /home/tony/.codex/skills/instrument-maker/scripts/validate_acoustic_law.py \
  compact-control/family-spec.csv

python3 /home/tony/.codex/skills/instrument-maker/scripts/validate_visual_authority.py \
  visual-output-register.csv
```

`Status: L2 V5 build-packet candidate` means the packet has the reviewable V5
surface and named blockers. It does not mean the sheng is build-ready.
