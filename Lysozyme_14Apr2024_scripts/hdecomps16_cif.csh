#!/bin/tcsh
set verbose
mkdir -p hdecomps16_cif
foreach file (hdecomps16_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "hdecomps16_cif/\${nfile}: " hdecomps16_cif/$nfile
tiff2cbf $file hdecomps16_cif/$nfile
end
