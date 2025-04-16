#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps32_tiff
foreach file (by2sbin2hdecomps32/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "by2sbin2hdecomps32_tiff/\${nfile}: " by2sbin2hdecomps32_tiff/$nfile
./siril_file2tif.bash $file by2sbin2hdecomps32_tiff/$nfile
end
