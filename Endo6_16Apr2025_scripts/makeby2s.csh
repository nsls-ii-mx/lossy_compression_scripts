#!/bin/tcsh
set verbose
mkdir -p by2s
cd u2encb
echo "NAME_TEMPLATE_OF_DATA_FRAMES= as_cbf_????.cbf" > MERGE2CBF.INP
echo " DATA_RANGE= 1 1200" >> MERGE2CBF.INP
echo " NAME_TEMPLATE_OF_OUTPUT_FRAMES=Endo6_23AA_2v_502_by2s__00????.cbf" >> MERGE2CBF.INP
echo " NUMBER_OF_DATA_FRAMES_COVERED_BY_EACH_OUTPUT_FRAME= 2 " >> MERGE2CBF.INP
merge2cbf
foreach file (Endo6_23AA_2v_502_by2s__00????.cbf)
  set nfile = $file
  set fileno = `echo $file | sed "s/^.*__//" | sed "s/.cbf//"`
  @ nfileno = ( ${fileno} * 2 - 1 + 10000 )
  set nfileno = `echo ${nfileno}| sed "s/^1//"` 
  echo $fileno $nfileno
  set oldfile="as_cbf_${nfileno}.cbf"
  echo $oldfile
  rm -rf xhead${fileno}
  cat ${oldfile}|head -n 35  > xhead${fileno}
  #cat xhead${fileno}
  cat ${file} | tail -n +9  > xtail${fileno}
  cat xhead${fileno}| sed "1,35s/^data_as_cbf/data_Endo6_23AA_2v_502_by2s__${fileno}/" |\
  sed "1,35s/^# Angle_increment 0.10/# Angle_increment 0.20/"|\
  sed "1,35s/^# Exposure_time 0.02/# Exposure_time 0.04/"| \
  sed "1,35s/^# Exposure_period 0.02/# Exposure_period 0.04/" > yhead${fileno}
  cat yhead${fileno} xtail${fileno} > $file
  rm yhead${fileno}
  rm xhead${fileno}
  rm xtail${fileno}
end
mv Endo6_23AA_2v_502_by2s*.cbf ../by2s/
