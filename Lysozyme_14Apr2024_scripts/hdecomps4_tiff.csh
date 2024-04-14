#!/bin/tcsh
set verbose
mkdir -p hdecomps4_tiff
foreach file (hdecomps4/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "hdecomps4_tiff/\${nfile}: " hdecomps4_tiff/$nfile
./siril_file2tif.bash $file hdecomps4_tiff/$nfile
end
