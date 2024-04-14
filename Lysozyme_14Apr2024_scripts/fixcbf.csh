#!/bin/csh
set verbose
set cbffiles=$1
set bin=$2
set sum=$3
set fixedfiles=${cbffiles}_rev
mkdir -p $fixedfiles
mkdir -p ${fixedfiles}_trash
set origfiles=u2encI
set origfilelist=( ${origfiles}/*.cbf )
foreach file ($cbffiles/*.c??)
  set fileno=`echo ${file:t:r}|sed "s/^.*_00/00/"`
  echo "fileno: "$fileno
  set origfile=$origfilelist[$fileno]
  head -20 ${origfile} > $fixedfiles/head_${file:t:r}.cbf}
  tail -n +26 $file > $fixedfiles/tail_${file:t:r}.cbf}
  cat $fixedfiles/head_${file:t:r}.cbf} $fixedfiles/tail_${file:t:r}.cbf} > $fixedfiles/${file:t:r}.cbf
  mv $fixedfiles/head_${file:t:r}.cbf} ${fixedfiles}_trash
  mv $fixedfiles/tail_${file:t:r}.cbf} ${fixedfiles}_trash
end
