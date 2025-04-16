#!/bin/tcsh
set verbose
mkdir -p hdecomps20_tiff
foreach file (hdecomps20/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "hdecomps20_tiff/\${nfile}: " hdecomps20_tiff/$nfile
./siril_file2tif.bash $file hdecomps20_tiff/$nfile
end
