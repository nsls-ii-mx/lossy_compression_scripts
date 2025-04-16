#!/bin/tcsh
#set verbose
mkdir -p j2k1000to1_decompress_rev_cbf
foreach file (j2k1000to1_decompress_tif/*.TIFF)
echo $file
set fname=${file:t}
set nfile=${fname:r}.cbf
set u2file=`echo ${fname:r}|sed 's/u2_/u2encI/'`.cbf
set u2revfile=`echo ${fname:r}|sed 's/u2_/u2encbrev/'`.cbf
head --lines=35 u2/$u2file >  j2k1000to1_decompress_rev_cbf/head_$u2file
echo j2k1000to1_decompress_rev_cbf/$u2revfile
tiff2cbf -i $file -o j2k1000to1_decompress_rev_cbf/raw_$u2revfile
tail --lines=+20 j2k1000to1_decompress_rev_cbf/raw_$u2revfile > j2k1000to1_decompress_rev_cbf/tail_$u2revfile
cat j2k1000to1_decompress_rev_cbf/head_$u2file j2k1000to1_decompress_rev_cbf/tail_$u2revfile > j2k1000to1_decompress_rev_cbf/$u2revfile
#exit
end
