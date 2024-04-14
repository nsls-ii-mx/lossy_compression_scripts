#!/bin/tcsh
set verbose
mkdir -p /dev/shm/by2sbin2j2ktiming
foreach file (by2sbin2u2encI_tiff/*200.tif)
echo $file
set fname=${file:t}
cp $file /dev/shm/by2sbin2j2ktiming/
cp ~/bin/opj_compress /dev/shm
time /dev/shm/opj_compress -r 3200,1600,800,400,200,100,50,25 -i /dev/shm/by2sbin2j2ktiming/${fname} -o /dev/shm/by2sbin2j2ktiming/j2k25to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 3200,1600,800,400,200,100,50 -i /dev/shm/by2sbin2j2ktiming/${fname} -o /dev/shm/by2sbin2j2ktiming/j2k50to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 3200,1600,800,400,200,100 -i /dev/shm/by2sbin2j2ktiming/${fname} -o /dev/shm/by2sbin2j2ktiming/j2k100to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 3200,1600,800,400,200 -i /dev/shm/by2sbin2j2ktiming/${fname} -o /dev/shm/by2sbin2j2ktiming/j2k200to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 4000,2000,1000,500 -i /dev/shm/by2sbin2j2ktiming/${fname} -o /dev/shm/by2sbin2j2ktiming/j2k500to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 4000,2000,1000 -i /dev/shm/by2sbin2j2ktiming/${fname} -o /dev/shm/by2sbin2j2ktiming/j2k1000to1_${fname:r}.j2k
time /dev/shm/opj_compress -r 4000,2000 -i /dev/shm/by2sbin2j2ktiming/${fname} -o /dev/shm/j2ktiming/by2sbin2j2k2000to1_${fname:r}.j2k
end

