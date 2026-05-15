(* Sheng mouth-organ branch comparison starter.
   Scaffold only: validates first-pass length math, not reed behavior. *)

speedOfSoundMmS = 343000.;
endCorrectionMm = 8.13;

sideBranchLengthMm[freqHz_] := speedOfSoundMmS/(2 freqHz) - endCorrectionMm;
closedOpenLengthMm[freqHz_] := speedOfSoundMmS/(4 freqHz) - endCorrectionMm/2;

notes = {
  {"D4", 293.66},
  {"E4", 329.63},
  {"G4", 392.00},
  {"A4", 440.00},
  {"C5", 523.25},
  {"D5", 587.33},
  {"E5", 659.25},
  {"G5", 784.00}
};

branchComparison = notes /. {note_, hz_} :> {
    note,
    hz,
    sideBranchLengthMm[hz],
    closedOpenLengthMm[hz]
  };

Grid[
  Prepend[branchComparison, {"note", "Hz", "side_branch_reed mm", "closed_open mm"}],
  Frame -> All
]

