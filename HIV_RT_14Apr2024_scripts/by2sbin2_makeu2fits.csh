#!/bin/tcsh
set verbose
set echo
set PATH=/home/yaya/bin:$PATH
set LD_LIBRARY_PATH=/home/yaya/lib
mkdir -p by2sbin2u2fits
foreach file (by2sbin2u2encI_tiff/*.tif)
set ntfile = `echo ${file:t:r}.tif|sed s/u2encI/u2fits/|sed s/\.tif//`
echo by2sbin2u2fits/$ntfile.fits
./siril_file2fit.bash $file by2sbin2u2fits/$ntfile
end
