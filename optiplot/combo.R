#!/usr/bin/Rscript
#===========================================================================#
#=									   =#
#   Filename:	    combo.R
#   Version:	    1.0
#=									   =#
#   Description:    testing extract largest value row and important columns
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-10-25 13:40
#   Updated:	    
#=									   =#
#===========================================================================#

args        <-  commandArgs(TRUE)
data.arg    <-  read.table(args[1], header=TRUE, sep="\t")

row.pmax   <-  data.arg[which.max(data.arg$Perim),]
row.pmax
#write.csv(row.pmax, file
