# Wolfram Study Notes

Status: starter model notes only.

No `wolframscript` command was run for this packet, and no notebook output is
claimed as runtime-validated. These notes are a future analysis scaffold for
coupon and single-pipe data once measurements exist.

## Intended Questions

- What reed-alone pitch is measured for each coupon?
- How many cents does the reed pull down when coupled to one pipe?
- Does the coupled pipe behave closer to `side_branch_reed`,
  `closed_open`, or an empirical-only relationship?
- How sensitive are pitch and onset pressure to tongue gap, gasket leakage,
  and windchest volume?

## Starter Variables

```wolfram
reedAloneHz = Missing["NotMeasured"];
coupledHz = Missing["NotMeasured"];
pullDownCents = 1200 Log2[coupledHz/reedAloneHz];
onsetPressurePa = Missing["NotMeasured"];
pipeInsideDiameterMm = Missing["NotMeasured"];
pipeLengthMm = Missing["NotMeasured"];
temperatureC = Missing["NotMeasured"];
relativeHumidityPercent = Missing["NotMeasured"];
```

## Future Command Capture

When Wolfram tooling is available, record commands and outputs here in this
shape:

```text
Command:
wolframscript -file notebooks/sheng-coupon-study.wl

Output:
<paste concise result or generated artifact path>
```

Do not promote these notes to design authority unless the command, input data,
and output are captured in the repo.
