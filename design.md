# Sheng Traditional and Compact Prototype Packet

Generated: 2026-05-10

Issues addressed: tonykoop/instrument-maker#153; tonykoop/sheng#1.
V5 readiness: L2 V5 build-packet candidate, not L3/L4.
V5 standard source: tonykoop/instrument-maker#186.
MCP provenance source: tonykoop/instrument-maker#188.

## Scope

This packet publishes two sheng prototype branches as separate, validator-ready
packet variants:

- Traditional side-branch sheng: `acoustic_law=side_branch_reed`,
  `end_condition=both_ends_open`.
- Compact stopped-end prototype: `acoustic_law=closed_open`,
  `end_condition=one_end_closed_reed`.

Both branches are scaffold-level design packets. They are not build-ready CAD,
DXF, reed plates, or sourcing instructions. The pipe-length rows are first-pass
physics rows for branch comparison and validator alignment; reed behavior still
requires measured coupons and a single-pipe control before any full mouth-organ
layout can be treated as fabrication authority.

Each branch `family-spec.csv` now carries the Round 30 free-reed guard fields:
`acoustic_law`, `end_condition`, `reed_source_role`, and
`unknown_requires_measurement`. The two physics rows remain branch-comparison
scaffolds only; those explicit fields prevent a half-wave side-branch sheng row
from being confused with a compact closed-open control row, and they keep donor
reed or handmade reed behavior measurement-required until P0/P1 evidence is
logged.

## Architecture Decision First

Before drafting a body, windchest, or pipe rack, choose one branch in
`architecture-choice.md`.

Choose `traditional-side-branch` when the design objective is a traditional
sheng-like architecture: long pipes, reed in a side wall or socket area, and
both pipe ends acoustically open.

Choose `compact-control` when the design objective is a smaller experimental
module: a short pipe or chamber where the reed/windchest side creates the
closed boundary and the pipe speaks as a closed-open resonator.

Do not mix rows across branches in one fabrication drawing. The same target
note has different predicted pipe length in the two sheets because the boundary
condition is different.

## Fabrication Authority

Current fabrication authority: not build-ready.

Future authority must come from one of:

- Measured reed coupon data in `p0-reed-coupon-log.csv`.
- A single-pipe control drawing and measurement log.
- DXF/CAD files that name the governing branch, reed window, socket map, gasket
  land, service access, and pipe length source.
- A reviewed design table or measured template tied to the chosen branch.

Generated images, concept sketches, or visual-BOM plates may support review but
must not become dimensional authority for reed windows, pipe length, socket
location, or windchest geometry.

V5 packet authority is recorded in `visual-output-register.csv` and
`cad/mcp-session-log.md`. Current rows are source scaffolds and reference-only
outputs; none of them upgrades the packet beyond L2.

## P0/P1 Validation Plan

P0 is reed-alone evidence. Use `p0-reed-coupon-data-sheet.csv` to
record reed source, material, geometry, and fixture/safety pre-checks, and
`p0-reed-coupon-log.csv` to record reed-alone pitch, onset pressure, pull-down
target, blow/draw behavior, gap, window size, gasket leak status, and
measurement environment.

Collect free-reed behavior with dedicated capture forms before any P1 gate claim:
- `p0-pull-down-capture-form.csv`
- `p0-onset-capture-form.csv`

P1 is coupled reed-pipe evidence. Use `p1-single-pipe-control-log.csv` to record
one traditional side-branch single pipe and one compact closed-open control
before choosing a full-family body layout. P1 rows must cite their P0 coupon ID
and report coupled pitch error; blank P1 rows block any L3 or build-ready claim.

`free-reed-empirical-loop.md` is the bench protocol for both phases. It keeps
the test order explicit: source and inspect the reed, fixture it mechanically,
measure reed-alone pitch and onset, test pull-down behavior, then move the same
coupon into one single-pipe control only after safety and leakage gates pass.

`windchest-geometry-plan.csv` is a planning table, not fabrication geometry. It
names chamber volume, pressure path, gasket land, pressure tap, inlet, service
direction, and leak-test evidence that a future DXF or CAD file must carry.

Round 33C adds issue #8 measurement-loop rows for two P0 coupon candidates and
one compact-control P1 single-pipe control. Treat those rows as single-pass
bench evidence: useful for traceability and next-test planning, but still
repeat-required before branch promotion, production reed geometry, DXF/CAD
authority, or public-readiness claims.

## Open Measurements

| Measurement | Why It Matters | Status |
| --- | --- | --- |
| Reed-alone pitch for candidate sheng or donor reeds | Determines pull-down and whether target rows are realistic | measurement-required |
| Onset pressure and blow/draw behavior | Determines playability and windchest pressure range | measurement-required |
| Reed tongue gap and window geometry | Controls response, choking, and leakage | measurement-required |
| Gasket leak rate and service access | Controls repeatability and repairability | measurement-required |
| Single-pipe coupled pitch | Confirms the selected acoustic law before family layout | measurement-required |
| Windchest chamber leak behavior | Separates reed instability from fixture leakage | measurement-required |
| Safe pressure limit and reed retention | Prevents loose reed parts or overpressure during tests | measurement-required |

## Branch Promotion Gates

Move a branch from scaffold to prototype only when:

- Its `family-spec.csv` passes the v4.4 acoustic-law validator.
- At least one P0 reed coupon has measured reed-alone pitch, onset behavior,
  blow/draw behavior, leak status, and gap setting.
- One single-pipe control has a measured coupled pitch and notes whether it
  matches the declared acoustic law.
- The DXF/CAD checklist identifies branch, end condition, reed window, socket
  map, gasket land, windchest section, and service direction.
- The windchest plan records chamber volume, pressure tap, inlet, gasket land,
  leak-test method, leak status, and service access for the chosen branch.
- `safety-gates.csv` has no open stop conditions for the phase being promoted.
- `visual-output-register.csv` keeps generated or concept visuals out of the
  fabrication authority chain.
- `cad/mcp-session-log.md` names any external CAD/creative/runtime tool output
  and marks Wolfram work as source-only unless execution evidence exists.

## Safety and Scope Gates

- Do not claim current supplier availability, price, or lead time without a
  fresh purchase-time check.
- Do not publish private family/media/archive contents.
- Do not treat branch-comparison pipe lengths as cut-ready dimensions.
- Do not collapse the two branch family specs into one fake universal answer.
