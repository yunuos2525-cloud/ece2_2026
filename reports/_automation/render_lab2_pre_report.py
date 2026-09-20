"""Render the reviewed LAB2 Markdown as an A4 cover plus two-column PDF.

The source Markdown is the sole source of technical content. This script only
changes its presentation; it does not alter RTL, results, or evidence files.
"""

from __future__ import annotations

import html
import re
from pathlib import Path

from PIL import Image as PILImage
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_JUSTIFY, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    BaseDocTemplate,
    Frame,
    Image,
    KeepTogether,
    NextPageTemplate,
    PageBreak,
    PageTemplate,
    Paragraph,
    Preformatted,
    Spacer,
    Table,
    TableStyle,
)
from reportlab.platypus import paragraph as rl_paragraph


ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "reports/pre/LAB2_pre_report.md"
OUTPUT = ROOT / "reports/pre/LAB2_pre_report.pdf"
IMAGE_CACHE = ROOT / "tmp/pdfs/lab2_layout/images"
PAGE_W, PAGE_H = A4
MARGIN_X = 37
MARGIN_Y = 39
GAP = 15
COL_W = (PAGE_W - 2 * MARGIN_X - GAP) / 2

pdfmetrics.registerFont(TTFont("Malgun", "C:/Windows/Fonts/malgun.ttf"))
pdfmetrics.registerFont(TTFont("Malgun-Bold", "C:/Windows/Fonts/malgunbd.ttf"))
pdfmetrics.registerFont(TTFont("Consolas", "C:/Windows/Fonts/consola.ttf"))
pdfmetrics.registerFontFamily("Malgun", normal="Malgun", bold="Malgun-Bold")


def justify_korean_line(tx, offset, extra_space, words, last=0):
    """Justify intact words without making a few Korean word gaps enormous."""
    rl_paragraph.setXPos(tx, offset)
    line_text = " ".join(words)
    simple = (
        getattr(tx, "preformatted", False)
        or -1e-8 < extra_space <= 1e-8
        or (last and extra_space > -1e-8)
    )
    spaces = len(words) + rl_paragraph._nbspCount(line_text) - 1
    if simple or spaces <= 0:
        tx._textOut(line_text, 1)
    else:
        word_space = min(extra_space / spaces, 5.0)
        tx.setWordSpace(word_space)
        tx._textOut(line_text, 1)
        tx.setWordSpace(0)
    rl_paragraph.setXPos(tx, -offset)
    return offset


def justify_korean_frag_line(tx, offset, line, last=0):
    tx._x_offset = offset
    rl_paragraph.setXPos(tx, offset)
    extra_space = line.extraSpace
    simple = line.lineBreak or -1e-8 < extra_space <= 1e-8 or (last and extra_space > -1e-8)
    spaces = line.wordCount + sum(
        rl_paragraph._nbspCount(word.text)
        for word in line.words if not hasattr(word, "cbDefn")
    ) - 1
    if not simple and spaces > 0:
        word_space = min(extra_space / spaces, 5.0)
        tx.setWordSpace(word_space)
        rl_paragraph._putFragLine(offset, tx, line, last, "justify")
        tx.setWordSpace(0)
    else:
        rl_paragraph._putFragLine(offset, tx, line, last, "justify")
    rl_paragraph.setXPos(tx, -offset)


rl_paragraph._justifyDrawParaLine = justify_korean_line
rl_paragraph._justifyDrawParaLineX = justify_korean_frag_line

