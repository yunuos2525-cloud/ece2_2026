import os
import runpy
from pathlib import Path

project = Path(__file__).resolve().parents[1]
os.environ["FPGA_LAB_ROOT"] = str(project)
runpy.run_path(str(project.parent / "common" / "fpga_lab.py"), run_name="__main__")

