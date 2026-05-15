# Project Intent

Publish the sheng split from issue #153 as two explicit packet variants without
forcing a premature architecture winner.

# Branch Decision

The first decision is `traditional-side-branch` versus `compact-control`.

# Traditional Branch

Traditional side-branch rows use `side_branch_reed` with
`end_condition=both_ends_open`.

# Compact Branch

Compact control rows use `closed_open` with
`end_condition=one_end_closed_reed`.

# Family Spec

Each branch has its own `family-spec.csv`. The sheets must stay separate unless
measurements prove a shared acoustic model.

# Coupon Gate

The P0 reed coupon records reed-alone pitch, onset pressure, blow/draw behavior,
gap, window size, and leak status.

# Single-Pipe Gate

One measured single-pipe control comes before any full mouth-organ body layout.

# Drawing Authority

Future DXF/CAD must name branch, reed window, socket map, gasket land,
windchest section, and service direction.

# Visual Authority

Generated images are concept or reference support only.

# Fabrication Status

Current status is scaffold. This packet is not build-ready.

# Risks

The primary risks are unmeasured reed behavior, leakage, and accidental branch
mixing.

# Next Actions

Pick a branch, fill the P0 coupon log, build one single-pipe control, then
revise the selected branch sheet with measured evidence.

