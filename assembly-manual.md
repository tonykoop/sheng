# Sheng Scaffold Assembly Manual

Status: scaffold-only sequence. Not build-ready.

## Branch Setup

1. Read `architecture-choice.md`.
2. Select either `traditional-side-branch` or `compact-control`.
3. Keep the selected branch's `family-spec.csv` beside the bench notes.
4. Do not mix branch rows in one control article.

## P0 Reed Coupon

1. Make or fixture one reed coupon.
2. Record reed source, material, gap setting, and window size in
   `p0-reed-coupon-log.csv`.
3. Measure reed-alone pitch.
4. Measure onset pressure and blow/draw response.
5. Record gasket leak status.
6. Capture pull-down and onset details in
   `p0-pull-down-capture-form.csv` and `p0-onset-capture-form.csv`.

## Single-Pipe Control

1. Pick one target row from the selected branch.
2. Build one pipe only.
3. Measure coupled pitch at a logged temperature and humidity.
4. Compare the result to the declared `acoustic_law` and `end_condition`.
5. Update the branch row or mark it `measurement_required` if the law does not
   match measured behavior.

## Stop Point

Stop before full sheng body layout until the coupon and single-pipe gates in
`validation.csv` are complete.
