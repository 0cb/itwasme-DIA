#!/usr/bin/python3
#===========================================================================#
#=									   =#
#   Filename:	    pptime.py
#   Version:	    1.0
#=									   =#
#   Description:    plot plan optimizer
#                   avoid sleepless nights trying to decide:
#                       - dimensions
#                       - randomizations
#                       - <more?>
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-07-30 06:37
#   Updated:	    
#=									   =#
#===========================================================================#


#--------------- dependencies ---------------#

import time
import xlsxwriter as xwrite

#--------------- example ---------------#

workbook = xwrite.Workbook('file')
worksheet = workbook.add_worksheet()

values = (
    ['item1', 123],
    ['item2', 456]
)

#  __(2019-07-30 06:37)__ start from first cell; R/C are 'zero indexed'
row = 0
col = 0

#  __(2019-07-30 06:37)__ (row == 0, col == 0; n+1)
for item in (values):
    worksheet.write(row, col,   item)
    worksheet.write(row, col+1, cost)
    row += 1

worksheet.write(row, 0, 'new item')
worksheet.write(row, 1, '=FORMULA')

workbook.close()

#--------------- start ---------------#

timestr = time.strftime("%Y%m%d-%H%M%S")
workbook = xwrite.Workbook('plotplan_%s.xlsx' % timestr)
worksheet = workbook.add_worksheet('plotting')

row = 1
col = 1

#--------------- skeleton ---------------#

"""

for blanks in (plot):
    worksheet.write(row, col, '1')

#--------------- merging ---------------#

merge_format = workbook.add_format({
    'line': {
                'color': 'blue',
                'width': 1.25
            }
    }
                    # 2x2box    content of box  have to define
worksheet.merge_range('C1:D2', 'Merged Range', merge_format)



