# Week 1 FPGA Guide — 김윤지

- Working branch: `feat/fpga-audio`
- Scope: FPGA RTL/TB, ADC/DAC, 16 kHz timing, BYPASS, SPI slave, Vivado, board waveform
- Excluded: STM32 C implementation and notch DSP implementation
- Week 1 core PASS: measured `ADC → FPGA → DAC BYPASS`

Every generated project file starts as `GENERATED_DRAFT`. Review the circuit
and TB before treating it as reviewed. LAB1–LAB7 are always `KEEP / DO NOT
MODIFY`.

## FPGA W1-0. Git / 파일 준비

**[파일 작업]** KEEP / DO NOT MODIFY

**[원본]** repository root and all `LAB1`–`LAB7`

**[대상]** `PROJECT/FPGA/`

**[이 단계의 목적]** 담당 branch와 dirty working tree를 확인해 다른 사람의
파일을 덮어쓰지 않는다.

**[필요 개념]** branch는 작업 흐름을 분리하지만 untracked file을 자동으로
보호하거나 정리하지 않는다.

**[해야 할 작업]** `project-dev`가 최신인지 확인하고 `feat/fpga-audio`에서
시작한다. 예상하지 못한 변경은 삭제하지 않는다.

**[작성/수정할 코드]** 없음.

**[실행 명령 또는 실행 방법]**

```powershell
git status --short
git branch --show-current
git switch feat/fpga-audio
git log -1 --oneline
```

**[예상 결과]** branch가 `feat/fpga-audio`; 기존 LAB tracked change 없음.

**[Evidence]** 시작 branch, HEAD, `git status` text.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** commit 불필요; 상태만 기록.

**[PASS 조건]** 담당 branch와 보존해야 할 기존 변경을 설명할 수 있다.

## FPGA W1-1. 기존 module 복사와 provenance

**[파일 작업]** COPY

**[원본]**

```text
LAB5/FPGA/03_adc/src/adc_command.v
LAB5/FPGA/03_adc/src/serial_frame16.v
LAB6/FPGA/03_dac/src/dac_parallel8.v
LAB7/FPGA/common/src/spi_slave_rx.v
```

**[대상]**

```text
PROJECT/FPGA/src/io/adc_command.v
PROJECT/FPGA/src/io/serial_frame16.v
PROJECT/FPGA/src/io/dac_parallel8.v
PROJECT/FPGA/src/control/spi_slave_rx.v
```

**[이 단계의 목적]** board-tested low-level interface를 project-owned copy로
분리해 LAB 원본을 보존한다.

**[필요 개념]** 복사 직후 hash가 같으면 source identity가 확인된다. 이후
PROJECT copy 수정으로 hash가 달라져도 원본 LAB은 유지한다.

**[해야 할 작업]** 네 파일의 원본/복사본 SHA-256을 비교한다.

**[작성/수정할 코드]** 이 단계에서는 복사본도 수정하지 않는다.

**[실행 명령 또는 실행 방법]**

```powershell
Get-FileHash -Algorithm SHA256 LAB5/FPGA/03_adc/src/adc_command.v
Get-FileHash -Algorithm SHA256 PROJECT/FPGA/src/io/adc_command.v
# 나머지 세 쌍도 동일하게 비교
```

**[예상 결과]** 각 쌍의 SHA-256 일치.

**[Evidence]** hash 비교 text.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** copy 파일만 stage 후보; LAB 원본은 stage 금지.

**[PASS 조건]** 네 쌍 모두 일치하고 LAB tracked change가 없다.

## FPGA W1-2. 16 kHz sample timing 이론

**[파일 작업]** KEEP

**[원본]** NONE

**[대상]** `PROJECT/FPGA/src/timing/sample_tick.v`

**[이 단계의 목적]** 새 clock domain 없이 50 MHz synchronous logic에
16 kHz one-cycle enable을 만든다.

**[필요 개념]**

```text
50,000,000 / 16,000 = 3125 clocks/sample
Ts = 1 / 16,000 = 62.5 us
```

생성 clock보다 clock enable이 CDC와 timing 관리를 단순화한다.

