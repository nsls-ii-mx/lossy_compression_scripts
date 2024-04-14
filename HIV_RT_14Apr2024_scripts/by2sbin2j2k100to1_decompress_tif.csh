#!/bin/tcsh
mkdir -p by2sbin2j2k100to1_decompress_tif
foreach file (by2sbin2j2k100to1/*.j2k)
echo $file
set fname=${file:t}
set nfile=${fname:r}.TIFF
echo by2sbin2j2k100to1_decompress_tif/$nfile
opj_decompress -i $file -o by2sbin2j2k100to1_decompress_tif/$nfile
end
