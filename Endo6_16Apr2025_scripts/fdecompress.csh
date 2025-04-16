#!/bin/tcsh
mkdir -p fdecomp
foreach file (fcomp/*.H)
echo $file
set fname=${file:t}

set nfile=`echo $fname | sed s/.H//`
echo $fname fdecomp/$nfile
fdecompress $file 
mv fcomp/$fname fdecomp/$nfile
end
