# COMBO II-DLD S75 Project Pin Map

Package pins are copied from reviewed LAB XDCs. A package assignment does not
confirm the physical terminal, switch/jumper route or measured voltage.

## ADC digital interface

| Signal | Package pin | Status |
|---|---|---|
| `adc_ncs` | H3 | `CONFIRMED_FROM_LOCAL_SOURCE` |
| `adc_din` | H5 | `CONFIRMED_FROM_LOCAL_SOURCE` |
| `adc_dout` | J6 | `CONFIRMED_FROM_LOCAL_SOURCE` |
| `adc_sclk` | H7 | `CONFIRMED_FROM_LOCAL_SOURCE` |

## DAC digital interface

| Signal | Package pin |
|---|---|
| `dac_a_b` | G2 |
| `dac_csn` | E1 |
| `dac_ldacn` | F4 |
| `dac_wen` | G4 |
| `dac_d[0]` | E3 |
| `dac_d[1]` | E5 |
| `dac_d[2]` | D2 |
| `dac_d[3]` | D5 |
| `dac_d[4]` | C2 |
| `dac_d[5]` | C4 |
| `dac_d[6]` | B1 |
| `dac_d[7]` | B3 |

Status: `CONFIRMED_FROM_LOCAL_SOURCE` for package assignments.

## FPGA ↔ MCU SPI

| Logical signal | Board label | Package pin | Status |
|---|---|---|---|
| `spi_sck` | BDIO00 | F8 | package pin confirmed; physical path pending |
| `spi_mosi` | BDIO01 | E8 | package pin confirmed; physical path pending |
| `spi_cs_n` | BDIO02 | A7 | package pin confirmed; physical path pending |
| `spi_miso` | BDIO03 candidate | G8 candidate | `PACKAGE_PIN_CANDIDATE / NEEDS_PHYSICAL_BOARD_CHECK` |

## Analog and physical checks

All remain `NEEDS_PHYSICAL_BOARD_CHECK`:

- `ADC IN` signal/GND pole
- external ADC channel
- ADC input switch/rotary position
- ADC REFIN and AVDD
- DAC OUT A/B and signal/GND mapping
- DAC VDD/REFIN and full-scale
- BDIO03 MISO connector/switch/3.3 V path
- common-ground continuity and absence of peripheral contention

`PROJECT/FPGA/constraints/project.xdc` intentionally omits MISO.
