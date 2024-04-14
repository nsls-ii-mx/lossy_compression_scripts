#!/bin/tcsh
mkdir -p j2k1000to1
foreach file (u2tif/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2encI/_u2j2k1000to1_/"`.j2k
echo j2k1000to1/$nfile
opj_compress -r 4000,2000,1000 -i $file -o j2k1000to1/$nfile
end
