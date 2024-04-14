#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps24_tiff
foreach file (by2sbin2hdecomps24/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "by2sbin2hdecomps24_tiff/\${nfile}: " by2sbin2hdecomps24_tiff/$nfile
./siril_file2tif.bash $file by2sbin2hdecomps24_tiff/$nfile
end
