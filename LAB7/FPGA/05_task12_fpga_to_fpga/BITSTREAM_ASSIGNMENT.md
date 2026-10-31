# Task 12 bitstream assignment

Task 12 uses the exact role bitstreams generated for Tasks 10 and 11; it has no
separate hardware top or `.bit` file.

| FPGA role | Bitstream | SHA-256 |
|---|---|---|
| Slave / receiver | `evidence/vivado/LAB7/task10/final_pinmap_implementation/task10_mcu_fpga_rx_top.bit` | `310a4e554ee58d12f838e7de99cb1b7b84a04280e1894356c57d17db527f188a` |
| Master / transmitter | `evidence/vivado/LAB7/task11/final_pinmap_implementation/task11_fpga_mcu_tx_top.bit` | `07aa7a67b13cf4dbea86d8a039bf4d4c7ab39ec3b6aed7b940bc00ec4dca97cc` |

For A→B, program A as master and B as slave. For B→A, exchange those two
bitstreams. Both boards use `SCK=BDIO00/F8`, `MOSI=BDIO01/E8`, and
`CS=BDIO02/A7`, so the external signal wires remain name-to-name.

Do not program or connect external hardware until the physical BDIO header
positions, switch/jumper paths, common ground, and 3.3 V compatibility have
been checked on the actual boards. Bitstream preparation is not board proof.