BODY = ParagraphStyle(
    "body", fontName="Malgun", fontSize=7.75, leading=11.2,
    textColor=colors.black, spaceAfter=4.0, allowWidows=0, allowOrphans=0,
    splitLongWords=0, alignment=TA_JUSTIFY,
)
H2 = ParagraphStyle(
    "section", parent=BODY, fontName="Malgun-Bold", fontSize=10.4,
    leading=14.2, spaceBefore=9, spaceAfter=4, keepWithNext=1,
    alignment=TA_LEFT,
)
H3 = ParagraphStyle(
    "subsection", parent=BODY, fontName="Malgun-Bold", fontSize=8.8,
    leading=12.3, spaceBefore=7, spaceAfter=3, keepWithNext=1,
    alignment=TA_LEFT,
)
CAPTION = ParagraphStyle(
    "caption", parent=BODY, fontSize=6.8, leading=9.2,
    alignment=TA_CENTER, spaceAfter=6.5,
)
CELL = ParagraphStyle(
    "cell", parent=BODY, fontSize=6.15, leading=8.35,
    spaceAfter=0, splitLongWords=0, alignment=TA_LEFT,
)
CELL_BOLD = ParagraphStyle(
    "cellbold", parent=CELL, fontName="Malgun-Bold",
)
CODE = ParagraphStyle(
    "code", fontName="Consolas", fontSize=5.75, leading=7.75,
    leftIndent=5, rightIndent=3, spaceBefore=2, spaceAfter=4,
    backColor=colors.HexColor("#f6f6f6"), borderColor=colors.HexColor("#dedede"),
    borderWidth=0.35, borderPadding=4, keepWithNext=1,
)
BULLET = ParagraphStyle(
    "bullet", parent=BODY, leftIndent=10, firstLineIndent=-7,
    spaceAfter=4,
)


def inline_markup(text: str) -> str:
    """Keep only Markdown emphasis/code/link presentation for Paragraph."""
    chunks = re.split(r"(`[^`]*`)", text)
    cooked = []
    for chunk in chunks:
        if chunk.startswith("`") and chunk.endswith("`"):
            cooked.append(f'<font name="Consolas">{html.escape(chunk[1:-1])}</font>')
            continue
        chunk = html.escape(chunk)
        chunk = re.sub(r"\*\*(.+?)\*\*", r"<b>\1</b>", chunk)
        chunk = re.sub(r"\*([^*]+)\*", r"<i>\1</i>", chunk)
        chunk = re.sub(
            r"\[([^\]]+)\]\(([^)]+)\)",
            lambda m: f'<link href="{html.escape(m.group(2), quote=True)}" color="#202020">{m.group(1)}</link>',
            chunk,
        )
        cooked.append(chunk)
    return "".join(cooked)


def paragraph(text: str, style=BODY) -> Paragraph:
    return Paragraph(inline_markup(text), style)


def parse_table(lines: list[str]) -> list[list[str]]:
    rows = [[cell.strip() for cell in line.strip().strip("|").split("|")] for line in lines]
    return [rows[0]] + rows[2:]


def compact_records(rows: list[list[str]]) -> list:
    """Turn a wide table into one-column mini-tables without dropping cells."""
    head, data = rows[0], rows[1:]
    result = []
    for row in data:
        first = paragraph(row[0], CELL_BOLD)
        mini = [[first, ""]]
        for label, value in zip(head[1:], row[1:]):
            mini.append([paragraph(label, CELL_BOLD), paragraph(value, CELL)])
        table = Table(mini, colWidths=[COL_W * 0.33, COL_W * 0.67], hAlign="LEFT")
        table.setStyle(TableStyle([
            ("SPAN", (0, 0), (1, 0)),
            ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#eeeeee")),
            ("LINEBELOW", (0, -1), (-1, -1), 0.35, colors.HexColor("#c8c8c8")),
            ("VALIGN", (0, 0), (-1, -1), "TOP"),
            ("LEFTPADDING", (0, 0), (-1, -1), 3),
            ("RIGHTPADDING", (0, 0), (-1, -1), 3),
            ("TOPPADDING", (0, 0), (-1, -1), 1.5),
            ("BOTTOMPADDING", (0, 0), (-1, -1), 1.5),
        ]))
        result.append(KeepTogether([table, Spacer(1, 4)]))
    return result


