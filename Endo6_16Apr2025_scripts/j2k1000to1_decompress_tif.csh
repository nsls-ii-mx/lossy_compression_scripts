#!/bin/tcsh
mkdir -p j2k1000to1_decompress_tif
foreach file (j2k1000to1/*.j2k)
echo $file
set fname=${file:t}
set nfile=${fname:r}.TIFF
echo j2k1000to1_decompress_tif/$nfile
opj_decompress -i $file -o j2k1000to1_decompress_tif/$nfile
end
