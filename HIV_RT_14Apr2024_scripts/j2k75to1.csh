#!/bin/tcsh
set verbose
mkdir -p j2k75to1
foreach file (u2tif/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2encI/_u2j2k75to1_/"`.j2k
echo j2k75to1/$nfile
opj_compress -r 4800,2400,1200,600,300,150,75 -i $file -o j2k75to1/$nfile
end
