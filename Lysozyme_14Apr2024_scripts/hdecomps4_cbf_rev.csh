#!/bin/tcsh
set verbose
mkdir -p hdecomps4_cbf_rev
foreach file (hdecomps4_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set cbfile=`echo ${nfile}|sed s/u2hdecomps4/u2hdecomps4encb/`
set oldcbffile=`echo ${nfile}|sed s/u2hdecomps4/u2encI/|sed s/_smoothed//`
head -n20 < u2encI/$oldcbffile > hdecomps4_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o hdecomps4_cbf_rev/$cbfile
tail -n +26 < hdecomps4_cbf_rev/$cbfile > hdecomps4_cbf_rev/tail_$nfile
echo hdecomps4_cbf_rev/$nfile
cat hdecomps4_cbf_rev/head_$oldcbffile hdecomps4_cbf_rev/tail_$nfile > hdecomps4_cbf_rev/$nfile
end
