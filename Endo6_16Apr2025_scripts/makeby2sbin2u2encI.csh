#!/bin/csh
set verbose
mkdir -p by2sbin2u2encI
foreach file(by2sbin2/*.cbf)
set nfile=`echo ${file:r} | sed "s/encb_/u2encI_/"`
echo ${nfile:t}
cif2cbf -I-2 -en -cI -i $file  -o by2sbin2u2encI/${nfile:t}.cbf
end
