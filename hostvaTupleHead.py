from docx import Document
from docx.shared import Inches, Pt
import sys
#for landscape
from docx.enum.section import WD_SECTION
from docx.enum.section import WD_ORIENT
#for landscape

document = Document()

section = document.sections[-1]
section.orientation = WD_ORIENT.LANDSCAPE
section.page_width = 10693337
section.page_height = 7560945

#style
style = document.styles['Normal']
font = style.font
font.name = 'Arial'
font.size = Pt(11)

document.add_heading('Nessus Host VA', 0)

#tuplehere

