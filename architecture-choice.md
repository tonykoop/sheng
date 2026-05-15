# Sheng Architecture Choice

Pick this before layout, CAD, DXF, sourcing, or full pipe count.

## Branch Comparison

| Branch | Use When | Acoustic Law | End Condition | First Gate |
| --- | --- | --- | --- | --- |
| `traditional-side-branch` | Preserve traditional sheng-like long pipes and side-branch reed coupling. | `side_branch_reed` | `both_ends_open` | Validate one side-branch single pipe after reed coupon. |
| `compact-control` | Prove a shorter, serviceable prototype module before committing to a traditional body. | `closed_open` | `one_end_closed_reed` | Validate one closed-open single pipe after reed coupon. |

## Traditional Side-Branch

Choose this branch when the primary value is architectural fidelity: long
visible pipes, a mouth-organ windchest, and a reed coupled through a side branch
or socket while both pipe ends remain acoustically open.

This branch uses half-wave pipe lengths in
`traditional-side-branch/family-spec.csv`. It is longer and less compact, but
it preserves the traditional boundary-condition claim that issue #153 asks us
to keep alive.

## Compact Control

Choose this branch when the primary value is fast empirical learning: a smaller
pipe module, easier reed service, and a clearer path to coupon-to-pipe
iteration.

This branch uses quarter-wave pipe lengths in
`compact-control/family-spec.csv`. It should not be described as traditional
sheng geometry; it is a compact prototype branch for proving reed, gasket,
socket, and windchest behavior.

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

