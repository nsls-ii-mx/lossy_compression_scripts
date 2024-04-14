#!/bin/tcsh
set verbose
mkdir -p hdecomps32
foreach file (hcomps32/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/_u2hcomps32_/_u2hdecomps32/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "hdecomps32/\${nfile}: " hdecomps32/$nfile
hdecomp -v -o fits < $file > hdecomps32/$nfile

set nfile=`echo ${fname:r}|sed "s/_u2hcomps32_/_u2hdecomps32_smoothed/"`
set nfile=${nfile:r}.fits
echo "hdecomps32/\${nfile}: " hdecomps32/$nfile
hdecomp -v -s -o fits < $file > hdecomps32/$nfile

end
