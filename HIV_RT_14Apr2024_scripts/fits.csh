#!/bin/tcsh
foreach file (u2tif/*.tif)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_u2/_/"`.fits
echo fits/$nfile
convert  $file  fits/$nfile
end
