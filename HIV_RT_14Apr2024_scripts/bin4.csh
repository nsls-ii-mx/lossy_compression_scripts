#!/bin/tcsh
foreach file (CBFs/*.cbf)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_/_bin4encb_/"`.cbf
echo bin4/$nfile
cif2cbf -en -cb --bin 4,1030,514,1,10,37,0 -i $file -o bin4/$nfile
ex bin4/$nfile << 'eof_eof_eof'
1,20g/Pixel_size/s/75/300/g
1,20g/Beam_xy/s/1610.00/402.50/
1,20g/Beam_xy/s/1570.90/392.725/
w
q
'eof_eof_eof'
end