**[해야 할 작업]** counter terminal count, reset 값, pulse width를 손으로
계산하고 schematic을 그려본다.

**[작성/수정할 코드]** 없음; 다음 단계의 draft를 먼저 읽는다.

**[실행 명령 또는 실행 방법]** source의 `CLOCKS_PER_SAMPLE=3125` 확인.

**[예상 결과]** 3125개 50 MHz edge마다 정확히 한 clock HIGH.

**[Evidence]** 계산과 reviewed 표시.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** commit 불필요.

**[PASS 조건]** 3125와 62.5 us의 관계를 설명할 수 있다.

## FPGA W1-3. `sample_tick.v`

**[파일 작업]** CREATE / EDIT

**[원본]** NONE

**[대상]** `PROJECT/FPGA/src/timing/sample_tick.v`

**[이 단계의 목적]** 50 MHz domain에서 모든 audio operation의 기준 event를
제공한다.

**[필요 개념]** counter width, nonblocking assignment, active-high reset,
parameterization.

**[해야 할 작업]** 제공 draft를 읽고 terminal count가 off-by-one인지 확인한다.

**[작성/수정할 코드]** `CLOCKS_PER_SAMPLE`, counter, one-cycle
`sample_tick`. 별도 16 kHz output clock을 만들지 않는다.

**[실행 명령 또는 실행 방법]** editor lint 후 W1-4 simulation 실행.

**[예상 결과]** reset 중 LOW; 정상 동작 중 3125 clock 간격 pulse.

**[Evidence]** reviewed source commit과 lint/simulation log.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** simulation PASS 뒤 담당 branch commit 권장.

**[PASS 조건]** W1-4 self-checking TB PASS.

## FPGA W1-4. `sample_tick` simulation

**[파일 작업]** CREATE / EDIT

**[원본]** NONE

**[대상]** `PROJECT/FPGA/sim/tb_sample_tick.sv`

**[이 단계의 목적]** reset, interval, pulse width, repeated tick을 자동 검사한다.

**[필요 개념]** TB parameter 축소는 기능 검증 시간을 줄이지만 실제 3125
설정의 Vivado timing/board 검증을 대신하지 않는다.

**[해야 할 작업]** 의도적 failure로 divisor/expected interval 하나를 바꿔
FAIL을 관찰한 뒤 복원하고 다시 PASS한다.

**[작성/수정할 코드]** self-checking assertions와 명확한 PASS message.

**[실행 명령 또는 실행 방법]**

```powershell
python PROJECT/FPGA/tools/fpga_project.py sample_tick
```

**[예상 결과]** `PASS SAMPLE_TICK: reset, interval, one-clock pulse, repeat`.
Windows Icarus 개발판은 정상 output 뒤 exit-code warning을 낼 수 있으므로
fresh output과 `vvp` PASS를 함께 확인한다.

**[Evidence]** normal PASS, intentional FAIL, recovery PASS 각각의 log.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** recovery PASS 상태만 commit.

**[PASS 조건]** normal/recovery PASS와 예상한 intentional FAIL 확보.

## FPGA W1-5. ADC response format 검토

**[파일 작업]** KEEP / DO NOT MODIFY

**[원본]** `LAB5/FPGA/03_adc/src/adc.v`와 LAB5 report/evidence

**[대상]** `PROJECT/FPGA/src/io/adc_reader_16k.v`

**[이 단계의 목적]** 8-bit sample slice를 추측하지 않고 reviewed LAB mapping과
대조한다.

**[필요 개념]** 기존 기록은 AD7908 reply를
`[15]=0, [14:12]=channel, [11:4]=data, [3:0]=0`으로 해석했다.

**[해야 할 작업]** 원본 RTL, TB, 실제 VR 반응 기록을 함께 확인한다. 전압-code
정량 정확도는 기존 LAB에서 측정되지 않았음을 기록한다.

**[작성/수정할 코드]** PROJECT는 현재 `rx_word[11:4]`를 사용한다.

**[실행 명령 또는 실행 방법]** source diff와 LAB5 report의 board observation 확인.

