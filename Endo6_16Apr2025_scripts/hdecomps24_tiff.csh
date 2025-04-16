#!/bin/tcsh
set verbose
mkdir -p hdecomps24_tiff
foreach file (hdecomps24/*.fits)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}
echo "hdecomps24_tiff/\${nfile}: " hdecomps24_tiff/$nfile
./siril_file2tif.bash $file hdecomps24_tiff/$nfile
end
