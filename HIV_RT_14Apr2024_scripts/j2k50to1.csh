#!/bin/tcsh
set verbose
mkdir -p j2k50to1
foreach file (u2tif/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2encI/_u2j2k50to1_/"`.j2k
echo j2k50to1/$nfile
opj_compress -r 6400,3200,1600,800,400,200,100,50 -i $file -o j2k50to1/$nfile
end
