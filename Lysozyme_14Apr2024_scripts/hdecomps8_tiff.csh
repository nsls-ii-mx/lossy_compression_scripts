#!/bin/tcsh
set verbose
mkdir -p hdecomps8_tiff
foreach file (hdecomps8/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "hdecomps8_tiff/\${nfile}: " hdecomps8_tiff/$nfile
./siril_file2tif.bash $file hdecomps8_tiff/$nfile
end
