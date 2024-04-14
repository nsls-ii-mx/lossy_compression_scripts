#!/bin/csh
set verbose
mkdir -p u2encI
foreach file(CBFs/*.cbf)
set nfile=`echo ${file:r} | sed "s/22013_/22013_u2encI_/"`
echo ${nfile:t}
cif2cbf -I-2 -en -cI -i $file  -o u2encI/${nfile:t}.cbf
end
