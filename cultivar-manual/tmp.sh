#!/bin/bash
#quick picker upper

INPUT="$@"

touch $INPUT"_all.csv"

cat $INPUT"_1-meas.csv" >> $INPUT"_all.csv"
cat $INPUT"_2-meas.csv" >> $INPUT"_all.csv"
cat $INPUT"_3-meas.csv" >> $INPUT"_all.csv"

