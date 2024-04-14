#!/bin/tcsh
set verbose
mkdir -p hcomps24
foreach file (u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2fits/_u2hcomps24_/"`.fits.H
echo hcomps24/$nfile
hcomp -v -i fits -s 24 < $file > hcomps24/$nfile
end
