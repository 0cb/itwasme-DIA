#!/bin/bash
#===========================================================================#
#=									   =#
#   Filename:	    grab_col.sh
#   Version:	    1.0
#=									   =#
#   Description:    grab named column from all .csv in directory
#   Usage:	    grab_col.sh <col.name>
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2021-04-11
#   Updated:	    
#
#   Project:	    cultivar-manual; morphology measurements
#=									   =#
#===========================================================================#

#--------------- vars ---------------#
LABDIR="/home/cb/Lab_Baird/projects"
STUDY="cultivar_reg"
CROWN=$PWD

#INPUT="$@

#skeleton
#for meas in *.csv;
#do
#    awk 'FNR==2 {print $7}' $meas >> "$LABDIR/$GRASS/$STUDY/DIA/$dir-meas.csv"
#done

for dir in *;
do
    echo $dir
    if [ -d "${dir}" ];
    then
	cd $dir
	echo ${dir}

	for length in *.csv;
	do
	    awk -F, 'FNR==1 {
		for (i=1; i<=NF; i++) {
		    ix[$i] = i
		}
	    }
	    FNR>1 {
		print $ix[" "], $ix["Length"]
	    }
	    ' $length >> "$LABDIR/$STUDY/$dir-meas.csv"
	    done
	    cd $CROWN
    fi
done




# ~~~~~~~~ Sauce: Ingredients for spaghetti code
# https://unix.stackexchange.com/questions/359697/print-columns-in-awk-by-header-name/359699
# https://unix.stackexchange.com/questions/25138/how-to-print-certain-columns-by-name

		#can't remember how to send input to awk
#		awk -F',' -vcols=Length '
#		FNR>1 { 
#		    for (i=1; i<=NF; i++)
#			if ($(i)==col)colnum=i;
#			}
#	    { print $(colnum) }
