#!/bin/bash
#===========================================================================#
#=									   =#
#   Filename:	    IJ-bash.sh
#   Version:	    1.0
#=									   =#
#   Description:    quick wrapper for imagej scripts
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2021-01-20
#   Updated:	    
#=									   =#
#===========================================================================#

#--------------- vars ---------------#

IJM=$1
IMAGEJ=$HOME/programs/Fiji.app/ImageJ-linux64

#--------------- macros ---------------#

$IMAGEJ --ij2 --headless --run $IJM 'input="/home/cb/workspace",output="/home/cb/workspace/tmp",suffix=".JPG"'


