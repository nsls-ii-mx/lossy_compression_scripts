#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps16_cif
foreach file (by2sbin2hdecomps16_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "by2sbin2hdecomps16_cif/\${nfile}: " by2sbin2hdecomps16_cif/$nfile
tiff2cbf $file by2sbin2hdecomps16_cif/$nfile
end
