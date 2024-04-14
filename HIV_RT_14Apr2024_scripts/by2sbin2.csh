#!/bin/tcsh
mkdir -p by2sbin2
foreach file (by2s/*.cbf)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r|sed "s/_/_by2sbin2encb_/"`.cbf
echo by2sbin2/$nfile
cif2cbf -en -cb --bin 2,1030,514,1,10,37,0 -i $file -o by2sbin2/$nfile
ex by2sbin2/$nfile << 'eof_eof_eof'
1,20g/Pixel_size/s/75/150/g
1,20g/Beam_xy/s/1610.00/805.00/
1,20g/Beam_xy/s/1570.90/785.45/
w
q
'eof_eof_eof'
end
