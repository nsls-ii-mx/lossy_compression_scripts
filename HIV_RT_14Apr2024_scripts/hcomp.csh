#!/bin/tcsh

set verbose
mkdir -p hcomp2
foreach file(JLJ735_u2tiff_fit/*.fit)
echo $file
set fname=${file:t}

set nfile=s1_${fname}.H
echo hcomp2/$nfile
hcomp -v -i fits -s 1 < $file >hcomp2/$nfile

set nfile=s2_${fname}.H
echo hcomp2/$nfile
hcomp -v -i fits -s 2 < $file >hcomp2/$nfile

set nfile=s4_${fname}.H
echo hcomp2/$nfile
hcomp -v -i fits -s 4 <$file >hcomp2/$nfile

set nfile=s6_${fname}.H
echo hcomp2/$nfile
hcomp -v -i fits -s 6 <$file >hcomp2/$nfile

set nfile=s8_${fname:r}.H
echo hcomp2/$nfile
hcomp -v -i fits -s 8 <$file >hcomp2/$nfile
end
