#!/bin/bash
#===========================================================================#
#=									   =#
#   Filename:	    combomeas.sh
#   Version:	    1.0
#=									   =#
#   Description:    combine measurements from csvs per subdir
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-10-25 13:10
#   Updated:	    
#=									   =#
#===========================================================================#

DIA=/home/cb/Bioinf0cb/projects/fieldDIA

for dir in *;
do
    echo $dir
    if [ -d "${dir}" ];
    then
	cd $dir
	for i in *.csv;
	do
	    echo hold
	    Rscript $DIA/combo.R | new_$i
	done
    fi
done
