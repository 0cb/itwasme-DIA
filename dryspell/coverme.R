#!/usr/bin/Rscript
#===========================================================================#
#=									   =#
#   Filename:	    coverme.R
#   Version:	    1.0
#=									   =#
#   Description:    push coverage data to common .csv
#                   > for use post- "percent_coverage-DIA" macro
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-07-20 09:51
#   Updated:	    
#=									   =#
#===========================================================================#


# TODO: grab 228_ file 
#       <pre-work> append filenames column
#       <pre-work> remove area
#       <pre-work> remove min/max
#       join s/'mean-gray value'/ and 'percent coverage' columns to .csv
#       <19-07-20, cb> #

# __(2019-07-20 10:08)__ Bermuda-160 is 15D3_Start; throws following off by 1


#--------------- pseudo ---------------#
# 
# take args
# if...then bermuda|kikuyu
#   > use different common .csv
# take [,6]+header and append to .csv
# rename header to date
