#!/bin/tcsh
set verbose
mkdir -p by2sbin2j2k200to1_decompress_rev_cbf
foreach file (by2sbin2j2k200to1_decompress_tif/*.TIFF)
echo $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set u2file=`echo ${fname:r}|sed 's/u2j2k200to1/u2encI/'`.cbf
set u2revfile=`echo ${fname:r}|sed 's/u2j2k200to1/u2encbrev/'`.cbf
head --lines=35 by2sbin2u2encI/$u2file >  by2sbin2j2k200to1_decompress_rev_cbf/head_$u2file
echo by2sbin2j2k200to1_decompress_rev_cbf/$u2revfile
tiff2cbf -i $file -o by2sbin2j2k200to1_decompress_rev_cbf/raw_$u2revfile
tail --lines=+20 by2sbin2j2k200to1_decompress_rev_cbf/raw_$u2revfile > by2sbin2j2k200to1_decompress_rev_cbf/tail_$u2revfile
cat by2sbin2j2k200to1_decompress_rev_cbf/head_$u2file by2sbin2j2k200to1_decompress_rev_cbf/tail_$u2revfile > by2sbin2j2k200to1_decompress_rev_cbf/$u2revfile
rm by2sbin2j2k200to1_decompress_rev_cbf/head_$u2file by2sbin2j2k200to1_decompress_rev_cbf/tail_$u2revfile by2sbin2j2k200to1_decompress_rev_cbf/raw_$u2revfile
#exit
end
