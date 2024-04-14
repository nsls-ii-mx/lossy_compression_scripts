#!/bin/tcsh
set verbose
mkdir -p hdecomps8_cbf_rev
mkdir -p hdecomps8_cbf_rev_trash
foreach file (hdecomps8_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set cbfile=`echo ${nfile}|sed s/u2hdecomps8/u2hdecomps8encb/`
set oldcbffile=`echo ${nfile}|sed s/_u2hdecomps8//|sed s/_smoothed//`
head -n20 < u2encI/$oldcbffile > hdecomps8_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o hdecomps8_cbf_rev/$cbfile
tail -n +26 < hdecomps8_cbf_rev/$cbfile > hdecomps8_cbf_rev/tail_$nfile
echo hdecomps8_cbf_rev/$nfile
cat hdecomps8_cbf_rev/head_$oldcbffile hdecomps8_cbf_rev/tail_$nfile > hdecomps8_cbf_rev/$nfile
mv hdecomps8_cbf_rev/head_$oldcbffile hdecomps8_cbf_rev/tail_$nfile hdecomps8_cbf_rev/$cbfile hdecomps8_cbf_rev_trash/
end
