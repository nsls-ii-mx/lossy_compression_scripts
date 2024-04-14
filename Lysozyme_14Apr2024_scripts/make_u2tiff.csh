#!/bin/tcsh
set verbose
set echo
set PATH=/home/yaya/bin:$PATH
set LD_LIBRARY_PATH=/home/yaya/lib
mkdir -p u2tiff
foreach file (u2encI/*.cbf)
set ntfile = `echo ${file:t:r}.tif|sed s/u2encI/u2tiff/`
echo u2tiff/$ntfile
/home/yaya/bin/cbf2tiff -i$file -ou2tiff/$ntfile
end
