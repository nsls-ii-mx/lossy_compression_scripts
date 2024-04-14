#!/bin/tcsh
set verbose
mkdir -p hdecomps24
foreach file (hcomps24/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/_u2hcomps24_/_u2hdecomps24/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "hdecomps24/\${nfile}: " hdecomps24/$nfile
hdecomp -v -o fits < $file > hdecomps24/$nfile

set nfile=`echo ${fname:r}|sed "s/_u2hcomps24_/_u2hdecomps24_smoothed/"`
set nfile=${nfile:r}.fits
echo "hdecomps24/\${nfile}: " hdecomps24/$nfile
hdecomp -v -s -o fits < $file > hdecomps24/$nfile

end
