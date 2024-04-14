#!/bin/tcsh
set verbose
export LD_LIBRARY_PATH=${HOME}/lib
set ftype=$1
mkdir -p ${ftype}_u2encIcbfs
mkdir -p ${ftype}_u2tifs
mkdir -p ${ftype}_u2fits
mkdir -p ${ftype}_u2hcomps4
mkdir -p ${ftype}_u2hcomps8
mkdir -p ${ftype}_u2hcomps16
mkdir -p ${ftype}_u2hcomps20
mkdir -p ${ftype}_u2hcomps24
mkdir -p ${ftype}_u2hcomps32
mkdir -p ${ftype}_u2hcomps64
foreach file (${ftype}/*.cbf)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/encb/u2encI/"`.cbf
cif2cbf -en -cI -I-2 -i ${file} -o ${ftype}_u2encIcbfs/${nfile}
set tfile=`echo $fname:r|sed "s/encb/u2tiff/"`.tiff
cbf2tiff  ${ftype}_u2encIcbfs/${nfile}  ${ftype}_u2tifs/${tfile}
set fitfile=`echo $fname:r|sed "s/encb/u2fits/"`.fits
./siril_file2fit.bash  ${ftype}_u2tifs/${tfile}  ${ftype}_u2fits/${fitfile}
set hcomps4file=`echo $fname:r|sed "s/encb/u2hcomps4/"`.fits.H
nice hcomp -v -i fits -s 4 < ${ftype}_u2fits/${fitfile} > ${ftype}_u2hcomps4/$hcomps4file &
set hcomps8file=`echo $fname:r|sed "s/encb/u2hcomps8/"`.fits.H
nice hcomp -v -i fits -s 8 < ${ftype}_u2fits/${fitfile} > ${ftype}_u2hcomps8/$hcomps8file &
set hcomps16file=`echo $fname:r|sed "s/encb/u2hcomps16/"`.fits.H
nice hcomp -v -i fits -s 16 < ${ftype}_u2fits/${fitfile} > ${ftype}_u2hcomps16/$hcomps16file &
set hcomps20file=`echo $fname:r|sed "s/encb/u2hcomps20/"`.fits.H
nice hcomp -v -i fits -s 20 < ${ftype}_u2fits/${fitfile} > ${ftype}_u2hcomps20/$hcomps20file &
set hcomps24file=`echo $fname:r|sed "s/encb/u2hcomps24/"`.fits.H
nice hcomp -v -i fits -s 24 < ${ftype}_u2fits/${fitfile} > ${ftype}_u2hcomps24/$hcomps24file &
set hcomps32file=`echo $fname:r|sed "s/encb/u2hcomps32/"`.fits.H
nice hcomp -v -i fits -s 32 < ${ftype}_u2fits/${fitfile} > ${ftype}_u2hcomps32/$hcomps32file &
set hcomps64file=`echo $fname:r|sed "s/encb/u2hcomps64/"`.fits.H
nice hcomp -v -i fits -s 64 < ${ftype}_u2fits/${fitfile} > ${ftype}_u2hcomps64/$hcomps64file &
end
