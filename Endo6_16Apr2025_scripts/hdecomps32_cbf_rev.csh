#!/bin/tcsh
set verbose
mkdir -p hdecomps32_cbf_rev
foreach file (hdecomps32_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set cbfile=`echo ${nfile}|sed s/u2hdecomps32/u2hdecomps32encb/`
set oldcbffile=`echo ${nfile}|sed s/u2hdecomps32/u2encI/|sed s/_smoothed//`
head -n20 < u2encI/$oldcbffile > hdecomps32_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o hdecomps32_cbf_rev/$cbfile
tail -n +26 < hdecomps32_cbf_rev/$cbfile > hdecomps32_cbf_rev/tail_$nfile
echo hdecomps32_cbf_rev/$nfile
cat hdecomps32_cbf_rev/head_$oldcbffile hdecomps32_cbf_rev/tail_$nfile > hdecomps32_cbf_rev/$nfile
end
