#!/bin/tcsh
set verbose
mkdir -p by2sbin2hcomps8
foreach file (by2sbin2u2fits/*.fits)
echo $file
set fname=${file:t}
set nfile=${fname:r}.fits.H
echo by2sbin2hcomps8/$nfile
hcomp -v -i fits -s 8 < $file > by2sbin2hcomps8/$nfile
end
