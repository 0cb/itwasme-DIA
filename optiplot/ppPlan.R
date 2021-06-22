#!/usr/bin/Rscript
#===========================================================================#
#=									   =#
#   Filename:	    ppPlan.R
#   Version:	    1.0
#=									   =#
#   Description:    calculate max number of plots available
#                   including alleys
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-08-07 11:01
#   Updated:	    
#=									   =#
#===========================================================================#

#--------------- vars ---------------#

args        <-  commandArgs(TRUE)
nargs       <-  as.numeric(args)

side1a      <-  nargs[1]
side2a      <-  nargs[2]
plot1       <-  nargs[3]
plot2       <-  nargs[4]
alley1      <-  nargs[5]    # __ ; ^ v
alley2      <-  nargs[6]    # |  ; < >

alley15     <-  1.5
alley20     <-  2.0

#--------------- building ---------------#

side1       <-  side1a - alley20 - (alley20 - alley2)   #subtract alley width (2.0; | ) to accommodate for right border
side2       <-  side2a - alley20 - (alley20 - alley1)   #subtract alley height (2.0; __ ) to acommodate for bottom border

full        <-  side1 * side2

width       <-  plot1 + alley2  #plot width ( __ ) + alley width ( | )
wspot       <-  side1 / width   #ncol
intwspot    <-  trunc(wspot)

height      <-  plot2 + alley1  #plot height ( | ) + alley height ( __ )
hspot       <-  side2 / height  #nrow
inthspot    <-  trunc(hspot)

spot        <-  width * height
intplotar   <-  intwspot * inthspot #available plots including alleys for each

#--------------- altbuilding ---------------#

altside1       <-  side1a - alley20 - (alley20 - alley1)   #subtract alley width (2.0; | ) to accommodate for right border
altside2       <-  side2a - alley20 - (alley20 - alley2)   #subtract alley height (2.0; __ ) to acommodate for bottom border

altfull        <-  altside1 * altside2

altwidth       <-  plot1 + alley1     #plot width ( __ ) + alley width ( | )
altwspot       <-  altside1 / altwidth    #ncol
altintwspot    <-  trunc(altwspot)

altheight      <-  plot2 + alley2  #plot height ( | ) + alley height ( __ )
althspot       <-  altside2 / altheight  #nrow
altinthspot    <-  trunc(althspot)

altspot        <-  altwidth * altheight
altintplotar   <-  altintwspot * altinthspot #available plots including alleys for each

#--------------- Plan ---------------#

cat("\nPlot plan generated")

sink('./temp/Plan_tmp.txt')

cat(date())

cat("\n---Parameters (ft)---\n")
cat("\nGiven area width: ",side1a)
cat("\nGiven area height: ",side2a)
cat("\nUseable area width: ",side1-alley20 )
cat("\nUseable area height: ",side2-alley20)
cat("\nTotal useable area: ",full)

cat("\n")
cat("\nPlot width: ",plot1)
cat("\nPlot height: ",plot2)
cat("\nHorizontal alley (runs along plot width): ",alley1)
cat("\nVertical alley (runs along plot height): ",alley2)

cat("\n")
cat("\nEach plot size (including alleys): ",spot)
cat("\nPlots per row: ",intwspot)
cat("\nPlots per column: ",inthspot)
cat("\nTotal number of plots that fit: ",intplotar)

cat("\n\n---See presetPlan for 1.5x1.5, 1.5x2.0, 2.0x2.0, and 2.0x1.5 plans---\n")
sink()

sink('./temp/Meas_tmp.csv')
cat(side1a,side2a,side1,side2,full,plot1,plot2,alley1,alley2,spot,intwspot,inthspot,intplotar)
sink()

#--------------- altPlan ---------------#

if (intplotar < altintplotar) {

cat("\nAn alternative plot plan was generated with swapped alley values for optimal planning\n")

sink('./temp/altPlan_tmp.txt')

cat(date())

cat("\n---Parameters (ft)---\n")
cat("\nGiven area width: ",side1a)
cat("\nGiven area height: ",side2a)
cat("\nUseable area width: ",altside1-alley20)
cat("\nUseable area height: ",altside2-alley20)
cat("\nTotal useable area: ",altfull)

cat("\n")
cat("\nPlot width: ",plot1)
cat("\nPlot height: ",plot2)
cat("\nHorizontal alley (runs along plot width; SWAPPED to optimize: ",alley2)
cat("\nVertical alley (runs along plot height; SWAPPED to optimize): ",alley1)

cat("\n")
cat("\nEach plot size (including alleys): ",altspot)
cat("\nPlots per row: ",altintwspot)
cat("\nPlots per column: ",altinthspot)
cat("\nTotal number of plots that fit: ",altintplotar)

cat("\n\n---See presetPlan for 1.5x1.5, 1.5x2.0, 2.0x2.0, and 2.0x1.5 plans---\n")
sink()

sink('./temp/altMeas_tmp.csv')
cat(side1a,side2a,altside1,altside2,altfull,plot1,plot2,alley2,alley1,altspot,altintwspot,altinthspot,altintplotar)
sink()

} 
    
    
#--------------- altPlan ---------------#

#sink('altPlan_tmp.txt')
#
#cat(date())
#
#cat("\n---1.5x1.5 alleys---")
#cat("Horizontal Alley (runs along Plot Width): "); alley15
#cat("Vertical Alley (runs along Plot Height): "); alley15
#cat("Total plot size (including alleys): "); spot15
#
#cat("\nTotal number of plots that fit: "); intplotar15
#
#cat("\n---1.5x2.0 alleys---")
#cat("Horizontal Alley (runs along Plot Width): "); alley15
#cat("Vertical Alley (runs along Plot Height): "); alley20
#cat("Total plot size (including alleys): "); spot12
#
#cat("\nTotal number of plots that fit: "); intplotar12
#
#cat("\n---2.0x2.0 alleys---")
#cat("Horizontal Alley (runs along Plot Width): "); alley20
#cat("Vertical Alley (runs along Plot Height): "); alley20
#cat("Total plot size (including alleys): "); spot20
#
#cat("\nTotal number of plots that fit: "); intplotar20
#
#cat("\n---2.0x1.5 alleys---")
#cat("Horizontal Alley (runs along Plot Width): "); alley20
#cat("Vertical Alley (runs along Plot Height): "); alley15
#cat("Total plot size (including alleys): "); spot25
#
#cat("\nTotal number of plots that fit: "); intplotar25
#sink()


