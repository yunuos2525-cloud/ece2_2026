# LAB1 Board Evidence Metadata

## 1. Scope and demo selection

- lab: LAB1
- metadata_scope: POST_BOARD_EVIDENCE (내부 사실 기록이며 제출 보고서 본문이 아님)
- DEMO_SELECTION_STATUS: USER_CONFIRMED
- selected_demo_experiments: 06_mux, 10_7seg_decoder
- selection_provenance: USER_REPORTED
- selection_basis: 사용자가 실제 조교 선정 시연 실험을 명시적으로 확인함
- board_photo_submission_scope: 조교 선정 위 2개 실험만
- other_experiments: 기존 영상·프레임을 raw/참고 evidence로 보존하고 제출 board 사진 대상으로 사용하지 않음
- selection_inference_policy: video/frame 존재에서 demo 선정을 추론하지 않음
- 06_mux_REPORT_EVIDENCE_STRENGTH: WEAK
- 10_7seg_decoder_priority_candidates: 8 표시 장면 재선정 필요, 14.233 s (F 표시); 사용자 확인에 따라 기존 A 해석 철회
- 10_7seg_decoder_input_status: USER_CONFIRMED; 8 = 4'b1000, F = 4'b1111; provenance USER_REPORTED
- existing_PRE_manifests: 수정하지 않음; PRE 시점의 board 계획/미수행 기록을 POST 사용자 확인으로 소급 변경하지 않음

## 2. MUX user-confirmed performed procedure

- procedure_status: USER_CONFIRMED
- procedure_provenance: USER_REPORTED
- source_video: evidence/board/LAB1/raw_videos/LAB1_06_mux_board.mp4

1. selector s=00 설정
2. data input 1,2,3,4를 차례로 눌러 출력 확인
3. selector s=01 설정
4. data input 1,2,3,4를 차례로 눌러 출력 확인
5. selector s=10 설정
6. data input 1,2,3,4를 차례로 눌러 출력 확인
7. selector s=11 설정
8. data input 1,2,3,4를 차례로 눌러 출력 확인

사용자가 실제 수행한 절차에 대한 확인이다. 각 조작에서 관찰한 z의 값, 선택된 버튼에서만 활성되었다는 결과, 영상 시점별 selector 값까지 확인된 것으로 확대하지 않는다.

## 3. Actual RTL and XDC analysis

- RTL: LAB1/06_mux/src/mux_4x1.v
- module: mux_4x1
- RTL expression: `assign z = i[3-s];`
- XDC: LAB1/06_mux/constraints/mux_4x1.xdc
- pin_mapping_provenance: TOOL_VERIFIED (현재 repository 파일 직접 확인)
- expected_selection_provenance: AUTO_DERIVED (실제 RTL 식 계산)
- video_to_programmed_source_identity: UNKNOWN

| Logical port | XDC PACKAGE_PIN | Physical control correspondence |
|---|---|---|
| i[3] | K4 | button 1; USER_CONFIRMED / USER_REPORTED |
| i[2] | N8 | button 2; USER_CONFIRMED / USER_REPORTED |
| i[1] | N4 | button 3; USER_CONFIRMED / USER_REPORTED |
| i[0] | N1 | button 4; USER_CONFIRMED / USER_REPORTED |
| s[1] | Y1 | DIP/스위치 번호 및 ON/OFF 논리 레벨 USER_CONFIRMATION_REQUIRED |
| s[0] | W3 | DIP/스위치 번호 및 ON/OFF 논리 레벨 USER_CONFIRMATION_REQUIRED |
| z | L4 | 물리 LED 번호 및 점등 polarity USER_CONFIRMATION_REQUIRED |

위 포트의 IOSTANDARD는 모두 LVCMOS33이다. 핀 대응은 실제 XDC에서 확인했으며 버튼 1~4 대응은 사용자 확인 정보이다. DIP 번호와 LED 번호를 XDC가 명시한 것으로 취급하지 않는다. 눌림의 전기적 논리 레벨도 미확정이다.

| s | Expected selected logical input | Selected input PACKAGE_PIN | Expected z |
|---|---|---|---|
| 00 | button 1 / i[3] | K4 | i[3] |
| 01 | button 2 / i[2] | N8 | i[2] |
| 10 | button 3 / i[1] | N4 | i[1] |
| 11 | button 4 / i[0] | N1 | i[0] |

각 selector에서 선택되지 않은 i 비트는 RTL 식의 z에 영향을 주지 않는다. 이는 계산한 예상이며 filmed board에서 전부 관찰된 결과는 아니다. 일반적인 `i[s]` convention과 순서가 반대임에 주의한다.

## 4. Original video review

- review_method: 원본 영상 전체 범위를 0.25 s 간격 및 14.200 s 끝 장면으로 디코딩한 58개 분석 프레임 검토; 분석 이미지는 repository 밖 시각화 폴더에만 저장
- raw_integrity: 검토 전후 원본 SHA-256 동일
- final_report_frame_extraction: NOT_PERFORMED_IN_THIS_TASK
- video_selector_numeric_status: USER_CONFIRMATION_REQUIRED
- video_button_bit_mapping_status: USER_CONFIRMED (button 1~4 대응); 개별 영상 시점의 눌림 상태는 별도 확인 필요
- video_z_LED_mapping_status: USER_CONFIRMATION_REQUIRED
- selected_input_only_activation_verified: NOT_VERIFIED

