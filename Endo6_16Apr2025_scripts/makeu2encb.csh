#!/bin/csh
set verbose
mkdir -p u2encb
foreach file(CBFs_Endo/*.cbf)
set nfile=`echo ${file:r} | sed "s/to_cbf_/Endo6_23AA_2v_502_u2encb_/"`
echo ${nfile:t}
cif2cbf -I-2 -en -cb -i $file  -o u2encb/${nfile:t}.cbf
end
