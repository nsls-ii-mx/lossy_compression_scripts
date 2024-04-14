#!/bin/tcsh
mkdir -p u2
foreach file (CBFs/*.cbf)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_/_u2encI_/"`.cbf
echo u2/$nfile
cif2cbf -en -cI -I-2 -i $file -o u2/$nfile
end
