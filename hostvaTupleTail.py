
#tuplehere

table = document.add_table(rows=1, cols=6)
table.style = 'Table Grid'
hdr_cells = table.rows[0].cells
hdr_cells[0].text = 'No'
hdr_cells[1].text = 'Reference'
hdr_cells[2].text = 'Host'
hdr_cells[3].text = 'Name'
hdr_cells[4].text = 'Risk'
hdr_cells[5].text = 'Solution'
for no1, refid, hostip, vulname, risklvl, thesolution in records:
    row_cells = table.add_row().cells
    row_cells[0].text = str(no1)
    row_cells[1].text = refid
    row_cells[2].text = hostip
    row_cells[3].text = vulname
    row_cells[4].text = risklvl
    row_cells[5].text = thesolution

document.add_page_break()

document.save(sys.argv[1])
