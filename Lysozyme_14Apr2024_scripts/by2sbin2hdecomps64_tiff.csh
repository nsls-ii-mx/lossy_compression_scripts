#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps64_tiff
foreach file (by2sbin2hdecomps64/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "by2sbin2hdecomps64_tiff/\${nfile}: " by2sbin2hdecomps64_tiff/$nfile
./siril_file2tif.bash $file by2sbin2hdecomps64_tiff/$nfile
end
