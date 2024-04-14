#!/bin/tcsh
set verbose
mkdir -p hdecomps32_cif
foreach file (hdecomps32_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "hdecomps32_cif/\${nfile}: " hdecomps32_cif/$nfile
tiff2cbf $file hdecomps32_cif/$nfile
end
