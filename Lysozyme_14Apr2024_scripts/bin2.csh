#!/bin/tcsh
mkdir -p bin2
foreach file (CBFs/*.cbf)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_/_bin2encb_/"`.cbf
echo bin2/$nfile
cif2cbf -en -cb --bin 2,1030,514,1,10,37,0 -i $file -o bin2/$nfile
ex bin2/$nfile << 'eof_eof_eof'
1,20g/Pixel_size/s/75/150/g
1,20g/Beam_xy/s/1571.00/785.50/
1,20g/Beam_xy/s/1566.80/783.40/
w
q
'eof_eof_eof'
end