def regular_table(rows: list[list[str]]) -> Table:
    n = len(rows[0])
    widths = [COL_W / n] * n
    content = [
        [paragraph(cell, CELL_BOLD if r == 0 else CELL) for cell in row]
        for r, row in enumerate(rows)
    ]
    table = Table(content, colWidths=widths, repeatRows=1, hAlign="LEFT", splitByRow=1)
    table.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#eeeeee")),
        ("LINEBELOW", (0, 0), (-1, 0), 0.45, colors.HexColor("#808080")),
        ("LINEBELOW", (0, -1), (-1, -1), 0.35, colors.HexColor("#bbbbbb")),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("LEFTPADDING", (0, 0), (-1, -1), 2),
        ("RIGHTPADDING", (0, 0), (-1, -1), 2),
        ("TOPPADDING", (0, 0), (-1, -1), 2),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 2),
    ]))
    return table


def table_flowables(rows: list[list[str]], section: str) -> list:
    # Long three-column comparisons and the K / 08A / source-mapping tables
    # become narrow records; values and labels remain verbatim.
    is_compare = rows[0][0] == "실행"
    is_wide = section in {"A", "J", "K"} and len(rows[0]) >= 4
    if is_compare or is_wide or len(rows[0]) >= 5:
        return compact_records(rows)
    return [regular_table(rows), Spacer(1, 5)]


def image_flowable(relative: str, caption: str) -> KeepTogether:
    source = (SOURCE.parent / relative).resolve()
    if not source.is_file():
        raise FileNotFoundError(source)
    IMAGE_CACHE.mkdir(parents=True, exist_ok=True)
    cached = IMAGE_CACHE / source.name
    with PILImage.open(source) as opened:
        picture = opened.convert("RGB")
        picture.thumbnail((1350, 1350), PILImage.Resampling.LANCZOS)
        picture.save(cached, format="JPEG", quality=89, optimize=True)
        ratio = picture.height / picture.width
    draw_w = COL_W
    draw_h = draw_w * ratio
    if draw_h > 170:
        draw_h = 170
        draw_w = draw_h / ratio
    pic = Image(str(cached), width=draw_w, height=draw_h, hAlign="CENTER")
    return KeepTogether([pic, Spacer(1, 2), paragraph(caption, CAPTION)])


def body_story(text: str) -> list:
    start = text.index("## A. 목적 및 공통 검증 조건")
    lines = text[start:].splitlines()
    story = []
    section = "A"
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        if not line or line.startswith("<!--"):
            i += 1
            continue
        if line.startswith("## "):
            section = line[3:4]
            story.append(paragraph(line[3:], H2))
            i += 1
            continue
        if line.startswith("### "):
            story.append(paragraph(line[4:], H3))
            i += 1
            continue
        if line.startswith("```verilog"):
            end = i + 1
            while end < len(lines) and not lines[end].startswith("```"):
                end += 1
            code_lines = lines[i + 1:end]
            story.append(Preformatted("\n".join(code_lines), CODE, maxLineLength=63, splitChars=" ,;()"))
            i = end + 1
            continue
        if line.startswith("| "):
            end = i + 1
            while end < len(lines) and lines[end].startswith("|"):
                end += 1
            story.extend(table_flowables(parse_table(lines[i:end]), section))
            i = end
            continue
        image_match = re.match(r"!\[[^]]*\]\(([^)]+)\)", line)
        if image_match:
            j = i + 1
            while j < len(lines) and not lines[j].strip():
                j += 1
            if j >= len(lines) or not re.match(r"그림 \d+\.", lines[j]):
                raise ValueError(f"Image has no adjacent caption: {line}")
            story.append(image_flowable(image_match.group(1), lines[j].strip()))
            i = j + 1
            continue
        if line.startswith("- "):
            story.append(paragraph("• " + line[2:], BULLET))
            i += 1
            continue
        # Join Markdown hard-wrapped paragraph lines without changing words.
        para = [line]
        j = i + 1
        while j < len(lines) and lines[j].strip() and not lines[j].startswith(("## ", "### ", "|", "```", "![", "- ")):
            para.append(lines[j].strip())
            j += 1
        story.append(paragraph(" ".join(para)))
        i = j
    return story


