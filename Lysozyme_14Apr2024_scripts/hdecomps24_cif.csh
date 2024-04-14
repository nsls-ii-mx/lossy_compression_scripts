#!/bin/tcsh
set verbose
mkdir -p hdecomps24_cif
foreach file (hdecomps24_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "hdecomps24_cif/\${nfile}: " hdecomps24_cif/$nfile
tiff2cbf $file hdecomps24_cif/$nfile
end
