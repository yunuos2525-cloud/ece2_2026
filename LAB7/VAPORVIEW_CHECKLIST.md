# LAB7 VaporView visual inspection checklist

Open the corresponding `evidence/vscode/LAB7/<task>/wave.vcd`. The generated
`waveform_summary.png` is an automatic aid; it does not record human approval.

For each Task 10–12 waveform, record reviewer name/date and check:

- [ ] CS is HIGH while idle and LOW for the complete frame.
- [ ] SCK is LOW before CS and returns LOW before/with CS HIGH.
- [ ] Exactly eight SCK rising edges occur while CS is LOW.
- [ ] MOSI is stable around every rising edge.
- [ ] The first MOSI bit is present before rising edge 1.
- [ ] Later MOSI transitions occur only after falling edges.
- [ ] Rising-edge samples decode MSB-first as `55`, `A5`, `00`, `FF`.
- [ ] `rx_valid` is a one-cycle pulse after the eighth received bit (receiver tasks).
- [ ] `rx_data`/LED retains the completed byte.
- [ ] UART frames are start LOW, eight LSB-first data bits, stop HIGH.
- [ ] CS HIGH clocks are ignored and a partial frame is discarded (Task 10).
- [ ] Frame-to-frame sequence and interval are correct (Task 11/12).

Visual review status at preparation time: **NOT_VERIFIED**.
