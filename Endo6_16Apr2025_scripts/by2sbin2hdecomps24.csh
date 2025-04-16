#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps24
foreach file (by2sbin2hcomps24/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps24/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "by2sbin2hdecomps24/\${nfile}: " by2sbin2hdecomps24/$nfile
hdecomp -v -o fits < $file > by2sbin2hdecomps24/$nfile

set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps24_smoothed/"`
set nfile=${nfile:r}.fits
echo "by2sbin2hdecomps24/\${nfile}: " by2sbin2hdecomps24/$nfile
hdecomp -v -s -o fits < $file > by2sbin2hdecomps24/$nfile

end
