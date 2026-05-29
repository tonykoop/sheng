# Sheng P0/P1 Measurement Evidence Summary

Status: L2 measurement-loop evidence. Not build-ready.

This document consolidates the Round 33C single-pass bench evidence for the sheng
packet so future reviewers can read one file to understand what was captured, what
still needs to be repeated, and what blocks promotion.

All frequency and pitch values below are **model estimates or single-pass
bench-fill rows**. Repeat measurements and reviewed CAD/DXF or design-table
authority are required before any branch promotion, production geometry, or
public-readiness claim.

## Architecture Gate (open)

The architecture branch has not been selected. Two branches remain active:

| Branch | Acoustic law | End condition | P1 status |
| --- | --- | --- | --- |
| `traditional-side-branch/` | side_branch_reed | both_ends_open | BLOCKED — reed plate lift risk; repeat P0 first |
| `compact-control/` | closed_open | one_end_closed_reed | single-pass P1 captured; repeat before promotion |

Do not merge or unify the two `family-spec.csv` files until measured reed coupon
and single-pipe control data prove that the same acoustic law and boundary
condition apply to both layouts.

## P0 Reed Coupon Evidence (Round 33C)

Two P0 coupon rows recorded in `p0-reed-coupon-log.csv`. Single-pass bench fill;
not production reed geometry.

| Coupon ID | Branch | Reed material | Reed-alone pitch | Pull-down | Onset pressure Pa | Leak status | Safe pressure Pa | Next action |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SNG-P0-TRAD-001 | traditional-side-branch | brass, 0.18 mm | 438.7 Hz (A4 flat) | −18 cents measured vs −10 to −30 target | 245 | low-pressure-hold pass | 700 | Repeat before side-branch P1 fixture |
| SNG-P0-COMP-001 | compact-control | brass, 0.16 mm | 441.8 Hz (A4 sharp) | −12 cents measured | 220 | low-pressure-hold pass | 650 | Use as traceable P0 for compact P1; repeat before branch promotion |

Evidence level: `partial_evidence` per `validation.csv` VAL-004, VAL-016, VAL-017, VAL-018.
These rows were bench-filled from the Round 33C worksheet. Supplier lot for the
traditional-side-branch candidate and final source for the compact-control donor
melodica reed have not been verified.

## P1 Single-Pipe Control Evidence (Round 33C)

Two P1 control rows recorded in `p1-single-pipe-control-log.csv`.

| Control ID | Branch | P0 coupon | Coupled pitch Hz | Pitch error cents | Leak status | Service access | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| SNG-P1-TRAD-001 | traditional-side-branch | SNG-P0-TRAD-001 | — | — | unknown | — | BLOCKED — reed plate lifts outward; cannot run until retention and leak evidence from P0 repeat |
| SNG-P1-COMP-001 | compact-control | SNG-P0-COMP-001 | 438.9 Hz | −4.3 cents | below visible bubble threshold (pass) | reed removed without gasket damage | single_pass_measurement_loop_evidence; repeat with measured chamber leak rate |

Evidence level: `partial_evidence` per `validation.csv` VAL-006, VAL-013, VAL-014.
The compact branch P1 row is the only measured coupled-pitch evidence in this packet.
It must be repeated with a quantified chamber leak rate before branch promotion.

## Open Stop Conditions (safety-gates.csv)

Check `safety-gates.csv` before any:
- Reed cutting or tongue grinding
- Pressure testing above the logged safe limit
- Full-body layout or branch-promotion decision

The traditional-side-branch P1 is explicitly blocked until the reed plate
lift/retention stop condition is resolved.

## Gates Still Open

| Gate ID | Gate | Blocking reason |
| --- | --- | --- |
| VAL-001 | architecture_choice | Neither branch selected for next layout action |
| VAL-005 | p1_single_pipe_control (traditional) | BLOCKED — repeat P0 first |
| VAL-007 | dxf_authority | No DXF/CAD until coupon + single-pipe evidence complete |
| VAL-008 | visual_authority | visual-output-register.csv validator not yet run |
| VAL-009 | mcp_provenance | No MCP CAD session has produced fabrication artifacts |
| VAL-010 | wolfram_runtime | wolfram-starter.wl is source-only; not executed |
| VAL-015 | safety_gates | Open stop conditions remain before P0/P1 bench work |

## Next Actions

1. Resolve the traditional-side-branch P0 retention stop condition before any P1
   attempt on that branch.
2. Repeat the compact-control P1 with a measured chamber leak rate (quantified
   ml/s or Pa/s decay, not just visual bubble threshold).
3. Select one branch as the next shop action target per `architecture-choice.md`.
4. Run `validate_visual_authority.py visual-output-register.csv` and resolve any
   remaining authority issues.
5. When DXF/CAD is needed: do not create it until P0 and P1 evidence for the chosen
   branch is complete and validated.
