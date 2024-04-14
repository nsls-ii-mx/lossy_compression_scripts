#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps64
foreach file (by2sbin2hcomps64/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps64/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "by2sbin2hdecomps64/\${nfile}: " by2sbin2hdecomps64/$nfile
hdecomp -v -o fits < $file > by2sbin2hdecomps64/$nfile

set nfile=`echo ${fname:r}|sed "s/u2fits_/_u2hdecomps64_smoothed/"`
set nfile=${nfile:r}.fits
echo "by2sbin2hdecomps64/\${nfile}: " by2sbin2hdecomps64/$nfile
hdecomp -v -s -o fits < $file > by2sbin2hdecomps64/$nfile

end
