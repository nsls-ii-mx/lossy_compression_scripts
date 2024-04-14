#!/bin/tcsh
#set verbose
if ( "${1}xx" == "--helpxx" ) then
  echo "bingen.csh cbfs binning nx ny bcentx bcenty"
  echo "  files are written to cbfs_BIN_binning "
  echo "  defaults:  cbfs     CBFs, binning     1 "
  echo "             nx       3110, ny       3269 "
  echo "             bcentx   (nx-1)/2, bcenty   (ny-1)/2 "
  echo " environment variables (default)"
  echo ' $BINGEN_MODULEX (1030), $BINGEN_MODULEY (514), $BINGEN_MODULEZ (0),'
  echo ' $BINGEN_GAPX (10), $BINGEN_GAPY (37), $(BINGEN_GAPZ (0),'
  echo ' $BINGEN_PIXSIZE (75)'
  exit
endif

set CBFs=$1
if ( "${CBFs}xx" == "xx" ) then
  let CBFs="CBFs"
endif

set BIN=$2
if ( "${BIN}xx" == "xx" ) then
  let BIN="1"
endif

set NX=$3
if ( "${NX}xx" == "xx" ) then
  let NX="3110"
endif

set NY=$4
if ( "${NY}xx" == "xx" ) then
  let NY="3269"
endif

set BCENTX=$5
if ( "${NX}xx" == "xx" ) then
  set  BCENTX=`echo ( ( ${NX} - 1 ) / 2 ) bc `
endif

set BCENTY=$6
if ( "${BCENTY}xx" == "xx" ) then
  set BCENTY=`echo ( ( ${NY} - 1 ) / 2 ) | bc `
endif

if ( ! $?BINGEN_PIXSIZE ) then
  set PIXSIZE=75
else
  set PIXSIZE=$BINGEN_PIXSIZE
endif

@ NNX =  ( ( ${NX} + ${BIN} - 2 ) / ${BIN} ) + 1 
@ NNY =  ( ( ${NY} + ${BIN} - 2 ) / ${BIN} ) + 1 
set NBCENTX=`echo "scale = 4; ( ${BCENTX} / ${BIN} )" | bc -l`
set NBCENTY=`echo "scale = 4; ( ${BCENTY} / ${BIN} )" | bc -l`
@ NPIXSIZE = $PIXSIZE * $BIN

echo NNX, NNY = $NNX, $NNY
echo NBCENTX, NBCENTY = $NBCENTX, $NBCENTY


if ( ! $?BINGEN_MODULEX ) then
  set MODULEX=1030
else
  set MODULEX=$BINGEN_MODULEX
endif


if ( ! $?BINGEN_MODULEY ) then
  set MODULEY=514
else
  set MODULEY=$BINGEN_MODULEY
endif

if ( ! $?BINGEN_MODULEZ ) then
  set MODULEZ=1
else
  set MODULEZ=$BINGEN_MODULEZ
endif

if ( ! $?BINGEN_GAPX ) then
  set GAPX=10
else
  set GAPX=$BINGEN_GAPX
endif

if ( ! $?BINGEN_GAPY ) then
  set GAPY=37
else
  set GAPY=$BINGEN_GAPY
endif

if ( ! $?BINGEN_GAPZ ) then
  set GAPZ=0
else
  set GAPZ=$BINGEN_GAPZ
endif

mkdir -p ${CBFs}_BIN_${BIN}
foreach file (${CBFs}/*.cbf)
echo $file
set fname=${file:t}
set nfile=`echo $fname:r}|sed "s/_/_bin${BIN}{encb_/"`.cbf
echo ${CBFs}_BIN_${BIN}/$nfile
cif2cbf -en -cb --bin ${BIN},${MODULEX},${MODULEY},${MODULEZ},${GAPX},${GAPY},${GAPZ} \
  -i $file -o ${CBFs}_BIN_${BIN}/$nfile
ex ${CBFs}_BIN_${BIN}/$nfile << eof_eof_eof
1,20g/^# Pixel_size/d
1
/^# Detector:/
a
# Pixel_size ${NPIXSIZE}e-6 m x ${NPIXSIZE}e-6 m
.
1,20g/Beam_xy/d
1
/^# Detector_distance/
a
# Beam_xy  (${NBCENTX}, ${NBCENTY}) pixels
.
w
q
eof_eof_eof
end
