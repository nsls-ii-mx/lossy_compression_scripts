#!/bin/tcsh
set verbose
mkdir -p hdecomps64_cbf_rev
foreach file (hdecomps64_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set cbfile=`echo ${nfile}|sed s/u2hdecomps64/u2hdecomps64encb/`
set oldcbffile=`echo ${nfile}|sed s/u2hdecomps64/u2encI/|sed s/_smoothed//`
head -n20 < u2encI/$oldcbffile > hdecomps64_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o hdecomps64_cbf_rev/$cbfile
tail -n +26 < hdecomps64_cbf_rev/$cbfile > hdecomps64_cbf_rev/tail_$nfile
echo hdecomps64_cbf_rev/$nfile
cat hdecomps64_cbf_rev/head_$oldcbffile hdecomps64_cbf_rev/tail_$nfile > hdecomps64_cbf_rev/$nfile
rm hdecomps64_cbf_rev/head_$oldcbffile hdecomps64_cbf_rev/tail_$nfile hdecomps64_cbf_rev/$cbfile
end
