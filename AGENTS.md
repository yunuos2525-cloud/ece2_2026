# ECE2 Report Automation

## Purpose

This repository is used for
전자전기컴퓨터설계실험Ⅱ.

The goal of automation is to assist with:
- generating initial RTL/TB/XDC drafts from course materials
- checking source consistency
- running and analyzing simulations
- collecting real logs and Git information
- organizing evidence
- preparing structured report data

Automation must never invent experimental results.

## Course workflow

### Pre-lab

course requirements
→ RTL/TB/XDC draft
→ student review and understanding
→ Check tools
→ Icarus simulation
→ PASS log
→ VCD/VaporView verification
→ intentional failure
→ recovery
→ pre-report
→ board test plan

### Post-lab

same reviewed RTL/TB/XDC
→ Vivado Behavioral Simulation
→ synthesis
→ implementation
→ DRC/timing/warnings
→ bitstream
→ FPGA programming
→ board observation
→ post-report

## Generated source rule

Codex may generate initial RTL, Testbench, XDC, and simulation.json drafts
from the course materials.

Generated code is not automatically considered verified.

Use the following conceptual states:

GENERATED_DRAFT
→ REVIEWED
→ SIMULATED
→ VERIFIED

The student must understand the circuit structure, expected behavior,
Testbench verification logic, and important code before the design is
treated as reviewed.

## Source identity

Vivado should use the same reviewed RTL, TB, and XDC files that were
validated in the VS Code pre-lab workflow unless the course material
explicitly requires a modification.

Record any source change between pre-lab and post-lab.

Do not silently create a separate modified copy for Vivado.

## VS Code simulation

Use the existing course workflow and scripts.

Record when available:

- tool versions
- design source
- testbench
- design top
- simulation top
- XDC
- test vectors
- expected calculation
- PASS/FAIL
- actual end time
- run directory
- simulation.log
- VCD
- source commit

Simulation completion alone is not functional verification.

## Waveform

A VCD file existing is not sufficient evidence.

The student must visually inspect required stable waveform intervals
in VaporView and provide or approve the relevant screenshots.

Codex may:
- inspect VCD metadata
- identify signals
- calculate expected intervals
- suggest representative intervals

Codex must not claim that a waveform was visually verified unless
corresponding user-confirmed evidence exists.

## Intentional failure

Keep the Testbench expected values based on the correct design.

Use:

normal
→ RTL modification
→ predicted failing condition
→ observed FAIL
→ restoration
→ PASS after restoration

Record separate normal, failure, and recovery evidence when available.

Never reuse an old waveform or log as evidence for a newer execution.

## Vivado

The student performs the required Vivado GUI workflow when required by
the course material.

Codex may inspect the resulting project files, reports, and logs.

Record when available:

- Vivado version
- FPGA part
- design top
- simulation top
- RTL path
- TB path
- XDC path
- Behavioral Simulation result
- synthesis status
- implementation status
- DRC
- timing
- warnings
- bitstream path
- bitstream size
- SHA-256
- source commit

Bitstream generation is not board verification.

## Board

Never infer physical FPGA behavior.

Board results are valid only when supported by explicit user observation,
measurement, photograph, video, or other actual board evidence.

Otherwise use one of:

NOT_PERFORMED
NOT_VERIFIED
NOT_AVAILABLE
UNKNOWN

Do not replace these values with guesses.

## Evidence structure

Course submission evidence should ultimately be organized under:

reports/pre/
reports/post/

evidence/vscode/
evidence/vivado/
evidence/board/

Temporary generated files should not be treated as permanent evidence.

Do not delete original evidence while organizing copies.

## Automation manifests

Automation working data will be stored under:

reports/_automation/

Use separate manifests:

LABx_pre_manifest.md
LABx_post_manifest.md

A manifest must contain only:
- facts verified from repository files
- logs
- Git history
- course materials
- explicit user-provided observations

Use UNKNOWN, NOT_AVAILABLE, NOT_PERFORMED, or NOT_VERIFIED when the
evidence is insufficient.

## Report verification rule

Important report claims should follow:

test condition
→ expected result
→ observed result
→ interpretation

Pre/post comparison should follow when applicable:

expected
→ VS Code/Icarus
→ Vivado
→ physical board

Do not treat:
- compilation success
- simulation PASS
- bitstream generation
- FPGA board operation

as equivalent stages of verification.

## Git safety

Do not push, submit, reset, rebase, checkout another branch, delete,
or overwrite important files unless explicitly requested by the user.

Do not automatically stage or commit generated report files.

Before modifying an existing report or important source file,
prefer showing what will change first.
