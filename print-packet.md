# Sheng Mouth-Organ Family Print Packet

Generated: 2026-05-10

Status: L2 V5 build-packet candidate, not build-ready.

## Issue

This packet addresses tonykoop/instrument-maker#153 and tonykoop/sheng#1 by
promoting both Round 8 sheng branches as explicit variants:

- `traditional-side-branch/family-spec.csv`
- `compact-control/family-spec.csv`

## First Decision

Read `architecture-choice.md` and select one branch before layout.

## Validation

Run the v4.4 acoustic-law validator on the selected branch. Both branch sheets
are meant to pass the validator while preserving different boundary conditions.

Run the visual authority validator on `visual-output-register.csv`. This print
packet is reference-only layout support, not fabrication authority.

Use `free-reed-empirical-loop.md`, `windchest-geometry-plan.csv`, and
`safety-gates.csv` before any P0/P1 bench work. These files are planning and
measurement templates, not cut geometry.

## Fabrication Authority

No file in this packet is cut-ready authority yet. Future authority must come
from measured coupon data, single-pipe control evidence, and DXF/CAD or design
tables that name the selected branch.

`cad/mcp-session-log.md` records V5 provenance for design-table and Wolfram
source artifacts. Wolfram work is source-only unless runtime evidence is added.

## File Map

- `README.md`
- `design.md`
- `architecture-choice.md`
- `traditional-side-branch/family-spec.csv`
- `compact-control/family-spec.csv`
- `p0-reed-coupon-log.csv`
- `p1-single-pipe-control-log.csv`
- `free-reed-empirical-loop.md`
- `windchest-geometry-plan.csv`
- `safety-gates.csv`
- `mouth-organ-dxf-checklist.csv`
- `visual-output-register.csv`
- `cad/mcp-session-log.md`
- `cad/p0-p1-control-parameters.csv`
- `validation.csv`
- `bom.csv`
- `sourcing.csv`
- `cut-list.csv`
- `assembly-manual.md`
- `supplier-rfq.md`
- `drawing-brief.md`
- `visual-bom-brief.md`
- `risks.md`
- `sheng-starter.wl`
