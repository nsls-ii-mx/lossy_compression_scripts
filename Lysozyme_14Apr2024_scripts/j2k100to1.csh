#!/bin/tcsh
set verbose
mkdir -p j2k100to1
foreach file (u2tiff/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2tiff/_u2j2k100to1_/"`.j2k
echo j2k100to1/$nfile
opj_compress -r 3200,1600,800,400,200,100 -i $file -o j2k100to1/$nfile
end
