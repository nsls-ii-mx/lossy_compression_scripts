#!/bin/tcsh
set verbose
mkdir -p hdecomps24_cbf_rev
foreach file (hdecomps24_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set cbfile=`echo ${nfile}|sed s/u2hdecomps24/u2hdecomps24encb/`
set oldcbffile=`echo ${nfile}|sed s/u2hdecomps24/u2encI/|sed s/_smoothed//`
head -n20 < u2encI/$oldcbffile > hdecomps24_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o hdecomps24_cbf_rev/$cbfile
tail -n +26 < hdecomps24_cbf_rev/$cbfile > hdecomps24_cbf_rev/tail_$nfile
echo hdecomps24_cbf_rev/$nfile
cat hdecomps24_cbf_rev/head_$oldcbffile hdecomps24_cbf_rev/tail_$nfile > hdecomps24_cbf_rev/$nfile
rm hdecomps24_cbf_rev/head_$oldcbffile hdecomps24_cbf_rev/tail_$nfile
rm hdecomps24_cbf_rev/$cbfile
end
