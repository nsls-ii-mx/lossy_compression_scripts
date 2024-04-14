#!/bin/tcsh
set verbose
mkdir -p hdecomps32_tiff
foreach file (hdecomps32/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "hdecomps32_tiff/\${nfile}: " hdecomps32_tiff/$nfile
./siril_file2tif.bash $file hdecomps32_tiff/$nfile
end
