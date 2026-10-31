"""Render an automatic SPI timing overview from a LAB7 Icarus VCD.

This image is a machine-generated aid. It is not a substitute for the
student's required VaporView visual inspection or physical oscilloscope data.
"""
import argparse
import re
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont


def parse_vcd(path):
    scopes = []
    names = {}
    widths = {}
    changes = {}
    now = 0
    definitions_done = False
    for raw in path.read_text(encoding="utf-8", errors="replace").splitlines():
        line = raw.strip()
        if not definitions_done:
            if line.startswith("$scope "):
                scopes.append(line.split()[2])
            elif line.startswith("$upscope"):
                if scopes:
                    scopes.pop()
            elif line.startswith("$var "):
                parts = line.split()
                width, code, name = int(parts[2]), parts[3], parts[4]
                full_name = ".".join([*scopes, name])
                names[full_name] = code
                widths[full_name] = width
                changes.setdefault(code, [])
            elif line.startswith("$enddefinitions"):
                definitions_done = True
            continue
        if line.startswith("#"):
            now = int(line[1:])
        elif re.match(r"^[01xz]", line):
            changes.setdefault(line[1:], []).append((now, line[0]))
        elif line.startswith("b"):
            value, code = line[1:].split(None, 1)
            changes.setdefault(code, []).append((now, value))
    return names, widths, changes


def value_at(events, when, default="x"):
    value = default
    for time, candidate in events:
        if time > when:
            break
        value = candidate
    return value


def find_complete_frame(changes, cs_code, sck_code):
    cs_events = changes[cs_code]
    sck_events = changes[sck_code]
    for index, (start, value) in enumerate(cs_events):
        if value != "0":
            continue
        stop = None
        for candidate_time, candidate_value in cs_events[index + 1:]:
            if candidate_value == "1":
                stop = candidate_time
                break
        if stop is None:
            continue
        rises = [time for time, edge in sck_events
                 if start <= time <= stop and edge == "1"]
        if len(rises) == 8:
            return start, stop, rises
    raise RuntimeError("no complete eight-rising-edge SPI frame found")


def first_name(names, suffix):
    matches = [name for name in names if name.endswith(suffix)]
    if not matches:
        raise RuntimeError(f"signal not found: {suffix}")
    return sorted(matches, key=lambda name: (name.count("."), len(name)))[0]


def render(vcd, output, title):
    names, widths, changes = parse_vcd(vcd)
    root = next(iter(names)).split(".")[0]
    cs_name = f"{root}.spi_cs_n"
    sck_name = f"{root}.spi_sck"
    mosi_name = f"{root}.spi_mosi"
    cs_code, sck_code, mosi_code = names[cs_name], names[sck_name], names[mosi_name]
    start, stop, rises = find_complete_frame(changes, cs_code, sck_code)
    pad = max((stop - start) // 18, 1)
    left_time, right_time = start - pad, stop + pad

    profile = vcd.parent.name
    signal_names = [cs_name, sck_name, mosi_name]
    if "task10" in profile:
        signal_names += [first_name(names, ".dut.rx_valid"),
                         first_name(names, ".dut.rx_data")]
    elif "task11" in profile:
        signal_names += [first_name(names, ".dut.done"),
                         first_name(names, ".dut.tx_data")]
    else:
        signal_names += [first_name(names, ".receiver.rx_valid"),
                         first_name(names, ".receiver.rx_data"),
                         f"{root}.uart_txd"]

    sampled_bits = [value_at(changes[mosi_code], time) for time in rises]
    decoded = None
    if all(bit in "01" for bit in sampled_bits):
        decoded = int("".join(sampled_bits), 2)

    width = 1500
    row_height = 72
    top_margin = 125
    bottom_margin = 65
    height = top_margin + row_height * len(signal_names) + bottom_margin
    image = Image.new("RGB", (width, height), "white")
    draw = ImageDraw.Draw(image)
    font = ImageFont.load_default()
    plot_left, plot_right = 210, width - 45

    decoded_text = "UNKNOWN" if decoded is None else f"0x{decoded:02X}"
    draw.text((30, 25), title, fill="black", font=font)
    draw.text((30, 48),
              f"First complete frame; rising-edge samples: {' '.join(sampled_bits)} = {decoded_text}",
              fill=(0, 70, 130), font=font)
    draw.text((30, 70),
              "AUTO-GENERATED FROM VCD — VaporView visual approval remains NOT_VERIFIED",
              fill=(160, 40, 25), font=font)

    def xcoord(time):
        return plot_left + int((time - left_time) * (plot_right - plot_left) /
                               (right_time - left_time))

    for sample_number, time in enumerate(rises, start=1):
        x = xcoord(time)
        draw.line((x, top_margin - 12, x, height - bottom_margin + 5),
                  fill=(210, 225, 240), width=1)
        draw.text((x - 5, top_margin - 25), str(sample_number),
                  fill=(50, 100, 150), font=font)

    for row, name in enumerate(signal_names):
        ybase = top_margin + row * row_height + 35
        label = name.split(".")[-1]
        draw.text((20, ybase - 10), label, fill="black", font=font)
        draw.line((plot_left, ybase + 14, plot_right, ybase + 14),
                  fill=(225, 225, 225))
        code = names[name]
        events = changes[code]
        if widths[name] == 1:
            relevant = [(left_time, value_at(events, left_time))]
            relevant += [(time, value) for time, value in events
                         if left_time < time <= right_time]
            previous_time, previous_value = relevant[0]
            previous_y = ybase - 18 if previous_value == "1" else ybase + 12
            for time, value in relevant[1:]:
                x0, x1 = xcoord(previous_time), xcoord(time)
                draw.line((x0, previous_y, x1, previous_y), fill=(20, 80, 30), width=2)
                next_y = ybase - 18 if value == "1" else ybase + 12
                draw.line((x1, previous_y, x1, next_y), fill=(20, 80, 30), width=2)
                previous_time, previous_value, previous_y = time, value, next_y
            draw.line((xcoord(previous_time), previous_y, plot_right, previous_y),
                      fill=(20, 80, 30), width=2)
        else:
            relevant = [(left_time, value_at(events, left_time))]
            relevant += [(time, value) for time, value in events
                         if left_time < time <= right_time]
            for index, (time, value) in enumerate(relevant):
                next_time = relevant[index + 1][0] if index + 1 < len(relevant) else right_time
                x0, x1 = xcoord(time), xcoord(next_time)
                draw.rectangle((x0, ybase - 16, x1, ybase + 12),
                               outline=(100, 60, 130), width=1)
                if x1 - x0 > 38:
                    try:
                        text = f"{int(value, 2):02X}"
                    except ValueError:
                        text = value
                    draw.text((x0 + 4, ybase - 9), text,
                              fill=(100, 40, 130), font=font)

    for tick in range(6):
        time = left_time + (right_time - left_time) * tick // 5
        x = xcoord(time)
        draw.line((x, height - bottom_margin + 3, x, height - bottom_margin + 10), fill="black")
        draw.text((x - 18, height - bottom_margin + 16),
                  f"{time / 1000:.0f} ns", fill="black", font=font)

    output.parent.mkdir(parents=True, exist_ok=True)
    image.save(output)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("vcd", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--title", required=True)
    args = parser.parse_args()
    render(args.vcd, args.output, args.title)


if __name__ == "__main__":
    main()
