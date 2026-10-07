# STM32 PRE 보고서 정책

## 1. 목적과 적용 범위

이 문서는 전자전기컴퓨터설계실험Ⅱ의 STM32 예비보고서를 작성할 때 사용하는 공통 정책이다. `STM32_0`부터 이후 STM32 실습에 재사용하며, 수업자료가 별도의 형식이나 검증 방법을 명시하면 수업자료를 우선한다. FPGA 중심 절차를 MCU 실습에 기계적으로 적용하지 않고, 실제 수행 기록과 하드웨어 동작 예상을 구분하는 것이 핵심이다.

## 2. 공통 원칙

### STM32-PRE-01 — Build와 기능 검증의 구분

STM32의 Build 성공은 C source compile 성공, link 성공, ELF 생성까지만 뜻한다. Build만으로 LED, button, timer, UART 등 실제 주변장치가 의도대로 동작했다고 판단하지 않는다. 보고서에는 Build 결과와 실제 보드 검증 상태를 별도로 기록한다.

### STM32-PRE-02 — STM32에 맞는 PRE 검증 흐름

수업자료에서 MCU simulator나 waveform을 요구하지 않으면 FPGA와 같은 파형 evidence를 만들지 않는다. STM32 PRE의 기본 흐름은 다음과 같다.

> 설계 원리 → 핵심 C 코드 → 예상 시간 동작 → Build 성공 여부 → 실제 보드 검증 계획

### STM32-PRE-03 — Build evidence 사용

`build.log`는 실행한 toolchain과 compile/link 과정을 확인할 수 있는 provenance로 보관한다. 보고서 본문에는 긴 로그를 붙이지 않고 필요한 범위에서 “compile/link가 정상 완료되었고 ELF가 생성되었다”와 같이 요약한다. `build_success.png`는 실제 존재하더라도 모든 실험에 필수 evidence로 강제하지 않는다.

### STM32-PRE-04 — 보드가 없을 때의 표현

보드 실험 전에는 실제 동작 결과를 쓰지 않는다. “동작할 것으로 예상된다”, “실제 보드에서 확인할 예정이다”와 같이 예상 또는 계획으로 표현한다. “정상 동작하였다”, “확인하였다”, “검증되었다”와 같은 표현은 실제 관찰 근거가 있을 때만 사용한다. Build 성공 자체는 Build 결과로 기록할 수 있다.

### STM32-PRE-05 — HAL 코드와 하드웨어의 연결

핵심 C 코드는 문법만 나열하지 않고 하드웨어 동작과 연결하여 설명한다.

- `HAL_GPIO_WritePin()`은 CPU가 GPIO 출력 상태를 갱신하게 하며, 출력 핀의 전압 변화가 LED 상태 변화로 이어진다.
- `HAL_GPIO_ReadPin()`은 GPIO 입력 핀의 논리 상태를 CPU가 읽게 한다.
- `HAL_GPIO_TogglePin()`은 현재 GPIO 출력 상태를 반전한다.
- `HAL_GetTick()`은 millisecond 단위 시간 기준을 읽어 blocking 없이 시간 조건을 검사하는 데 사용한다.

### STM32-PRE-06 — 필요한 C 개념만 설명

코드 이해에 직접 필요한 C 개념만 설명한다. LAB4의 주요 항목은 `uint32_t`, static local variable, `GPIO_PinState`, 함수 호출, 조건문, 삼항 연산자, `HAL_GetTick()`, unsigned 시간차 계산이다. 일반 C 교과서식 설명이나 실제 코드와 관계없는 문법 설명은 넣지 않는다.

### STM32-PRE-07 — Polling 실행 흐름과 시간 의미

Polling 기반 코드는 `polling_routine()`이 반복 호출되는 실제 순서에 맞추어 설명한다. 버튼 조건 검사와 LED 시간 조건을 독립된 `if` 문으로 두면, 버튼 입력을 기다리는 동안에도 LED 시간 조건을 계속 검사할 수 있다. `HAL_Delay()` 대신 `HAL_GetTick()`의 시간차를 사용하면 CPU를 대기 상태로 묶지 않고 여러 조건을 계속 polling할 수 있다. Interval은 LED가 ON 또는 OFF 상태에서 다음 상태로 바뀔 때까지의 간격으로 해석하며, interval 변경 시점과 다음 toggle 시점의 관계도 실제 구현을 기준으로 기록한다.

### STM32-PRE-08 — Example과 Task의 비중

Example은 수업자료가 제공한 기본 동작이며 Task를 이해하기 위한 준비 예제이다. Task는 해당 주차의 설계 과제이다. 보고서에서는 Example을 핵심 원리 위주로 압축하고 Task의 설계, 시간 동작, 검증 계획을 중심으로 설명한다. Example과 Task를 동일한 분량으로 다룰 필요는 없다.

### STM32-PRE-09 — 실제 board evidence의 시점

실제 보드 관찰은 실험 이후의 POST evidence로 기록한다. LAB4 PRE에서는 다음 항목을 검증 계획으로만 작성한다.

- Example 1: onboard LED가 1 s마다 상태 변경
- Example 2: 버튼 1회 누름마다 onboard LED 1회 toggle
- Task 1: onboard LED의 상태 변경 간격이 1 → 2 → 4 → 8 → 1 s 순환
- Task 1: 버튼을 길게 눌러도 interval이 1회만 변경
- Task 2: PB0 외부 LED에서 Task 1과 같은 interval 동작

### STM32-PRE-10 — Evidence 구조와 진실성

STM32 evidence는 다음 구조를 사용한다.

```text
stm32_evidence/
├─ build/LABx/...   # configure, compile, link, ELF 관련 evidence
├─ debug/LABx/...   # debugger, variable inspection, serial 관련 evidence
└─ board/LABx/...   # 실제 하드웨어 관찰 evidence
```

실제 존재하는 evidence만 참조한다. 아직 수행하지 않은 debug 또는 board 결과를 채우기 위한 파일, 이미지, 로그를 만들지 않는다.

## 3. 보고서 작성 및 QA

- 중요한 주장은 시험 조건, 예상 결과, 관찰 결과, 해석을 구분한다.
- 핵심 코드만 발췌하고 전체 source 또는 긴 build log를 본문에 복제하지 않는다.
- Build evidence가 증명하는 범위를 compile/link/ELF로 제한한다.
- 실제 보드 관찰이 없으면 기능 결과 대신 예상 동작과 실험 계획을 쓴다.
- 수업자료에 없는 기능, 측정값, 경고 수, 디버거 결과를 추측하지 않는다.
- 제출용 본문에는 automation용 상태 문자열이나 빈 placeholder를 노출하지 않는다.
