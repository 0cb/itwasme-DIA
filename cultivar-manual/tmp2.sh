#!/bin/bash
# quick appendage glue

FILE="Shoots_GH-all.csv"

touch $FILE

echo "17-8" >> $FILE
cat 17-8_all-s-gh.csv >> $FILE

echo "Bandera" >> $FILE
cat Bandera_all-s-gh.csv >> $FILE

echo "Tahoma31" >> $FILE
cat Tahoma31_all-s-gh.csv >> $FILE

echo "TifTuf" >> $FILE
cat TifTuf_all-s-gh.csv >> $FILE

echo "TP6-3" >> $FILE
cat TP6-3_all-s-gh.csv >> $FILE
