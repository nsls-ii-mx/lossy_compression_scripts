#!/bin/tcsh
set verbose
mkdir -p hdecomps16_tiff
foreach file (hdecomps16/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "hdecomps16_tiff/\${nfile}: " hdecomps16_tiff/$nfile
./siril_file2tif.bash $file hdecomps16_tiff/$nfile
end
