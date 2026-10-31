# LAB7 STM32 role sources and builds

실제 수정 대상은 `C:/Users/yunji/ece2/stm32_lab/Core/Src/ece2_474_routine.c`이다.
이 디렉터리에는 task/role별로 학생이 검토한 소스 스냅샷을 보관한다.

| 폴더 | 용도 | 소스 관계 |
|---|---|---|
| `01_task8_spi_tx_scope/` | MCU SPI master 송신 및 scope 확인 | `ece2_474_routine.c` |
| `02_task9_mcu_to_mcu/` | 두 MCU의 master/slave 역할 교대 | `master/ece2_474_routine.c`, `slave/ece2_474_routine.c` |
| `03_task10_mcu_to_fpga/` | Task 8 master 재사용 | `common/ece2_474_spi_master_sequence.c` |
| `04_task11_fpga_to_mcu/` | Task 9 slave 재사용 | `common/ece2_474_spi_slave_uart.c` |

Task 폴더의 짧은 `ece2_474_routine.c`는 저장소 안에서 공통 소스와의
identity를 보여 주는 include wrapper다. STM32 working project에 wrapper만
복사하지 말고 `LAB7/tools/build_stm32_roles.ps1` 또는 대응 `common/*.c`
원본을 사용한다.

다섯 role build는 실제 수행했으며 ELF/HEX/BIN과 source SHA-256은
`stm32_evidence/build/LAB7/<role>/`에 있다. Working project의 원래 routine은
`_workspace_backup/`에서 복구했고 복구 후에도 다시 빌드했다. Task 12는
MCU를 사용하지 않는다.
