#!/usr/bin/Rscript
#===========================================================================#
#=									   =#
#   Filename:	    ppSkel.R
#   Version:	    1.0
#=									   =#
#   Description:    <insert pptime.py desc here>
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-08-05 13:13
#   Updated:	    
#=									   =#
#===========================================================================#

#- TODO: dEdges
#        dPlot sizes
#        counter/ optimizer
#        <19-08-07, cb> #


#--------------- vars ---------------#

args        <-  commandArgs(TRUE)

meas        <-  suppressWarnings(read.csv(args, header=F, sep=" "))
#altmeas     <-  suppressWarnings(read.csv("Meas_tmp.csv", header=F, sep=" "))

side1a      <-  as.numeric(meas[1])
side2a      <-  as.numeric(meas[2])
side1       <-  as.numeric(meas[3])
side2       <-  as.numeric(meas[4])
full        <-  as.numeric(meas[5])
plot1       <-  as.numeric(meas[6])
plot2       <-  as.numeric(meas[7])
alley1      <-  as.numeric(meas[8])         # __ ; ^ v
alley2      <-  as.numeric(meas[9])         # |  ; < >
spot        <-  as.numeric(meas[10])
intwspot    <-  as.numeric(meas[11])
inthspot    <-  as.numeric(meas[12])
intplotar   <-  as.numeric(meas[13])

#altside1a      <-  as.numeric(altmeas[1])
#altside2a      <-  as.numeric(altmeas[2])
#altside1       <-  as.numeric(altmeas[3])
#altside2       <-  as.numeric(altmeas[4])
#altfull        <-  as.numeric(altmeas[5])
#altplot1       <-  as.numeric(altmeas[6])
#altplot2       <-  as.numeric(altmeas[7])
#altalley1      <-  as.numeric(altmeas[8])   # __ ; ^ v  actually alley2 (post-swap)
#altalley2      <-  as.numeric(altmeas[9])   # |  ; < >  actually alley1 (post-swap)
#altspot        <-  as.numeric(altmeas[10])
#altintwspot    <-  as.numeric(altmeas[11])
#altinthspot    <-  as.numeric(altmeas[12])
#altintplotar   <-  as.numeric(altmeas[13])


#--------------- 2x2 2.0-alley plot ---------------#

if (alley1 == 2) {
    if (alley2 == 2) {
    
#nargs[1]; nargs[2]

# __(2019-08-05 13:28)__ produces dataframe of nargs[1] x nargs[2] full of "1"

bones20     <-  as.data.frame(matrix(1, nrow=side1a, ncol=side2a))
#bones20    <-  as.data.frame(matrix(".", nrow=nargs[1], ncol=nargs[2]))

bones20[,seq(3,ncol(bones20),4)]    <-  0
bones20[,seq(4,ncol(bones20),4)]    <-  0

bones20[seq(1,nrow(bones20),4),]    <-  1
bones20[seq(2,nrow(bones20),4),]    <-  1

skel20      <-  bones20

sink('2.0_plot_tmp.csv'); skel20; sink()

    }
}

#--------------- 2x2 1.5-alley plot ---------------#

if (alley1 == 1.5 && alley == 1.5) {

bones15     <-  as.data.frame(matrix(1, nrow=side1a, ncol=side2a))

bones15[,seq(3,ncol(bones15),4)]    <-  0
bones15[,seq(4,ncol(bones15),4)]    <-  0

bones15[seq(1,nrow(bones15),4),]    <-  1
bones15[seq(2,nrow(bones15),4),]    <-  1

ecol        <-  bones15[,seq(2,ncol(bones15),2)]


