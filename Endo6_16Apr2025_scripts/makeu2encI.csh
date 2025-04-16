#!/bin/csh
set verbose
mkdir -p u2encI
foreach file(CBFs_Endo/*.cbf)
set nfile=`echo ${file:r} | sed "s/to_cbf_/Endo6_23AA_2v_502_u2encI_/"`
echo ${nfile:t}
cif2cbf -I-2 -en -cI -i $file  -o u2encI/${nfile:t}.cbf
end
