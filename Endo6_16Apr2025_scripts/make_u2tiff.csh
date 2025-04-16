#!/bin/tcsh
set verbose
set echo
set PATH=/home/yaya/bin:$PATH
set LD_LIBRARY_PATH=/home/yaya/lib
mkdir -p u2tiff
foreach file (CBFs_Endo/*.cbf)
set ntfile = `echo ${file:t:r}.tif|sed s/as_cbf/u2tiff/`
echo u2tiff/$ntfile
/home/yaya/bin/cbf2tiff -i$file -ou2tiff/Endo6_23AA_2v_502_$ntfile
end
