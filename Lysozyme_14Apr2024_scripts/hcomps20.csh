#!/bin/tcsh
set verbose
mkdir -p hcomps20
foreach file (u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2fits/_u2hcomps20_/"`.fits.H
echo hcomps20/$nfile
hcomp -v -i fits -s 20 < $file > hcomps20/$nfile
end
