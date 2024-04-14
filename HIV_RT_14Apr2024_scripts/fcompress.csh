#!/bin/tcsh
mkdir -p fcomp
foreach file (fits/*.fits)
echo $file
set fname=${file:t}

set nfile=s2_${fname:r}.fits.H
echo fcomp/$nfile
fcompress -s 2 $file 
mv $file.H fcomp/$nfile

set nfile=s4_${fname:r}.fits.H
echo fcomp/$nfile
fcompress -s 4 $file
mv $file.H fcomp/$nfile

set nfile=s6_${fname:r}.fits.H
echo fcomp/$nfile
fcompress -s 6 $file
mv $file.H fcomp/$nfile

set nfile=s8_${fname:r}.fits.H
echo fcomp/$nfile
fcompress -s 8 $file 
mv $file.H fcomp/$nfile
end
