#!/bin/tcsh
set verbose
export LD_LIBRARY_PATH=${HOME}/lib
export PATH=${HOME}/bin:$PATH
set hcompdir=$1
set hdecompdir=$2
mkdir -p ${hdecompdir}
mkdir -p ${hdecompdir}_tiff
mkdir -p ${hdecompdir}_cbf
foreach file (${hcompdir}/*.fits.H)
echo "\${file}: " $file
set fname=${file:t}
echo "**** \$fname :" $fname
set nfile=`echo ${fname:r}|sed "s/u2encI/${hdecompdir}/"`
set fitsfile=${nfile:r}.fits
set tifffile=${nfile:r}.tif
set ciffile=${nfile:r}.cif
echo "**** \$nfile :" $nfile
echo "**** \$fitsfile :" $fitsfile
echo "**** \$tifffile :" $tifffile
echo "**** \$ciffile :" $ciffile
hdecomp -v -o fits < $file > ${hdecompdir}/$fitsfile
bash ./siril_file2tif.bash ${hdecompdir}/$fitsfile ${hdecompdir}_tiff/${tifffile:r}
tiff2cbf ${hdecompdir}_tiff/${tifffile} ${hdecompdir}_cbf/${ciffile}
end
