#!/bin/tcsh
set verbose
mkdir -p hdecomps64_cif
foreach file (hdecomps64_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "hdecomps64_cif/\${nfile}: " hdecomps64_cif/$nfile
tiff2cbf -cI $file hdecomps64_cif/$nfile
end
