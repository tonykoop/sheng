# Sheng Prototype Supplier RFQ Notes

This is not a current quote request and does not claim price, availability, or
lead time.

## Quote Only After Measurements

Do not send an RFQ for a full branch until these rows exist:

- Reed-alone pitch.
- Onset pressure.
- Blow/draw behavior.
- Gap setting.
- Window size.
- Gasket leak status.
- One coupled single-pipe pitch.

## Candidate RFQ Fields

| Field | Required Detail |
| --- | --- |
| Branch | `traditional-side-branch` or `compact-control` |
| Reed material | Measured or specified alloy and thickness |
| Reed window | DXF/CAD authority file, not a concept image |
| Pipe material | Candidate material and bore/slot tolerance |
| Gasket | Material, compression stop, leak land |
| Service access | Direction and fastener access for reed replacement |

