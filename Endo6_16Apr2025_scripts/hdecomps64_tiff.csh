#!/bin/tcsh
set verbose
mkdir -p hdecomps64_tiff
foreach file (hdecomps64/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "hdecomps64_tiff/\${nfile}: " hdecomps64_tiff/$nfile
./siril_file2tif.bash $file hdecomps64_tiff/$nfile
end
