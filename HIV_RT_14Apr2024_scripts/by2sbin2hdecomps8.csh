#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps8
foreach file (by2sbin2hcomps8/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps8/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "by2sbin2hdecomps8/\${nfile}: " by2sbin2hdecomps8/$nfile
hdecomp -v -o fits < $file > by2sbin2hdecomps8/$nfile

set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps8_smoothed/"`
set nfile=${nfile:r}.fits
echo "by2sbin2hdecomps8/\${nfile}: " by2sbin2hdecomps8/$nfile
hdecomp -v -s -o fits < $file > by2sbin2hdecomps8/$nfile

end