def cover(canvas, doc):
    canvas.saveState()
    canvas.setFillColor(colors.black)
    canvas.setFont("Malgun", 12)
    canvas.drawCentredString(PAGE_W / 2, 675, "전자전기컴퓨터설계실험Ⅱ 실험 전 보고서")
    canvas.setFont("Malgun-Bold", 20)
    canvas.drawCentredString(PAGE_W / 2, 588, "LAB 2 – 순차회로와 응용 회로")
    values = [
        ("학과", "전자전기컴퓨터공학부"),
        ("학번/이름", "2025440032 / 김윤지"),
        ("작성일", "2026.09.19"),
        ("대상", "01 Counter ~ 08 Segment Scan, 08A Integrated"),
        ("검증 환경", "VS Code · Icarus Verilog · VaporView"),
        ("프로젝트", "ece2_2026 / LAB2"),
        ("기준 커밋", "미지정 (LAB2 미커밋)"),
        ("GitHub 주소", "github.com/yunuos2525-cloud/ece2_2026"),
        ("제출 태그", "미지정"),
    ]
    x, y, width, row_h = 84, 445, PAGE_W - 168, 32
    canvas.setStrokeColor(colors.HexColor("#bdbdbd"))
    canvas.line(x, y + 10, x + width, y + 10)
    for label, value in values:
        canvas.setFont("Malgun-Bold", 8.6)
        canvas.drawString(x + 6, y - 10, label)
        canvas.setFont("Malgun", 8.6)
        canvas.drawString(x + 112, y - 10, value)
        canvas.line(x, y - 18, x + width, y - 18)
        y -= row_h
    canvas.restoreState()


def body_page(canvas, doc):
    canvas.saveState()
    canvas.setStrokeColor(colors.HexColor("#bcbcbc"))
    canvas.setLineWidth(0.35)
    canvas.line(MARGIN_X, PAGE_H - 29, PAGE_W - MARGIN_X, PAGE_H - 29)
    canvas.setFont("Malgun", 7)
    canvas.drawString(MARGIN_X, PAGE_H - 25, "LAB 2  |  실험 전 보고서")
    canvas.drawCentredString(PAGE_W / 2, 25, str(doc.page - 1))
    canvas.restoreState()


def main() -> None:
    text = SOURCE.read_text(encoding="utf-8")
    doc = BaseDocTemplate(
        str(OUTPUT), pagesize=A4,
        leftMargin=MARGIN_X, rightMargin=MARGIN_X,
        topMargin=MARGIN_Y, bottomMargin=MARGIN_Y,
        title="LAB 2 – 순차회로와 응용 회로",
        author="김윤지",
    )
    cover_frame = Frame(MARGIN_X, MARGIN_Y, PAGE_W - 2 * MARGIN_X, PAGE_H - 2 * MARGIN_Y, id="cover")
    left = Frame(MARGIN_X, MARGIN_Y, COL_W, PAGE_H - 2 * MARGIN_Y - 1, id="left", showBoundary=0)
    right = Frame(MARGIN_X + COL_W + GAP, MARGIN_Y, COL_W, PAGE_H - 2 * MARGIN_Y - 1, id="right", showBoundary=0)
    doc.addPageTemplates([
        PageTemplate(id="Cover", frames=[cover_frame], onPage=cover),
        PageTemplate(id="Body", frames=[left, right], onPage=body_page),
    ])
    story = [Spacer(1, 1), NextPageTemplate("Body"), PageBreak()]
    story.extend(body_story(text))
    doc.build(story)
    print(OUTPUT)


if __name__ == "__main__":
    main()
