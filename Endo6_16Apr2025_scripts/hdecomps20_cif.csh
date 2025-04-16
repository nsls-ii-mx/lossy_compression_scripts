#!/bin/tcsh
set verbose
mkdir -p hdecomps20_cif
foreach file (hdecomps20_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "hdecomps20_cif/\${nfile}: " hdecomps20_cif/$nfile
tiff2cbf $file hdecomps20_cif/$nfile
end
