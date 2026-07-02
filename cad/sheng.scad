// Sheng pipe-rank ENVELOPE master — branch comparison, both architectures.
//
// Authority: pending_measurement. NOT fabrication authority until reviewed.
//
// SCOPE: this file models ONLY the pipe-rank envelope (pipe length + rank
// position) for each architecture branch, using the exact predicted_L_geom_mm
// values already published in the branch family-spec.csv tables. It is a
// branch-comparison / packaging-envelope aid, nothing more.
//
// OUT OF SCOPE (do NOT add without measured evidence):
//   - Reed/reed-table geometry (window, tongue, gap, frame land).
//   - Windchest chamber, socket map, gasket land, pressure path, service
//     access.
//   - Voicing, onset pressure, pull-down, blow/draw behavior.
// All of the above are unknown_requires_measurement per
// cad/p0-p1-control-parameters.csv (reed gates stay OPEN — legitimately
// unmeasured). This master must be hand-refined only after P0 reed-coupon and
// P1 single-pipe control-log measurements exist (see
// free-reed-empirical-loop.md, p0-reed-coupon-log.csv,
// p1-single-pipe-control-log.csv).
//
// Dimension sources (do not edit length values without updating the source
// table row):
//   - traditional_lengths_mm[] <- traditional-side-branch/family-spec.csv
//     column predicted_L_geom_mm (dimension_provenance=physics_derived,
//     acoustic_law=side_branch_reed, end_condition=both_ends_open, half-wave
//     row per architecture-choice.md).
//   - compact_lengths_mm[] <- compact-control/family-spec.csv column
//     predicted_L_geom_mm (dimension_provenance=physics_derived,
//     acoustic_law=closed_open, end_condition=one_end_closed_reed,
//     quarter-wave row per architecture-choice.md).
//   - Both tables are branch-comparison scaffolds only (design.md "Scope");
//     rows are physics_derived / analysis_only, not cut-ready
//     (cad/p0-p1-control-parameters.csv rows CAD-P1-TRAD-001 /
//     CAD-P1-COMP-001).
//   - pipe_dia_mm below is a visualization_placeholder / prototype_assumption
//     ONLY — real bore/reed-window geometry is unknown_requires_measurement
//     (CAD-P0-001, CAD-P0-002). It carries no acoustic or fabrication
//     authority; it exists only so the rank envelope renders as solid stock.
//
// Units: millimeters.

/* [Branch selection] */
// 0 = traditional-side-branch only, 1 = compact-control only,
// 2 = both, side-by-side for comparison (default; matches packet's stated
// purpose of publishing both branches as separate, comparable variants).
branch_display = 2;

/* [Pipe-rank note table — shared note set across both branches] */
note_names = ["D4", "E4", "G4", "A4", "C5", "D5", "E5", "G5"];
target_hz  = [293.66, 329.63, 392.00, 440.00, 523.25, 587.33, 659.25, 784.00];

// traditional-side-branch/family-spec.csv, predicted_L_geom_mm column,
// rows SNG-TRAD-D4 .. SNG-TRAD-G5 (half-wave, side_branch_reed).
traditional_lengths_mm = [575.9, 512.2, 429.4, 381.6, 319.6, 283.9, 252.0, 210.6];

// compact-control/family-spec.csv, predicted_L_geom_mm column,
// rows SNG-COMP-D4 .. SNG-COMP-G5 (quarter-wave, closed_open).
compact_lengths_mm = [287.9, 256.1, 214.7, 190.8, 159.8, 141.9, 126.0, 105.3];

/* [Envelope-only cross-section — visualization placeholder, not a bore spec] */
pipe_dia_mm     = 10;  // prototype_assumption; NOT reed window / bore geometry
pipe_gap_mm     = 6;   // prototype_assumption; rank spacing clearance only
branch_offset_mm = 250; // separation between the two comparison ranks (display only)

// ---------------------------------------------------------------------------
// Derived geometry (equation-driven placement; lengths themselves are the
// published table values above, not derived here)
// ---------------------------------------------------------------------------

pitch_mm = pipe_dia_mm + pipe_gap_mm;

function rank_x(i) = i * pitch_mm;

// One envelope pipe: a plain round blank of the table length, standing on
// the rank baseline (z=0). No reed window, bore taper, or socket cut — those
// are out of scope per header.
module envelope_pipe(length_mm) {
  cylinder(h = length_mm, d = pipe_dia_mm, $fn = 32);
}

module pipe_rank(lengths_mm) {
  for (i = [0 : len(lengths_mm) - 1])
    translate([rank_x(i), 0, 0])
      envelope_pipe(lengths_mm[i]);
}

module traditional_side_branch_rank() {
  // side_branch_reed, both_ends_open — half-wave rank.
  pipe_rank(traditional_lengths_mm);
}

module compact_control_rank() {
  // closed_open, one_end_closed_reed — quarter-wave rank.
  pipe_rank(compact_lengths_mm);
}

module sheng_envelope_assembly() {
  if (branch_display == 0) {
    traditional_side_branch_rank();
  } else if (branch_display == 1) {
    compact_control_rank();
  } else {
    // Both branches, offset along Y so neither rank overlaps the other.
    // This is a display convenience only — it does not imply a shared
    // windchest or fabrication layout between the two branches
    // (design.md: "Do not mix rows across branches in one fabrication
    // drawing.").
    translate([0, 0, 0])
      traditional_side_branch_rank();
    translate([0, branch_offset_mm, 0])
      compact_control_rank();
  }
}

sheng_envelope_assembly();

// Echo the rank tables so `openscad` doubles as a length-table sanity check
// against the source family-spec.csv files.
for (i = [0 : len(note_names) - 1])
  echo(str("traditional_", note_names[i], "_L_geom_mm=", traditional_lengths_mm[i]));
for (i = [0 : len(note_names) - 1])
  echo(str("compact_", note_names[i], "_L_geom_mm=", compact_lengths_mm[i]));
