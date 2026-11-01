#!/usr/bin/env python3
"""Run the PROJECT FPGA self-checking simulations described in simulation.json."""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BUILD = ROOT / "build"


def require_tool(name: str) -> str:
    path = shutil.which(name)
    if path is None:
        raise SystemExit(f"ERROR: {name} is not available on PATH")
    return path


def load_tests() -> dict[str, dict[str, object]]:
    config = json.loads((ROOT / "simulation.json").read_text(encoding="utf-8"))
    tests = config.get("tests")
    if not isinstance(tests, dict) or not tests:
        raise SystemExit("ERROR: simulation.json has no tests")
    return tests


def validate_file(relative: str) -> Path:
    path = ROOT / relative
    if not path.is_file():
        raise SystemExit(f"ERROR: missing file: {relative}")
    return path


def run_test(name: str, test: dict[str, object]) -> None:
    iverilog = require_tool("iverilog")
    vvp = require_tool("vvp")
    BUILD.mkdir(exist_ok=True)
    output = BUILD / f"{name}.vvp"
    sources = [validate_file(str(item)) for item in test["sources"]]
    testbench = validate_file(str(test["testbench"]))
    top = str(test["simulation_top"])

    compile_cmd = [
        iverilog,
        "-g2012",
        "-Wall",
        "-s",
        top,
        "-o",
        str(output),
        *map(str, sources),
        str(testbench),
    ]
    if output.exists():
        output.unlink()
    print(f"== {name}: compile ==")
    compile_result = subprocess.run(compile_cmd, cwd=ROOT, check=False)
    if compile_result.returncode != 0:
        # The installed Windows Icarus 12.0 development build can terminate
        # with 0xC0000005 after successfully writing a complete output file.
        # A missing/empty fresh output is still treated as a real failure.
        if not output.is_file() or output.stat().st_size == 0:
            raise SystemExit(
                f"ERROR: iverilog failed for {name}: {compile_result.returncode}"
            )
        print(
            "WARNING: iverilog returned "
            f"{compile_result.returncode} after producing {output.name}"
        )
    print(f"== {name}: run ==")
    subprocess.run([vvp, str(output)], cwd=ROOT, check=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("test", nargs="?", default="all")
    args = parser.parse_args()
    tests = load_tests()
    selected = tests if args.test == "all" else {args.test: tests.get(args.test)}
    if None in selected.values():
        raise SystemExit(f"ERROR: unknown test {args.test}; choose {', '.join(tests)}")
    for name, test in selected.items():
        run_test(name, test)
    return 0


if __name__ == "__main__":
    sys.exit(main())
