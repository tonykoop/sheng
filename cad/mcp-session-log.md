# MCP Session Log

V5 provenance starter aligned with `tonykoop/instrument-maker#188`.

No MCP-connected CAD tool, image generator, or Wolfram runtime has produced
fabrication authority for this packet. Rows below identify current source
artifacts and their authority class so future tool output can be appended
without confusing review support with build geometry.

| timestamp | tool | artifact | session_id | parent_artifact | authority | notes |
| --- | --- | --- | --- | --- | --- | --- |
| 2026-05-17T15:53:32Z | design-table | traditional-side-branch/family-spec.csv | unknown |  | design_table | Physics-derived branch rows; L2 only. |
| 2026-05-17T15:53:32Z | design-table | compact-control/family-spec.csv | unknown |  | design_table | Physics-derived branch rows; L2 only. |
| 2026-05-17T15:53:32Z | design-table | cad/p0-p1-control-parameters.csv | unknown | p0-reed-coupon-log.csv | analysis_only | CAD parameter starter; measurements TBD. |
| 2026-05-17T15:53:32Z | wolfram | wolfram-starter.wl | unknown | cad/p0-p1-control-parameters.csv | analysis_only | Source-only starter; not executed. |
| 2026-05-17T18:18:02Z | design-table | windchest-geometry-plan.csv | unknown | p1-single-pipe-control-log.csv | analysis_only | Windchest planning fields only; no fabrication geometry. |
| 2026-05-17T18:18:02Z | measurement-template | safety-gates.csv | unknown | free-reed-empirical-loop.md | analysis_only | Safety gate checklist; open until bench evidence exists. |
