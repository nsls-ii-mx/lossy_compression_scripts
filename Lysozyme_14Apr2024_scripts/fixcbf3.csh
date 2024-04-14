#!/bin/csh
set verbose
set cbffiles=$1
set bin=$2
set sum=$3
echo "bin" $bin
echo "sum" $sum
if ( "${bin}xx" == "xx"  ) then
  set bin=1
endif
if ( "${sum}xx" == "xx" ) then
  set sum=1
endif
set fixedfiles=${cbffiles}_rev
mkdir -p $fixedfiles
mkdir -p ${fixedfiles}_trash
set origfiles=u2encI
set origfilelist=( ${origfiles}/*.cbf )
foreach file ($cbffiles/*.c??)
  set ofileno=`echo ${file:t:r}|sed "s/^.*_00/00/"`
  echo "ofileno: "$ofileno
  @ fileno = ( $ofileno * $sum  - $sum + 1 ) 
  set origfile=$origfilelist[$fileno]
  head -20 ${origfile} > $fixedfiles/head_${file:t:r}.cbf
  if ("${sum}xx" == "2xx") then
    echo fixing $fixedfiles/head_${file:t:r}.cbf
    ex $fixedfiles/head_${file:t:r}.cbf << eof_eof_eof
1,20g/^# Exposure_time/s/0.014997/0.029994/
1,20g/^# Exposure_period/s/0.015000/0.030000/
1,20g/^# Angle_increment/s/0.20/0.40/
wq
eof_eof_eof
  endif
  if ("${sum}xx" == "5xx") then
    echo fixing $fixedfiles/head_${file:t:r}.cbf
    ex $fixedfiles/head_${file:t:r}.cbf << eof_eof_eof
1,20g/^# Exposure_time/s/0.014997/0.074985/
1,20g/^# Exposure_period/s/0.015000/0.075000/
1,20g/^# Angle_increment/s/0.20/1.00/
wq
eof_eof_eof
  endif
  if ("${sum}xx" == "10xx") then
    echo fixing $fixedfiles/head_${file:t:r}.cbf
    ex $fixedfiles/head_${file:t:r}.cbf << eof_eof_eof
1,20g/^# Exposure_time/s/0.014997/0.149970/
1,20g/^# Exposure_period/s/0.015000/0.150000/
1,20g/^# Angle_increment/s/0.20/2.00/
wq
eof_eof_eof
  endif
  if ("${bin}xx" == "2xx") then
    echo fixing $fixedfiles/head_${file:t:r}.cbf
    ex $fixedfiles/head_${file:t:r}.cbf << eof_eof_eof
1,20g/^# Pixel_size/s/75/150/g
1,20g/^# Beam_xy/s/1571.00/785.50/
1,20s/^# Beam_xy/s/1566.80/783.40/
wq
eof_eof_eof
  endif
  tail -n +9 $file > $fixedfiles/tail_${file:t:r}.cbf
  cat $fixedfiles/head_${file:t:r}.cbf $fixedfiles/tail_${file:t:r}.cbf > $fixedfiles/${file:t:r}.cbf
  mv $fixedfiles/head_${file:t:r}.cbf ${fixedfiles}_trash
  mv $fixedfiles/tail_${file:t:r}.cbf ${fixedfiles}_trash
end
