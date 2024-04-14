#!/bin/tcsh
set verbose
mkdir -p hdecomps4_cif
foreach file (hdecomps4_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "hdecomps4_cif/\${nfile}: " hdecomps4_cif/$nfile
tiff2cbf -cI $file hdecomps4_cif/$nfile
end
