#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps4_tiff
foreach file (by2sbin2hdecomps4/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "by2sbin2hdecomps4_tiff/\${nfile}: " by2sbin2hdecomps4_tiff/$nfile
./siril_file2tif.bash $file by2sbin2hdecomps4_tiff/$nfile
end