| Observed approximate interval | Visible observation | Selector numeric assignment |
|---|---|---|
| 0.500~2.233 s | 버튼 영역 조작이 이어짐 | UNKNOWN |
| 2.500~4.233 s | DIP 및 출력 영역 근처에 손이 위치함 | UNKNOWN |
| 4.500~6.233 s | 버튼 영역을 다시 조작함 | UNKNOWN |
| 6.733~8.500 s | DIP 및 출력 영역 근처에 손이 위치함 | UNKNOWN |
| 9.000~10.333 s | 버튼 영역을 다시 조작함 | UNKNOWN |
| 10.733~11.733 s | DIP 및 출력 영역 근처에 손이 위치함 | UNKNOWN |
| 12.233~13.500 s | 버튼 영역을 다시 조작함 | UNKNOWN |

구간은 분석 프레임에서 관찰한 근사 범위이며 정확한 눌림/해제 시각이나 완전한 버튼 순서 판정이 아니다. 네 번의 버튼 조작 구간은 사용자 절차와 비교할 수 있는 후보지만 순서만으로 각 구간을 s=00/01/10/11이라고 확정하지 않는다. 검토 프레임에서 출력 LED row의 뚜렷한 활성 변화는 확인하지 못했다. 이 결과는 모든 순간 z=0이었거나 board가 오동작했다는 판정도 아니다. 짧은 전환의 누락, 영상 가독성, 물리 대응의 미확정 가능성이 남는다.

## 5. Representative scene candidates and QA queue

| Candidate timestamp | Usefulness | Remaining status |
|---|---|---|
| 0.733 s | 첫 버튼 조작 구간과 출력 영역이 함께 보임; 사용자 절차의 s=00 구간과 대조할 후보 | s=00 대응 및 선택 입력의 z 활성 USER_CONFIRMATION_REQUIRED |
| 12.733 s | 마지막 버튼 조작 구간과 출력 영역이 함께 보임; 사용자 절차의 s=11 구간과 대조할 후보 | s=11 대응 및 선택 입력의 z 활성 USER_CONFIRMATION_REQUIRED |
| 14.200 s | 손 없는 보드 전체 안정 장면; 기존 프레임 보존 | 출력 변화 증거를 대신하지 않음 |

- 버튼 1~4의 i bit 대응은 USER_CONFIRMED이다. 눌림·해제 논리 레벨과 개별 영상 시점의 실제 조작은 별도 확인한다.
- s[1],s[0]의 물리 스위치 번호, polarity 및 각 영상 구간의 selector 값을 확인한다.
- L4가 어느 LED인지와 활성/점등 관계를 확인한다.
- 각 selector에서 버튼 1~4 조작 시 실제 출력 반응을 사용자 관찰이나 명확한 영상 구간으로 확인한다. 미확인 값을 출력에서 역추정하지 않는다.
- 시연 실험 번호 ↔ 제출 사진 ↔ 설명을 06_mux 및 10_7seg_decoder에 한정해 확인한다.
- 10_7seg_decoder의 입력 8/F는 USER_CONFIRMED이다. 기존 A 해석을 철회하고 실제 8 표시가 명확한 프레임을 재선정해야 한다. 사용자 확인을 개별 영상 timestamp의 자동 확정으로 확대하지 않는다.
- 최종 frame 추출은 사용자가 승인했으나 이번 디코더 실행은 자동 승인 검토의 사용량 한도 오류로 실행되지 않았다. 기존 프레임을 새로 추출하거나 재검증한 것으로 표시하지 않는다. 제출 보고서는 수정하지 않는다.

## 6. User-confirmed 7-segment inputs and actual RTL expected patterns

- RTL: LAB1/10_7seg_decoder/src/seg_decoder.v (TOOL_VERIFIED)
- bit order: seg_data[7:0] = {a,b,c,d,e,f,g,dp}; active high; dp off
- input 8: 4'b1000, USER_CONFIRMED / USER_REPORTED; RTL case 8 -> 8'hFE = 8'b11111110, a~g 활성 및 dp 비활성
- input F: 4'b1111, USER_CONFIRMED / USER_REPORTED; RTL case 15 -> 8'h8E = 8'b10001110, a/e/f/g 활성 및 b/c/d/dp 비활성
- final frame targets: LAB1_10_7seg_decoder_board_8.png, LAB1_10_7seg_decoder_board_F.png
- final extraction status: BLOCKED_APPROVAL_REVIEW_USAGE_LIMIT; 새 프레임 및 영상 재검증 미완료
- MUX priority search: s=00/button 1 및 s=11/button 4의 조작과 z 활성 장면. selector/출력 대응이 불명확하면 실제 장면 후보만 남기고 수치·정상 동작을 주장하지 않음
