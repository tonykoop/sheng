# Design Intent — sheng rev A

- Master CAD: `cad/sheng.scad` (sha256: 695142b5c0cb4ef439ee537e12c7555de688d43d194713c1f1f25c70422e50e9), envelope-only pipe-rank master driven by `traditional-side-branch/family-spec.csv` (sha256: b47adbbefbd0d1ecc64dc0abc944b9fe332aedd9946f84c5a092b5edc4d9c62f) and `compact-control/family-spec.csv` (sha256: 59520daadd1f13a5ab16e09da1f7fe91ae88ca3afb64b3034391aa04bb44c8d8).
- Function: A free-reed mouth-organ (sheng), published as two comparable architecture branches rather than one premature winner (`architecture-choice.md`). `traditional-side-branch` preserves traditional sheng-like long pipes with the reed coupled through a side branch or socket while both pipe ends stay acoustically open (`acoustic_law=side_branch_reed`, `end_condition=both_ends_open`, half-wave pipe law). `compact-control` is a smaller experimental module where the reed/windchest side forms the closed boundary and the pipe speaks as a closed-open resonator (`acoustic_law=closed_open`, `end_condition=one_end_closed_reed`, quarter-wave pipe law). Both branches share the same eight-note rank (D4-E4-G4-A4-C5-D5-E5-G5) for direct comparison.
- Environment: bench/shop prototype; reed behavior (onset pressure, pull-down, blow/draw) is pressure- and leak-sensitive, so P0 (reed-alone) and P1 (single-pipe coupled) bench evidence must precede any full-family or windchest claim (`free-reed-empirical-loop.md`).
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Traditional-branch pipe rank lengths (D4-G5) | 575.9 / 512.2 / 429.4 / 381.6 / 319.6 / 283.9 / 252.0 / 210.6 mm | verify against measured coupled pitch (P1) | half-wave pipe length sets pitch under `side_branch_reed` law | traditional-side-branch/family-spec.csv `predicted_L_geom_mm` (physics_derived, analysis_only) |
| Compact-branch pipe rank lengths (D4-G5) | 287.9 / 256.1 / 214.7 / 190.8 / 159.8 / 141.9 / 126.0 / 105.3 mm | verify against measured coupled pitch (P1) | quarter-wave pipe length sets pitch under `closed_open` law | compact-control/family-spec.csv `predicted_L_geom_mm` (physics_derived, analysis_only) |
| Reed window size, tongue gap | TBD | measurement_required | controls response, choking, leakage; directly governs whether pull-down targets are realistic | cad/p0-p1-control-parameters.csv CAD-P0-001 / CAD-P0-002; `unknown_requires_measurement` — reed gate stays OPEN |
| Coupled pitch error (per branch) | TBD | measurement_required | confirms the declared acoustic law before any family layout | cad/p0-p1-control-parameters.csv CAD-P1-004; p1-single-pipe-control-log.csv |
| Windchest chamber volume, pressure tap, gasket land | TBD | measurement_required | separates reed instability from chamber leakage; sets serviceability | windchest-geometry-plan.csv; cad/p0-p1-control-parameters.csv CAD-WC-001..004 |
| Safe pressure limit | TBD (below onset overpressure) | measurement_required, safety-critical | prevents reed plate ejection / loose parts during testing | safety-gates.csv SAFE-003, SAFE-004 |

## Incidental (free for DFM)

- Windchest exterior styling, mouthpiece cosmetic shaping, pipe rank visual arrangement/fan angle, non-mating surface finish.

## Must-nots (DFM may never violate)

- Do not treat branch-comparison pipe lengths as cut-ready dimensions (design.md "Safety and Scope Gates"; risks.md "Fabrication").
- Do not collapse the two branch family-spec tables into one universal sheet — the boundary condition differs (`architecture-choice.md`).
- Do not infer reed window, tongue gap, or gasket land from concept images or generated visuals (cad/p0-p1-control-parameters.csv notes; safety-gates.csv SAFE-007).
- Do not exceed the logged safe pressure limit during onset/leak testing; reed plate must be mechanically retained before any pressure test (safety-gates.csv SAFE-002, SAFE-003; risks.md "Safety").
- Do not build a full mouth-organ windchest/body layout before one branch has measured coupled pitch, onset behavior, leak status, and service-access evidence (free-reed-empirical-loop.md P1 step 3).

## Material intent

- Preferred: bamboo or hardwood for traditional-side-branch long pipes; hardwood or printed test core for compact-control short control pipes (per branch `family-spec.csv` `material` column and bom.csv BOM-002/BOM-003).
- Acceptable subs: substitution_candidate status per bom.csv (BOM-002 through BOM-005); not yet coupon-tested.
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable. Reed/reed-table geometry, windchest chamber, and voicing remain unmeasured (`unknown_requires_measurement`) and out of scope for the current CAD master.
