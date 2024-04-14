#!/bin/tcsh
set verbose
cp ~/bin/hcomp /dev/shm/hcomp
mkdir -p /dev/shm/by2sbin2hcomp_timing
foreach file (by2sbin2u2fits/*200.fits)
echo $file
set fname=${file:t}
cp $file /dev/shm/by2sbin2hcomp_timing/${fname}
time /dev/shm/hcomp -v -i fits -s 4 < /dev/shm/by2sbin2hcomp_timing/${fname} > /dev/shm/by2sbin2hcomp_timing/s4_${fname}.H
time /dev/shm/hcomp -v -i fits -s 8 < /dev/shm/by2sbin2hcomp_timing/${fname} > /dev/shm/by2sbin2hcomp_timing/s8_${fname}.H
time /dev/shm/hcomp -v -i fits -s 16 < /dev/shm/by2sbin2hcomp_timing/${fname} > /dev/shm/by2sbin2hcomp_timing/s16_${fname}.H
time /dev/shm/hcomp -v -i fits -s 32 < /dev/shm/by2sbin2hcomp_timing/${fname} > /dev/shm/by2sbin2hcomp_timing/s32_${fname}.H
time /dev/shm/hcomp -v -i fits -s 64 < /dev/shm/by2sbin2hcomp_timing/${fname} > /dev/shm/by2sbin2hcomp_timing/s64_${fname}.H
end
