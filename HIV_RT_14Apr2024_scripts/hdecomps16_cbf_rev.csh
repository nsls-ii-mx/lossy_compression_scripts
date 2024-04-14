#!/bin/tcsh
set verbose
mkdir -p hdecomps16_cbf_rev
mkdir -p hdecomps16_cbf_rev_trash
foreach file (hdecomps16_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set cbfile=`echo ${nfile}|sed s/u2hdecomps16/u2hdecomps16encb/`
set oldcbffile=`echo ${nfile}|sed s/_u2hdecomps16//|sed s/_smoothed//`
head -n20 < u2encI/$oldcbffile > hdecomps16_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o hdecomps16_cbf_rev/$cbfile
tail -n +26 < hdecomps16_cbf_rev/$cbfile > hdecomps16_cbf_rev/tail_$nfile
echo hdecomps16_cbf_rev/$nfile
cat hdecomps16_cbf_rev/head_$oldcbffile hdecomps16_cbf_rev/tail_$nfile > hdecomps16_cbf_rev/$nfile
mv hdecomps16_cbf_rev/head_$oldcbffile hdecomps16_cbf_rev/tail_$nfile hdecomps16_cbf_rev/$cbfile hdecomps16_cbf_rev_trash/
end
