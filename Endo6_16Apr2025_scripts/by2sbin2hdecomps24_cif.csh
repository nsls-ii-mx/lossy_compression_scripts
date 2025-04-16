#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps24_cif
foreach file (by2sbin2hdecomps24_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "by2sbin2hdecomps24_cif/\${nfile}: " by2sbin2hdecomps24_cif/$nfile
tiff2cbf $file by2sbin2hdecomps24_cif/$nfile
end
