# LAB7 automated test vectors

| Task | Stimulus | Expected automatic checks |
|---|---|---|
| 10 | CS-HIGH SCK pulses | no `rx_valid` |
| 10 | four-bit partial frame then CS HIGH | state reset; no completed byte |
| 10 | `55 A5 00 FF` complete frames | exact MSB-first `rx_data`, one valid pulse, LED update, UART byte |
| 11 | reset then four automatic frames | SCK idle LOW, MSB preloaded, eight rising edges, 100 ns accelerated SCK period, 1200 ns accelerated start interval, byte sequence |
| 12 | exact Task 11 top wired to exact Task 10 top | four matching SPI bytes, receiver valid pulse, transmitter/receiver debug value, receiver UART byte |

Testbench clock/rate parameters are deliberately accelerated. Hardware tops
default to 50 MHz, 1 MHz SCK, 9600 baud, and 50,000,000-cycle frame interval.
