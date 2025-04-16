#!/bin/csh
set verbose
mkdir -p by2sbin2u2encI_tiff
foreach file(by2sbin2u2encI/*.cbf)
set nfile=${file:r}
echo ${nfile:t}
cbf2tiff $file by2sbin2u2encI_tiff/${nfile:t}.tif
end
