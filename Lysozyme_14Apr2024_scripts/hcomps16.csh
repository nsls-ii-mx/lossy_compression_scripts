#!/bin/tcsh
set verbose
mkdir -p hcomps16
foreach file (u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2fits/_u2hcomps16_/"`.fits.H
echo hcomps16/$nfile
hcomp -v -i fits -s 16 < $file > hcomps16/$nfile
end
