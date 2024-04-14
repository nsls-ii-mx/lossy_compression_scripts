#!/bin/tcsh
set verbose
set echo
set PATH=/home/yaya/bin:$PATH
set LD_LIBRARY_PATH=/home/yaya/lib
mkdir -p u2fits
foreach file (u2tif/*.tif)
set ntfile = `echo ${file:t:r}.fit|sed s/u2_/u2fits/`
echo u2fits/$ntfile
./siril_file2fit.bash $file u2fits/$ntfile:r
end
