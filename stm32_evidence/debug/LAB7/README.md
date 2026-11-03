# LAB7 STM32 debug/communication evidence

The actual LAB7 UART/debug captures were consolidated under
[`evidence/board/LAB7/`](../../../evidence/board/LAB7/) instead of duplicated
here. A transmit `result=0` records MCU transmit-call success; by itself it does
not prove that the receiver obtained the byte.

Current status: UART/debug captures exist for Tasks 8–11 and role-specific
Task 12 receiver frames exist with the board evidence. See
[`LAB7_POST_EVIDENCE_MANIFEST.md`](../../../reports/_automation/LAB7_POST_EVIDENCE_MANIFEST.md)
for the exact proof boundary and locally missing captures.
