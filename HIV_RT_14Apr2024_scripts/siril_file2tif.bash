#!/bin/bash -xv
#
#  convert one file to fits
#
version=$(siril --version |awk '{print $2}')
ext=fit

infile=$1
outfile=$2
echo "$0 $1 $2"
siril-cli -i ~/.siril/siril.cfg -s - <<ENDSIRIL 
requires $version
setext $ext
load $infile
savetif $outfile
close
ENDSIRIL

