#!/bin/tcsh
set verbose
mkdir -p j2k20to1
foreach file (u2tif/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2encI/_u2j2k20to1_/"`.j2k
echo j2k20to1/$nfile
opj_compress -r 5120,2560,1280,640,320,160,80,40,20 -i $file -o j2k20to1/$nfile
end
