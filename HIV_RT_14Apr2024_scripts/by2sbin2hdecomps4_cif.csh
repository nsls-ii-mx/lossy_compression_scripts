#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps4_cif
foreach file (by2sbin2hdecomps4_tiff/*.tif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cif
echo "by2sbin2hdecomps4_cif/\${nfile}: " by2sbin2hdecomps4_cif/$nfile
tiff2cbf -cI $file by2sbin2hdecomps4_cif/$nfile
end
