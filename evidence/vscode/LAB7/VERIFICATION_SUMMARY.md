# LAB7 Icarus verification summary

All three latest runs use self-checking testbenches and finished with exit code
0. Input SHA-256 values and the selected run directory are recorded in each
`result.json`.

| Task | Result | Main checks | Evidence |
|---|---|---|---|
| 10 | PASS | four bytes, CS-HIGH ignore, partial-frame abort, MSB order, valid pulse, LED, UART | `task10_mcu_to_fpga_rx/` |
| 11 | PASS | Mode 0 edges, 8 rises, SCK ratio, first-bit setup, byte sequence, frame interval, idle return | `task11_fpga_to_mcu_tx/` |
| 12 | PASS | exact Task 10/11 RTL reuse, four link bytes, receive valid/data, debug value, UART | `task12_fpga_to_fpga/` |

Each folder contains the latest `simulation.log`, VCD, `result.json`, and an
automatic PNG overview. Empty `compile.log` files mean Icarus emitted no
compiler diagnostics. VaporView visual approval remains `NOT_VERIFIED`.
