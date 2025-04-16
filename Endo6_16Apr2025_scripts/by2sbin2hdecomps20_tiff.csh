#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps20_tiff
foreach file (by2sbin2hdecomps20/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "by2sbin2hdecomps20_tiff/\${nfile}: " by2sbin2hdecomps20_tiff/$nfile
./siril_file2tif.bash $file by2sbin2hdecomps20_tiff/$nfile
end
