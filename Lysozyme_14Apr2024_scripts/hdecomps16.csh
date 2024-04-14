#!/bin/tcsh
set verbose
mkdir -p hdecomps16
foreach file (hcomps16/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/_u2hcomps16_/_u2hdecomps16/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "hdecomps16/\${nfile}: " hdecomps16/$nfile
hdecomp -v -o fits < $file > hdecomps16/$nfile

set nfile=`echo ${fname:r}|sed "s/_u2hcomps16_/_u2hdecomps16_smoothed/"`
set nfile=${nfile:r}.fits
echo "hdecomps16/\${nfile}: " hdecomps16/$nfile
hdecomp -v -s -o fits < $file > hdecomps16/$nfile

end
