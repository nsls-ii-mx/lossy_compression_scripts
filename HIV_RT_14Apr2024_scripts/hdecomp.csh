#!/bin/tcsh
mkdir hdecomp2
foreach file (hcomp2/*.H)
echo $file
set fname=${file:t}

set nfile=${fname:r}.fit
echo hdecomp2/$nfile
hdecomp -v -s -o fits < $file > hdecomp2/$nfile
end
