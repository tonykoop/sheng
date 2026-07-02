(* instrument-maker-v4.2 Wolfram packet source *)
ClearAll["Global`*"];

packetDir = "/mnt/c/Users/Tony/Documents/GitHub/instruments/woodwind/sheng";
metadata = <|
  "PacketName" -> "Sheng Traditional and Compact Prototype Packet",
  "PacketPath" -> ".",
  "GeneratedOn" -> "2026-07-01",
  "Model" -> "Generic",
  "HasFamilySpec" -> False,
  "HasValidation" -> True,
  "HasCncPlan" -> False
|>;

familySpecPath = FileNameJoin[{packetDir, "family-spec.csv"}];
validationPath = FileNameJoin[{packetDir, "validation.csv"}];
cncPlanPath = FileNameJoin[{packetDir, "cnc", "cnc-plan.json"}];

familySpec = If[FileExistsQ[familySpecPath],
  Import[familySpecPath, "Dataset"],
  Dataset[ImportString["[]", "JSON"]]
];

validationData = If[FileExistsQ[validationPath],
  Import[validationPath, "Dataset"],
  Dataset[ImportString["[{\"gate_id\": \"VAL-001\", \"branch\": \"both\", \"gate\": \"architecture_choice\", \"required_evidence\": \"architecture-choice.md branch selected before layout\", \"status\": \"open\", \"next_action\": \"Pick one branch for the next drawing or coupon\"}, {\"gate_id\": \"VAL-002\", \"branch\": \"traditional-side-branch\", \"gate\": \"acoustic_law_validator\", \"required_evidence\": \"traditional-side-branch/family-spec.csv passes validate_acoustic_law.py\", \"status\": \"open\", \"next_action\": \"Run validator after any row edit\"}, {\"gate_id\": \"VAL-003\", \"branch\": \"compact-control\", \"gate\": \"acoustic_law_validator\", \"required_evidence\": \"compact-control/family-spec.csv passes validate_acoustic_law.py\", \"status\": \"open\", \"next_action\": \"Run validator after any row edit\"}, {\"gate_id\": \"VAL-004\", \"branch\": \"both\", \"gate\": \"p0_reed_coupon\", \"required_evidence\": \"reed-alone pitch onset pressure blow/draw behavior gap and leak status recorded\", \"status\": \"partial_evidence\", \"next_action\": \"Round 33C added single-pass P0 rows; repeat before promotion or CAD authority\"}, {\"gate_id\": \"VAL-005\", \"branch\": \"traditional-side-branch\", \"gate\": \"p1_single_pipe_control\", \"required_evidence\": \"one measured side-branch pipe confirms or revises side_branch_reed row and cites P0 coupon ID\", \"status\": \"open\", \"next_action\": \"Build one coupon-to-pipe test before full sheng layout\"}, {\"gate_id\": \"VAL-006\", \"branch\": \"compact-control\", \"gate\": \"p1_single_pipe_control\", \"required_evidence\": \"one measured closed-open pipe confirms or revises compact row and cites P0 coupon ID\", \"status\": \"partial_evidence\", \"next_action\": \"Round 33C added one traceable compact P1 row; repeat with measured leak rate before compact branch promotion\"}, {\"gate_id\": \"VAL-007\", \"branch\": \"both\", \"gate\": \"dxf_authority\", \"required_evidence\": \"mouth-organ-dxf-checklist.csv completed for chosen branch\", \"status\": \"open\", \"next_action\": \"Create DXF/CAD only after coupon and single-pipe evidence\"}, {\"gate_id\": \"VAL-008\", \"branch\": \"both\", \"gate\": \"visual_authority\", \"required_evidence\": \"visual-output-register.csv passes validate_visual_authority.py and generated images are marked concept_only or reference_only\", \"status\": \"open\", \"next_action\": \"Keep CAD DXF design table or measured template as fabrication authority\"}]", "JSON"]]
];

frequencyFromMidi[midi_, a4_: 440] := a4*2^((midi - 69)/12);
centsError[measured_, target_] := 1200*Log[2, measured/target];
openPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(2*freq) - 2*0.6*radius;
stoppedPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(4*freq) - 0.6*radius;
helmholtzFrequency[area_, volume_, leff_, c_: 13552] :=
  (c/(2*Pi))*Sqrt[area/(volume*leff)];
cantileverFrequency[k_, thickness_, length_] := k*thickness/length^2;
stringFrequency[length_, tension_, linearDensity_] :=
  1/(2*length)*Sqrt[tension/linearDensity];

modelExplorer = Switch[metadata["Model"],
  "Helmholtz",
    Manipulate[
      helmholtzFrequency[portArea, chamberVolume, effectiveLength],
      {{portArea, 0.4, "port area (in^2)"}, 0.05, 4},
      {{chamberVolume, 40, "volume (in^3)"}, 5, 400},
      {{effectiveLength, 0.6, "effective length (in)"}, 0.05, 3}
    ],
  "OpenPipe",
    Manipulate[
      openPipeLengthIn[f, 13552, radius],
      {{f, 440, "target Hz"}, 80, 1200},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "StoppedPipe",
    Manipulate[
      stoppedPipeLengthIn[f, 13552, radius],
      {{f, 220, "target Hz"}, 40, 1000},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "CantileverBeam",
    Manipulate[
      cantileverFrequency[k, thickness, length],
      {{k, 24000, "K constant"}, 1000, 80000},
      {{thickness, 0.25, "thickness (in)"}, 0.05, 1},
      {{length, 4.5, "length (in)"}, 0.5, 24}
    ],
  _,
    Manipulate[
      frequencyFromMidi[midi],
      {{midi, 69, "MIDI note"}, 24, 96, 1}
    ]
];

audioPreview[f_: 440, seconds_: 1.5] :=
  AudioNormalize[
    AudioAdd[
      AudioGenerator[{"Sin", f}, seconds],
      .35 AudioGenerator[{"Sin", 2 f}, seconds],
      .18 AudioGenerator[{"Sin", 3 f}, seconds]
    ]
  ];

validationRows = Normal[validationData];
validationPlot = Quiet@Check[
  ListPlot[
    DeleteMissing[
      ToExpression /@ Lookup[validationRows, "Cents Error", Missing[]]
    ],
    PlotTheme -> "Scientific",
    Frame -> True,
    FrameLabel -> {{"Cents error", None}, {"Measurement row", metadata["PacketName"]}}
  ],
  "No numeric validation cents-error values yet."
];

packetNotebook[] := CreateDocument[
  {
    TextCell[metadata["PacketName"], "Title"],
    TextCell["instrument-maker v4.2 computational packet", "Subtitle"],
    TextCell["Metadata", "Section"],
    ExpressionCell[metadata, "Input"],
    TextCell["Family/design data", "Section"],
    ExpressionCell[familySpec, "Input"],
    TextCell["Model explorer", "Section"],
    ExpressionCell[modelExplorer, "Input"],
    TextCell["Audio preview", "Section"],
    ExpressionCell[audioPreview[440], "Input"],
    TextCell["Validation", "Section"],
    ExpressionCell[validationPlot, "Input"]
  },
  WindowTitle -> metadata["PacketName"]
];

packetNotebook[];
