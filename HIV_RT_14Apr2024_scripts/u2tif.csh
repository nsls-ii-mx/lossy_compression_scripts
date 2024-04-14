#!/bin/tcsh
mkdir -p u2tif
foreach file (u2/*.cbf)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2encI/_u2_/"`.tif
echo u2tif/$nfile
cbf2tiff -i $file -o u2tif/$nfile
end