**[예상 결과]** bit slice 선택 근거와 미검증 범위를 말할 수 있다.

**[Evidence]** review note; 기존 waveform을 새 실행 evidence로 복사하지 않음.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** source 변경 전 팀 review.

**[PASS 조건]** slice가 source+TB 근거를 가지며 analog accuracy를 주장하지 않음.

## FPGA W1-6. `adc_reader_16k.v`

**[파일 작업]** CREATE / EDIT

**[원본]** copied `adc_command.v`, `serial_frame16.v`

**[대상]** `PROJECT/FPGA/src/io/adc_reader_16k.v`

**[이 단계의 목적]** sample tick당 한 frame만 시작하고 완료 sample을 한 번만
publish한다.

**[필요 개념]** request/busy/done handshake, first-frame discard, one-cycle
`sample_valid`, overrun indication.

**[해야 할 작업]** tick이 busy와 겹칠 때 새 frame을 중복 시작하지 않고
`sample_drop` event가 발생하는지 review한다.

**[작성/수정할 코드]** channel input, ADC serial pins, 8-bit output,
`sample_valid`, `busy`, `sample_drop`.

**[실행 명령 또는 실행 방법]** W1-9 `audio_bypass` simulation.

**[예상 결과]** first response discarded; 이후 frame마다 RX[11:4] 한 번 전달.

**[Evidence]** frame timing과 sample-valid waveform/log.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** TB PASS 후 commit.

**[PASS 조건]** 중복 start 없음, sample order 유지, drop condition 설명 가능.

## FPGA W1-7. `dac_writer.v`

**[파일 작업]** CREATE / EDIT

**[원본]** `PROJECT/FPGA/src/io/dac_parallel8.v`

**[대상]** `PROJECT/FPGA/src/io/dac_writer.v`

**[이 단계의 목적]** ramp 대신 valid audio sample event에서만 DAC write한다.

**[필요 개념]** data/channel setup 후 active-low WR pulse, sample event rate가
writer service time보다 느려야 함.

**[해야 할 작업]** `sample_valid`, value, A/B channel과 debug last-value를
review한다.

**[작성/수정할 코드]** copied `dac_parallel8` instance와 update interface.

**[실행 명령 또는 실행 방법]** W1-9 simulation에서 `dac_wen` falling edge 검사.

**[예상 결과]** 각 valid sample 값이 변경 없이 DAC bus에 나타남.

**[Evidence]** DAC data/WR timing log 또는 waveform.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** simulation PASS 뒤 commit.

**[PASS 조건]** `00/80/FF`를 포함한 값 전달과 channel control을 설명 가능.

## FPGA W1-8. Week 1 BYPASS top

**[파일 작업]** CREATE / EDIT

**[원본]** NONE; copied low-level modules are dependencies

**[대상]** `PROJECT/FPGA/src/project_top.v`

**[이 단계의 목적]** ADC→sample→DAC transparent datapath와 SPI mode register를
한 top에 연결한다.

**[필요 개념]** module ownership, valid-driven data movement, sticky error,
mode and datapath separation.

**[해야 할 작업]** `FILTER`에서도 Week 1 sample이 그대로 통과함을 확인한다.
notch suppression이라고 기록하지 않는다.

**[작성/수정할 코드]** `sample_tick`, `adc_reader_16k`, `dac_writer`,
`spi_slave_rx`, PROPOSED `0x01/0x02/0x05` handling. LED는 mode/drop/sample debug.

**[실행 명령 또는 실행 방법]** W1-9 simulation 후 Vivado top을 `project_top`으로 설정.

**[예상 결과]** SPI mode register와 무관하게 Week 1 sample이 transparent.

**[Evidence]** hierarchy screenshot 또는 elaboration report, simulation log.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** reviewed top만 commit.

**[PASS 조건]** raw audio가 MCU를 거치지 않으며 mode와 DSP 구현 상태를 구분함.

## FPGA W1-9. BYPASS simulation

**[파일 작업]** CREATE / EDIT

**[원본]** NONE

**[대상]** `PROJECT/FPGA/sim/tb_audio_bypass.sv`

