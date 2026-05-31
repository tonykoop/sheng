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
