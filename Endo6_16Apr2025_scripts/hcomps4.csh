#!/bin/tcsh
set verbose
mkdir -p hcomps4
foreach file (u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2fits/_u2hcomps4_/"`.fits.H
echo hcomps4/$nfile
hcomp -v -i fits -s 4 < $file > hcomps4/$nfile
end
