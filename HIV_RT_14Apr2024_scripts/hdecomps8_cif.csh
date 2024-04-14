#!/bin/tcsh
set verbose
mkdir -p hdecomps8_cif
foreach file (hdecomps8_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "hdecomps8_cif/\${nfile}: " hdecomps8_cif/$nfile
tiff2cbf -cI $file hdecomps8_cif/$nfile
end