**[이 단계의 목적]** modeled ADC response의 순서와 값이 DAC update까지 보존되는지
검사한다.

**[필요 개념]** TB ADC model은 serial digital response일 뿐 analog converter를
검증하지 않는다.

**[해야 할 작업]** reset, discarded first frame, `12→A5→7E`, DAC write order,
SPI BYPASS/FILTER mode, drop flag를 검사한다.

**[작성/수정할 코드]** self-checking expected array와 timeout.

**[실행 명령 또는 실행 방법]**

```powershell
python PROJECT/FPGA/tools/fpga_project.py audio_bypass
```

**[예상 결과]** `PASS AUDIO_BYPASS: order, unchanged samples, DAC writes, SPI modes, no drop`.

**[Evidence]** PASS log; 필요한 waveform은 현재 실행에서 새로 생성·검토.

**[Evidence target]** `project_evidence/week1/fpga/sim/`

**[Git checkpoint]** PASS 후 source/TB commit.

**[PASS 조건]** sample order/value/reset/mode/drop checks 모두 PASS.

## FPGA W1-10. Vivado

**[파일 작업]** CREATE / EDIT

**[원본]** LAB5/6/7 XDC는 reference이며 통째로 concatenate하지 않음.

**[대상]** `PROJECT/FPGA/constraints/project.xdc`

**[이 단계의 목적]** 필요한 reviewed package pin만 하나의 project XDC에 둔다.

**[필요 개념]** package pin 확인은 physical connector/voltage 확인과 다르다.

**[해야 할 작업]** device `xc7s75fgga484-1`, top `project_top`, source set을
확인하고 synthesis, implementation, DRC, timing, bitstream을 실행한다. MISO는
물리 확인 전 추가하지 않는다.

**[작성/수정할 코드]** XDC port name이 top과 정확히 일치하는지 review.

**[실행 명령 또는 실행 방법]** Vivado GUI 또는 승인된 project Tcl flow.

**[예상 결과]** report마다 status/warnings가 실제로 기록됨. Bitstream 생성은
board PASS가 아니다.

**[Evidence]** version, device, source commit, synth/impl/DRC/timing/warnings,
bitstream path/hash.

**[Evidence target]** `project_evidence/week1/fpga/vivado/`

**[Git checkpoint]** generated Vivado run directory는 commit하지 않음; reviewed
source/XDC만 commit.

**[PASS 조건]** `VIVADO_VERIFIED` 근거가 있고 UCIO/NSTD/error를 설명 가능.

## FPGA W1-11. Board 물리 확인

**[파일 작업]** KEEP / DO NOT MODIFY

**[원본]** physical COMBO II-DLD S75

**[대상]** `project_evidence/week1/board_check/`

**[이 단계의 목적]** 전원 인가/배선 전에 문서 미확정 항목을 실물로 확인한다.

**[필요 개념]** ground continuity, terminal polarity, switch/mux path, chip marking.

**[해야 할 작업]** 전원 OFF에서 ADC IN signal/GND, switch/rotary, DAC OUT A/B,
common GND, BDIO00–03, ADC/DAC marking을 촬영·기록한다.

**[작성/수정할 코드]** 없음.

**[실행 명령 또는 실행 방법]** DMM continuity와 board silkscreen inspection.

**[예상 결과]** 확인된 사실과 `NEEDS_PHYSICAL_BOARD_CHECK` 잔여 항목이 분리됨.

**[Evidence]** 원본 사진과 측정 note.

**[Evidence target]** `project_evidence/week1/board_check/`

**[Git checkpoint]** 개인정보/대용량 영상 정책 확인 후 별도 정리.

**[PASS 조건]** ADC/DAC/GND 배선을 추측 없이 지정할 수 있음.

## FPGA W1-12. ADC 안전 시험

**[파일 작업]** KEEP

**[원본]** reviewed bitstream and confirmed physical wiring

**[대상]** physical ADC path

**[이 단계의 목적]** 과전압/음전압 없이 외부 input code 변화를 확인한다.

