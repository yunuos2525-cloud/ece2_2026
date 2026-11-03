# LAB7 Vivado evidence

Actual Task 10~12 XSim and Task 10/11 implementation evidence is stored here.
Keep each stage distinct and do not infer board operation from simulation or
implementation.

- `task10/xsim/`, `task10/implementation/` (pre-pin-map record), and
  `task10/final_pinmap_implementation/`
- `task11/xsim/`, `task11/implementation/` (pre-pin-map record), and
  `task11/final_pinmap_implementation/`
- `task12/xsim/`

Current status: XSim PASS for all three. Final Task 10/11 synthesis, route, and
timing PASS; UCIO-1 count zero; bitstreams generated. Each final DRC has zero
errors and one unsuppressed CFGBVS-1 warning. Physical Tasks 8–12 were later
performed; their separate evidence and proof boundaries are recorded in
[`LAB7_POST_EVIDENCE_MANIFEST.md`](../../../reports/_automation/LAB7_POST_EVIDENCE_MANIFEST.md).
Vivado results are not treated as board verification.
