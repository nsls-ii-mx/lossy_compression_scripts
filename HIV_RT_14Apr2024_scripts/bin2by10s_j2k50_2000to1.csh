#!/bin/tcsh
set verbose
mkdir -p bin2by10s_j2k50to1
mkdir -p bin2by10s_j2k100to1
mkdir -p bin2by10s_j2k200to1
mkdir -p bin2by10s_j2k500to1
mkdir -p bin2by10s_j2k1000to1
mkdir -p bin2by10s_j2k1500to1
mkdir -p bin2by10s_j2k2000to1
foreach file (bin2by10s_u2tifs/*.tiff)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/su2tiff/_50to1/"`.j2k
echo bin2by10s_j2k50to1/$nfile
opj_compress -r 3200,1600,800,400,200,100,50 -i $file -o bin2by10s_j2k50to1/$nfile
set nfile=`echo $fname:r|sed "s/su2tiff/_100to1/"`.j2k
echo bin2by10s_j2k100to1/$nfile
opj_compress -r 3200,1600,800,400,200,100 -i $file -o bin2by10s_j2k100to1/$nfile
set nfile=`echo $fname:r|sed "s/su2tiff/_200to1/"`.j2k
echo bin2by10s_j2k200to1/$nfile
opj_compress -r 3200,1600,800,400,200 -i $file -o bin2by10s_j2k200to1/$nfile
set nfile=`echo $fname:r|sed "s/su2tiff/_500to1/"`.j2k
echo bin2by10s_j2k500to1/$nfile
opj_compress -r 4000,2000,1000,500 -i $file -o bin2by10s_j2k500to1/$nfile
set nfile=`echo $fname:r|sed "s/su2tiff/_1000to1/"`.j2k
echo bin2by10s_j2k1000to1/$nfile
opj_compress -r 4000,2000,1000 -i $file -o bin2by10s_j2k1000to1/$nfile
set nfile=`echo $fname:r|sed "s/su2tiff/_1500to1/"`.j2k
echo bin2by10s_j2k1500to1/$nfile
opj_compress -r 3000,1500 -i $file -o bin2by10s_j2k1500to1/$nfile
set nfile=`echo $fname:r|sed "s/su2tiff/_2000to1/"`.j2k
echo bin2by10s_j2k2000to1/$nfile
opj_compress -r 4000,2000 -i $file -o bin2by10s_j2k2000to1/$nfile
end