**[필요 개념]** AD7908 input은 unipolar. 현재 RANGE/REFIN/AVDD 실장값은
측정 전 확정하지 않는다.

**[해야 할 작업]** generator `High-Z`; 먼저 DC 0.5 V, 다음 1 kHz 0.2 Vpp,
+0.5 V offset. Scope CH1에서 0.4–0.6 V인지 확인하고 0 V 아래로 내리지 않는다.

**[작성/수정할 코드]** 없음. channel/switch가 확인되기 전 임의 변경 금지.

**[실행 명령 또는 실행 방법]** generator OFF 배선 → continuity → DC → sine.

**[예상 결과]** safe input 범위에서 repeatable ADC code change.

**[Evidence]** generator setting, CH1 screenshot, channel/switch, observed code.

**[Evidence target]** `project_evidence/week1/fpga/board/`

**[Git checkpoint]** commit 불필요; evidence metadata에 source commit 기록.

**[PASS 조건]** clipping/negative input 없이 입력 변화와 code 변화 확인.

## FPGA W1-13. DAC 실제 확인

**[파일 작업]** KEEP

**[원본]** reviewed DAC writer/bitstream

**[대상]** physical DAC OUT A/B

**[이 단계의 목적]** channel mapping과 실장 full-scale을 측정한다.

**[필요 개념]** digital write sequence와 analog output verification은 다르다.

**[해야 할 작업]** code `00`, `80`, `FF`를 출력하고 두 단자의 idle/mid/full
voltage와 A/B를 기록한다. Scope는 1 MΩ, DC coupling, ×10 권장, 50 Ω 금지.
speaker/headphone은 직접 연결하지 않는다.

**[작성/수정할 코드]** 필요 시 PROJECT-only diagnostic mode; LAB source 수정 금지.

**[실행 명령 또는 실행 방법]** DMM/scope로 code별 voltage 측정.

**[예상 결과]** A/B와 code-voltage 표. 예상과 다르면 원인을 기록하고 PASS 금지.

**[Evidence]** 단자 사진, scope/DMM 값, source commit.

**[Evidence target]** `project_evidence/week1/fpga/board/`

**[Git checkpoint]** diagnostic source를 사용했다면 별도 reviewed commit.

**[PASS 조건]** DAC analog output이 실제 측정되고 A/B mapping이 기록됨.

## FPGA W1-14. 실제 BYPASS

**[파일 작업]** KEEP

**[원본]** reviewed/simulated/Vivado-verified PROJECT source

**[대상]** Function Generator → ADC → FPGA → DAC → Oscilloscope

**[이 단계의 목적]** Week 1 핵심 physical data path를 검증한다.

**[필요 개념]** CH1/CH2 비교, frequency, DC offset, gain, clipping, polarity,
sample drop.

**[해야 할 작업]** DC/low frequency → 500 Hz → 1 kHz 순서. CH1=ADC input,
CH2=DAC output. 각 조건에서 expected/observed/interpretation을 기록한다.

**[작성/수정할 코드]** notch/filter DSP는 추가하지 않는다.

**[실행 명령 또는 실행 방법]** 안전 시험 조건을 유지하며 scope 캡처.

**[예상 결과]** 입력과 같은 주파수의 unclipped DAC waveform. 8-bit quantization,
offset/gain은 측정값으로 기록한다.

**[Evidence]** 전체 배선, CH1/CH2 screenshots, settings, run date/source commit.

**[Evidence target]** `project_evidence/week1/fpga/board/`

**[Git checkpoint]** board evidence 생성 뒤 source identity 재확인.

**[PASS 조건]** 실제 `ADC → FPGA → DAC BYPASS`가 `BOARD_VERIFIED` 근거를 가짐.

## FPGA Week 1 exit checklist

- [ ] copied source hash 확인
- [ ] sample tick normal/failure/recovery
- [ ] digital BYPASS simulation PASS
- [ ] Vivado reports 확보
- [ ] ADC/DAC physical mapping과 voltage 확인
- [ ] 500 Hz/1 kHz physical BYPASS
- [ ] evidence가 현재 실행·현재 commit과 연결됨
