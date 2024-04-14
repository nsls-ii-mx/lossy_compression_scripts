#!/bin/tcsh
set verbose
mkdir -p hcomps32
foreach file (u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2fits/_u2hcomps32_/"`.fits.H
echo hcomps32/$nfile
hcomp -v -i fits -s 32 < $file > hcomps32/$nfile
end
