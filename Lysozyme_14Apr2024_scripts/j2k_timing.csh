#!/bin/tcsh
set verbose
mkdir -p /dev/shm/j2ktiming
foreach file (u2tiff/*00300.tif)
echo $file
set fname=${file:t}
cp $file /dev/shm/j2ktiming/
cp ~/bin/opj_compress /dev/shm
time /dev/shm/opj_compress -r 3200,1600,800,400,200 -i /dev/shm/j2ktiming/${fname} -o /dev/shm/j2ktiming/j2k200to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 4000,2000,1000,500 -i /dev/shm/j2ktiming/${fname} -o /dev/shm/j2ktiming/j2k500to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 4000,2000,1000 -i /dev/shm/j2ktiming/${fname} -o /dev/shm/j2ktiming/j2k1000to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 4000,2000 -i /dev/shm/j2ktiming/${fname} -o /dev/shm/j2ktiming/j2k2000to1_${fname:r}.j2k
end

