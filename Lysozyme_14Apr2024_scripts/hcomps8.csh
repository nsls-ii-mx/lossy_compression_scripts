#!/bin/tcsh
set verbose
mkdir -p hcomps8
foreach file (u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2fits/_u2hcomps8_/"`.fits.H
echo hcomps8/$nfile
hcomp -v -i fits -s 8 < $file > hcomps8/$nfile
end
