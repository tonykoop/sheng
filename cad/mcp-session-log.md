# MCP Session Log

V5 provenance — aligned with `tonykoop/instrument-maker` V5 build-packet standard.

No MCP-connected CAD tool, image generator, or Wolfram runtime has produced
fabrication authority for this packet. All rows below are design-table derivations
or measurement-template work; none carry fabrication authority.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-17-design-table-v1 | design-table | acoustic-law formulas | traditional-side-branch/family-spec.csv | cad_authoring | reference_only | self_checked | Physics-derived branch rows; L2 only; not build-ready. |
| 2026-05-17-design-table-v1 | design-table | acoustic-law formulas | compact-control/family-spec.csv | cad_authoring | reference_only | self_checked | Physics-derived branch rows; L2 only; not build-ready. |
| 2026-05-17-design-table-v2 | design-table | p0-reed-coupon-log.csv | cad/p0-p1-control-parameters.csv | cad_authoring | reference_only | unreviewed | CAD parameter starter derived from coupon log; measurements TBD. |
| 2026-05-17-wolfram-v1 | wolfram | cad/p0-p1-control-parameters.csv | sheng-starter.wl | cad_authoring | reference_only | unreviewed | Source-only starter; not executed. |
| 2026-05-17-design-table-v3 | design-table | p1-single-pipe-control-log.csv | windchest-geometry-plan.csv | cad_authoring | reference_only | unreviewed | Windchest planning fields only; no fabrication geometry. |
| 2026-05-17-measurement-template-v1 | measurement-template | free-reed-empirical-loop.md | safety-gates.csv | cad_authoring | reference_only | unreviewed | Safety gate checklist; open until bench evidence exists. |
| 2026-05-18-round30-v1 | design-table | cad/mcp-session-log.md | traditional-side-branch/family-spec.csv; compact-control/family-spec.csv | cad_authoring | reference_only | self_checked | Added explicit reed_source_role and unknown_requires_measurement guard fields; still L2 only. |
| 2026-05-29-bob-r1 | measurement-template | p0-reed-coupon-log.csv; p1-single-pipe-control-log.csv | docs/p0-p1-measurement-summary.md | cad_authoring | reference_only | self_checked | Consolidated Round 33C evidence summary; no fabrication authority added. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | traditional-side-branch/family-spec.csv; compact-control/family-spec.csv | visual-output-register.csv | packet_refresh | fabrication | self_checked | V5 refresh pass; tabular packet data reviewed against design table. `authority_result=fabrication` describes this register row (V5 bookkeeping authority) only — no instrument CSV in this repo carries fabrication authority yet; reed gates stay open per design.md ("Current fabrication authority: not build-ready"). |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | traditional-side-branch/family-spec.csv; compact-control/family-spec.csv | cad/sheng.scad | cad_authoring | pending_measurement | self_checked | New envelope-only OpenSCAD master: models ONLY the pipe-rank envelope (length + rank position) for both branches from the exact predicted_L_geom_mm rows in each family-spec.csv. Reed/reed-table geometry, windchest chamber, and voicing stay out of scope (unmeasured per p0-p1-control-parameters.csv). Render check: `openscad -o /tmp/sheng-check.stl cad/sheng.scad` exit 0. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | cad/p0-p1-control-parameters.csv | wolfram/sheng-wolfram-model.wl | analysis_source | derived_preview | unreviewed | source-only; generated via generate_wolfram_packet.py, renamed from wolfram/instrument-model.wl; not executed (no --execute). |
