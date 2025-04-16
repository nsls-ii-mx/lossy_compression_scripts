#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps32
foreach file (by2sbin2hcomps32/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps32/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "by2sbin2hdecomps32/\${nfile}: " by2sbin2hdecomps32/$nfile
hdecomp -v -o fits < $file > by2sbin2hdecomps32/$nfile

set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps32_smoothed/"`
set nfile=${nfile:r}.fits
echo "by2sbin2hdecomps32/\${nfile}: " by2sbin2hdecomps32/$nfile
hdecomp -v -s -o fits < $file > by2sbin2hdecomps32/$nfile

end
