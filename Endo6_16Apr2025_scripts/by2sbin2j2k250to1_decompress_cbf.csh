#!/bin/tcsh
set verbose
mkdir -p by2sbin2j2k250to1_decompress_cbf
foreach file (by2sbin2j2k250to1_decompress_tif/*.TIFF)
echo $file
set fname=${file:t}
set nfile=${fname:r}.cbf
echo by2sbin2j2k250to1_decompress_cbf/$nfile
tiff2cbf -i$file -oby2sbin2j2k250to1_decompress_cbf/$nfile
#exit
end
