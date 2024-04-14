#!/bin/tcsh
set verbose
mkdir -p hcomps64
foreach file (u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2fits/_u2hcomps64_/"`.fits.H
echo hcomps64/$nfile
hcomp -v -i fits -s 64 < $file > hcomps64/$nfile
end
