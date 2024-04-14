#!/bin/tcsh
set verbose
mkdir -p by2sbin2hdecomps32_cbf_rev
mkdir -p by2sbin2hdecomps32_cbf_rev_trash
foreach file (by2sbin2hdecomps32_cif/*.cif)
echo "\${file}: " $file
set fname=${file:t}
set nfile=${fname:r}.cbf
echo "*** new file: "$nfile
set cbfile=`echo ${nfile}|sed s/01_22013/_01_22013/`
set oldcbffile=`echo ${nfile}|sed s/_u2hdecomps32/encb_/|sed s/_smoothed//`
head -n20 < by2sbin2/$oldcbffile > by2sbin2hdecomps32_cbf_rev/head_$oldcbffile
cif2cbf -en -cb -i $file -o by2sbin2hdecomps32_cbf_rev/$cbfile
tail -n +26 < by2sbin2hdecomps32_cbf_rev/$cbfile > by2sbin2hdecomps32_cbf_rev/tail_$nfile
echo by2sbin2hdecomps32_cbf_rev/$nfile
cat by2sbin2hdecomps32_cbf_rev/head_$oldcbffile by2sbin2hdecomps32_cbf_rev/tail_$nfile > by2sbin2hdecomps32_cbf_rev/$nfile
mv by2sbin2hdecomps32_cbf_rev/head_$oldcbffile by2sbin2hdecomps32_cbf_rev/tail_$nfile by2sbin2hdecomps32_cbf_rev/$cbfile by2sbin2hdecomps32_cbf_rev_trash/
mv by2sbin2hdecomps32_cbf_rev/$nfile by2sbin2hdecomps32_cbf_rev/$cbfile
end
