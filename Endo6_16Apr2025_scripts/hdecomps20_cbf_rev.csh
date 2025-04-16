#!/bin/tcsh
set verbose
mkdir -p hdecomps20_cbf_rev
foreach file (hdecomps20_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set cbfile=`echo ${nfile}|sed s/u2hdecomps20/u2hdecomps20encb/`
set oldcbffile=`echo ${nfile}|sed s/u2hdecomps20/u2encI/|sed s/_smoothed//`
head -n20 < u2encI/$oldcbffile > hdecomps20_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o hdecomps20_cbf_rev/$cbfile
tail -n +26 < hdecomps20_cbf_rev/$cbfile > hdecomps20_cbf_rev/tail_$nfile
echo hdecomps20_cbf_rev/$nfile
cat hdecomps20_cbf_rev/head_$oldcbffile hdecomps20_cbf_rev/tail_$nfile > hdecomps20_cbf_rev/$nfile
rm hdecomps20_cbf_rev/head_$oldcbffile hdecomps20_cbf_rev/tail_$nfile
rm hdecomps20_cbf_rev/$cbfile
end
