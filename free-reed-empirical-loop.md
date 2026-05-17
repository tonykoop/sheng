# Free-Reed P0/P1 Empirical Loop

Status: L2 validation protocol. This is not build-ready fabrication geometry.

Use this loop before promoting either sheng branch beyond scaffold status. The
same coupon ID must follow the evidence chain from reed-alone testing into one
single-pipe control so branch behavior is traceable.

## P0 Reed Coupon

1. Source and identify the reed.
   Record `reed_source`, `source_status`, `source_provenance`, material, tongue
   length, tongue width, thickness, window length, window width, and frame land
   width in `p0-reed-coupon-log.csv`.
2. Inspect and make safe.
   Deburr all cut metal, confirm the reed plate is mechanically retained, and
   set a conservative pressure limit before blowing or using shop air.
3. Measure reed-alone pitch.
   Use a tuner or frequency logger while sweeping pressure slowly. Record the
   stable pitch range and the measurement environment.
4. Measure onset.
   Use a manometer or pressure sensor and record the first repeatable speaking
   pressure. If the reed starts only at unsafe pressure, stop and mark the
   coupon blocked.
5. Measure pull-down.
   Test whether the reed can be pulled toward the target note without choking,
   buzz instability, or unsafe pressure. Record target cents and measured cents.
6. Check leakage.
   Run a low-pressure hold on the coupon fixture. Leakage must be separated
   from reed instability before the coupon is allowed into P1.

## P1 Single-Pipe Control

1. Choose exactly one branch.
   Use `traditional-side-branch` for the side-branch reed model or
   `compact-control` for the closed-open control model.
2. Copy the P0 coupon ID into `p1-single-pipe-control-log.csv`.
   Do not create anonymous P1 rows.
3. Build only the single-pipe control.
   Full-family body layout waits until one branch has measured coupled pitch,
   onset behavior, leak status, and service-access evidence.
4. Record windchest geometry planning data.
   Fill `windchest-geometry-plan.csv` for chamber ID, chamber volume, inlet,
   pressure tap, gasket land, service direction, and leak-test method.
5. Measure coupled behavior.
   Record pitch, pitch error in cents, onset pressure, blow/draw behavior,
   chamber leak status, and service-access result.
6. Promote or revise.
   If coupled pitch or onset contradicts the declared acoustic law, keep the
   branch at L2 and revise the family-spec rows before any DXF/CAD authority.

## Stop Conditions

- Reed plate shifts, lifts, or ejects during pressure testing.
- Sharp reed tongue or burr remains after inspection.
- Onset requires pressure above the logged safe limit.
- Leak test cannot distinguish chamber leakage from reed response.
- The P1 row lacks a traceable P0 coupon ID.
- A drawing or generated image is being treated as dimensional authority before
  measured coupon and single-pipe data exist.
