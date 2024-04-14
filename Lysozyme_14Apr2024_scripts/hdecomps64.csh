#!/bin/tcsh
set verbose
mkdir -p hdecomps64
foreach file (hcomps64/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/_u2hcomps64_/_u2hdecomps64/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "hdecomps64/\${nfile}: " hdecomps64/$nfile
hdecomp -v -o fits < $file > hdecomps64/$nfile

set nfile=`echo ${fname:r}|sed "s/_u2hcomps64_/_u2hdecomps64_smoothed/"`
set nfile=${nfile:r}.fits
echo "hdecomps64/\${nfile}: " hdecomps64/$nfile
hdecomp -v -s -o fits < $file > hdecomps64/$nfile

end
