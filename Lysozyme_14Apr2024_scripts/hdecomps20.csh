#!/bin/tcsh
set verbose
mkdir -p hdecomps20
foreach file (hcomps20/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/_u2hcomps20_/_u2hdecomps20/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "hdecomps20/\${nfile}: " hdecomps20/$nfile
hdecomp -v -o fits < $file > hdecomps20/$nfile

set nfile=`echo ${fname:r}|sed "s/_u2hcomps20_/_u2hdecomps20_smoothed/"`
set nfile=${nfile:r}.fits
echo "hdecomps20/\${nfile}: " hdecomps20/$nfile
hdecomp -v -s -o fits < $file > hdecomps20/$nfile

end
