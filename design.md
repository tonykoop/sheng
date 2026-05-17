# Sheng V5 Starter Design Notes

## Status

This is a bare-bones readiness packet for a free-reed-first sheng control
build. It is not a build-ready instrument plan, not a complete pipe family,
and not a measured acoustic design.

Fabrication authority: not build-ready. Future DXF/CAD, measured templates, or
design tables must control reed windows, socket positions, windchest geometry,
pipe lengths, and gasket lands.

## Strict Free-Reed Boundary

The first artifact must be a P0 reed coupon. The second artifact must be a
single-pipe control. A full sheng body, pipe set, decorative windchest, or
family-scale CAD model is out of scope until those two tests produce useful
measurements.

Free reeds can shift pitch and response with reed stock, tongue gap, rivet or
clamp geometry, gasket leakage, windchest volume, pipe coupling, and pressure
path. Supplier pitch labels or donor-instrument notes are starting clues, not
design authority.

## Branch

Branch: `control-build`

Reason: no measured reed coupon data exists in this repo yet. The packet uses
`unknown_requires_measurement` for acoustic-law rows until reed-alone pitch,
onset pressure, blow/draw behavior, leak status, and pipe coupling are recorded.

## Starter Architecture

- Reed source role: candidate donor reeds, handmade reed blanks, or purchased
  replacement reed stock for coupon testing only.
- Pipe role: one removable test pipe coupled to one reed after coupon data is
  recorded.
- Windchest role: small serviceable pressure chamber for test access, leak
  isolation, and repeatable onset-pressure measurement.
- Gasket role: replaceable seal with visible leak land and compression stop.
- Body role: no full sheng body claim yet; any holder is a test fixture.

## Required Measurements Before CAD Claims

- Reed-alone pitch in hertz.
- Nearest note and cents offset at the measurement environment.
- Coupled pipe pitch and pull-down in cents.
- Onset pressure for blow direction and, if relevant, draw direction.
- Blow/draw behavior vocabulary: `speaks`, `stalls`, `squeals`, `silent`,
  `unstable`, or another recorded observation.
- Reed tongue gap after setup.
- Reed window width and length.
- Gasket leak status.
- Temperature, humidity, and measurement rig notes.
- Windchest volume assumption or measured chamber volume.
- Pipe inside diameter, wall thickness, open-end condition, and coupling
  geometry.

## Acoustic-Law Boundary

Use `unknown_requires_measurement` while the reed and pipe coupling are
unmeasured. Candidate future laws include:

- `side_branch_reed` with `both_ends_open` if a traditional sheng-style pipe
  side branch is validated by measured coupling.
- `closed_open` with `one_end_closed_reed` if the reed behaves as the closed
  end in a compact control pipe.
- continued `unknown_requires_measurement` with an empirical rationale if
  measurements are useful but no stable pipe law is justified.

Do not fill pipe lengths from a formula until the acoustic law and end
condition are supported by measurements.

## Safety And Handling

- Reed tongues and cut sheet metal can be sharp; deburr edges and use eye
  protection during cutting, filing, and test blowing.
- Avoid mouth contact with unknown donor parts, shop residues, adhesives, or
  solvents. Use a clean test hose or pressure source for early tests.
- Keep reed plates removable so failed reeds, gasket leaks, and debris can be
  inspected without destroying the fixture.
- Do not enclose untested reeds in a sealed decorative shell.

## Promotion Gates

Move from this starter packet to family-scale sheng design only when:

1. At least one P0 reed coupon has measured reed-alone pitch, onset behavior,
   blow/draw behavior, and leak status.
2. One single-pipe control records coupled pitch and pull-down.
3. `family-spec.csv` can replace `unknown_requires_measurement` with a
   justified acoustic law or explicitly remain measurement-required with an
   empirical rationale.
4. A governing DXF/CAD/design table exists for the test article, with
   dimensions tied to measured or intentionally fixed values.
5. BOM and sourcing records identify which parts are measured, in hand,
   unverified supplier specs, or substitution candidates.
