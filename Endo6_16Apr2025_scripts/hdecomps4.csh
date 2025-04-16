#!/bin/tcsh
set verbose
mkdir -p hdecomps4
foreach file (hcomps4/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/_u2hcomps4_/_u2hdecomps4/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "hdecomps4/\${nfile}: " hdecomps4/$nfile
hdecomp -v -o fits < $file > hdecomps4/$nfile

set nfile=`echo ${fname:r}|sed "s/_u2hcomps4_/_u2hdecomps4_smoothed/"`
set nfile=${nfile:r}.fits
echo "hdecomps4/\${nfile}: " hdecomps4/$nfile
hdecomp -v -s -o fits < $file > hdecomps4/$nfile

end
