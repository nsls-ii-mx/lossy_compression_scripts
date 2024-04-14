#!/bin/tcsh
#set verbose
mkdir -p j2k2000to1_decompress_cbf
foreach file (j2k2000to1_decompress_tif/*.TIFF)
echo $file
set fname=${file:t}
set nfile=${fname:r}.cbf
echo j2k2000to1_decompress_cbf/$nfile
tiff2cbf -i$file -oj2k2000to1_decompress_cbf/$nfile
#exit
end
