#!/bin/tcsh
set verbose
mkdir -p by2sbin2j2k1500to1
foreach file (by2sbin2u2encI_tiff/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/u2encI/u2j2k1500to1/"`.j2k
echo by2sbin2j2k1500to1/$nfile
opj_compress -r 4500,3000,1500 -i $file -o by2sbin2j2k1500to1/$nfile
end
