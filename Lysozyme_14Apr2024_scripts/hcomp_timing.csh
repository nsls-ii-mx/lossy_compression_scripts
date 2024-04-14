#!/bin/tcsh
set verbose
cp ~/bin/hcomp /dev/shm/hcomp 
mkdir -p /dev/shm/hcomp_timing
foreach file (u2fits/*00300.fits)
echo $file
set fname=${file:t}
cp $file /dev/shm/hcomp_timing/${fname}
time /dev/shm/hcomp -v -i fits -s 4 < /dev/shm/hcomp_timing/${fname} > /dev/shm/hcomp_timing/s4_${fname}.H
time /dev/shm/hcomp -v -i fits -s 8 < /dev/shm/hcomp_timing/${fname} > /dev/shm/hcomp_timing/s8_${fname}.H
time /dev/shm/hcomp -v -i fits -s 16 < /dev/shm/hcomp_timing/${fname} > /dev/shm/hcomp_timing/s16_${fname}.H
time /dev/shm/hcomp -v -i fits -s 32 < /dev/shm/hcomp_timing/${fname} > /dev/shm/hcomp_timing/s32_${fname}.H
time /dev/shm/hcomp -v -i fits -s 64 < /dev/shm/hcomp_timing/${fname} > /dev/shm/hcomp_timing/s64_${fname}.H
end

