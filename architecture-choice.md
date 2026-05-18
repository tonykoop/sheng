# Sheng Architecture Choice

Pick this before layout, CAD, DXF, sourcing, or full pipe count.

## Branch Comparison

| Branch | Use When | Acoustic Law | End Condition | Reed Source Role | Measurement Gate |
| --- | --- | --- | --- | --- | --- |
| `traditional-side-branch` | Preserve traditional sheng-like long pipes and side-branch reed coupling. | `side_branch_reed` | `both_ends_open` | `side_branch_free_reed_controls_pipe_coupling` | `unknown_requires_measurement` until P0 coupon and P1 side-branch pipe data exist. |
| `compact-control` | Prove a shorter, serviceable prototype module before committing to a traditional body. | `closed_open` | `one_end_closed_reed` | `free_reed_forms_closed_end_boundary` | `unknown_requires_measurement` until P0 coupon and P1 closed-open pipe data exist. |

## Traditional Side-Branch

Choose this branch when the primary value is architectural fidelity: long
visible pipes, a mouth-organ windchest, and a reed coupled through a side branch
or socket while both pipe ends remain acoustically open.

This branch uses half-wave pipe lengths in
`traditional-side-branch/family-spec.csv`. It is longer and less compact, but
it preserves the traditional boundary-condition claim that issue #153 asks us
to keep alive. The branch family spec names the reed role explicitly as
`side_branch_free_reed_controls_pipe_coupling` and keeps the measurement gate
open until P0/P1 evidence exists.

## Compact Control

Choose this branch when the primary value is fast empirical learning: a smaller
pipe module, easier reed service, and a clearer path to coupon-to-pipe
iteration.

This branch uses quarter-wave pipe lengths in
`compact-control/family-spec.csv`. It should not be described as traditional
sheng geometry; it is a compact prototype branch for proving reed, gasket,
socket, and windchest behavior. The branch family spec names the reed role
explicitly as `free_reed_forms_closed_end_boundary` and keeps the measurement
gate open until P0/P1 evidence exists.

## Shared Unknowns

Both branches need the same evidence before becoming build-ready:

- Reed-alone pitch.
- Coupled single-pipe pitch.
- Onset pressure.
- Pull-down cents.
- Blow/draw response.
- Leak status.
- Serviceable reed plate and gasket geometry.

If those measurements are missing, keep the branch label as scaffold or
prototype-planning, not production-ready.
