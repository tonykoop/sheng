# Sheng V5 Free-Reed Starter Packet

Chinese mouth organ design, tuning, and build documents.

Current status: bare-bones readiness packet for a free-reed-first sheng
control build. Fabrication authority is not build-ready. The next valid build
artifact is a reed coupon and then a single-pipe control, not a full sheng
body or pipe family.

## Packet Index

- `design.md` - design intent, control-build boundary, required measurements,
  safety notes, and promotion gates.
- `family-spec.csv` - family/spec rows with explicit free-reed fields,
  acoustic-law status, measurement unknowns, and provenance.
- `bom.csv` - starter bill of materials for reed stock, windchest, pipes,
  gaskets, and measurement tools.
- `sourcing.csv` - sourcing and search placeholders with unverified/current
  stock clearly marked.
- `p0-reed-coupon-log.csv` - first coupon worksheet for reed-alone pitch,
  pull-down, onset pressure, blow/draw behavior, and leak status.
- `validation-loop.csv` - gates for reed coupon pitch, pull-down, onset,
  leak testing, and pipe coupling.
- `dxf-authority-placeholders.csv` - future CAD/DXF authority checklist for
  reed window, gasket, socket, and windchest geometry.
- `visual-output-register.csv` - authority register for future drawings,
  previews, or concept images.
- `wolfram-study-notes.md` - starter Wolfram model notes only; no runtime
  validation has been performed in this packet.

## Readiness Boundaries

- Branch: `control-build`.
- First gate: P0 reed coupon with measured reed-alone pitch and onset behavior.
- Second gate: one single-pipe control with leak status and coupled pitch data.
- Acoustic model: `unknown_requires_measurement` until coupon and pipe-coupling
  measurements justify a specific law.
- CAD/DXF status: future authority placeholders only; no cut-ready geometry.
- Sourcing status: unverified until checked at purchase time.

## Next Build Gates

1. Build or acquire one serviceable reed coupon.
2. Measure reed-alone pitch, blow/draw response, onset pressure, gap, and leak
   status.
3. Couple the reed to one pipe and record pull-down in cents.
4. Update `family-spec.csv` from `unknown_requires_measurement` only after
   measurements support a stable `side_branch_reed`, `closed_open`, or other
   validated acoustic law.
5. Create governing DXF/CAD only after reed window, gasket land, and windchest
   assumptions are measured or deliberately fixed for the control article.

## License Note

No repository license file is present in this starter packet. Treat reuse and
fabrication handoff permissions as unresolved until a license is added by the
repo owner.
