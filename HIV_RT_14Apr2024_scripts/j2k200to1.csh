#!/bin/tcsh
set verbose
mkdir -p j2k200to1
foreach file (u2tif/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2encI/_u2j2k200to1_/"`.j2k
echo j2k200to1/$nfile
opj_compress -r 6400,3200,1600,800,400,200 -i $file -o j2k200to1/$nfile
end
