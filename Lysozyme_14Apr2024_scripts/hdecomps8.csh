#!/bin/tcsh
set verbose
mkdir -p hdecomps8
foreach file (hcomps8/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/_u2hcomps8_/_u2hdecomps8/"`
set nfile=${nfile:r}.fits
echo "**** \$nfile :" $nfile
echo "hdecomps8/\${nfile}: " hdecomps8/$nfile
hdecomp -v -o fits < $file > hdecomps8/$nfile

set nfile=`echo ${fname:r}|sed "s/_u2hcomps8_/_u2hdecomps8_smoothed/"`
set nfile=${nfile:r}.fits
echo "hdecomps8/\${nfile}: " hdecomps8/$nfile
hdecomp -v -s -o fits < $file > hdecomps8/$nfile

end
