#!/bin/tcsh
#set echo
set verbose
set block=$1
foreach ordinal (`seq -s" " -f"%06.0f" 1 $block 1200`)
@ newordinal = ( $ordinal / $block + 1001 )
set newordinal=`echo $newordinal | cut -c 2-`
echo $ordinal $newordinal
set origfile="JLJ735_${ordinal}.cbf"
set newfile="JLJ735by${block}s_1_${newordinal}.cbf"
head -n20 $origfile > /tmp/header_${user}_by${block}s$$
set angleincr=`grep "Angle_increment" /tmp/header_${user}_by${block}s$$| cut -d' ' -f3`
set angleincrunits=`grep "Angle_increment" /tmp/header_${user}_by${block}s$$| cut -d' ' -f4`
set newangleincr=`echo "${angleincr} * ${block}" | bc`
set newangleincr="${newangleincr} ${angleincrunits}"
set exposuretime=`grep "Exposure_time" /tmp/header_${user}_by${block}s$$| cut -d' ' -f3` 
set exposuretimeunits=`grep "Exposure_time" /tmp/header_${user}_by${block}s$$| cut -d' ' -f4` 
set newexposuretime=`echo "${exposuretime} * ${block}" | bc`
set newexposuretime="${newexposuretime} ${exposuretimeunits}"
set exposureperiod=`grep "Exposure_period" /tmp/header_${user}_by${block}s$$| cut -d' ' -f3` 
set exposureperiodunits=`grep "Exposure_period" /tmp/header_${user}_by${block}s$$| cut -d' ' -f4` 
set newexposureperiod=`echo "${exposureperiod} * ${block}" | bc`
set newexposureperiod="${newexposureperiod} ${exposureperiodunits}"
#echo angleincr newangleincr: $angleincr $newangleincr 
#echo exposuretime newexposuretime: $exposuretime $newexposuretime
#echo exposureperiod newexposureperiod: $exposureperiod $newexposureperiod 
tail -n+9 $newfile > /tmp/tail_${user}_by${block}s$$
cat /tmp/header_${user}_by${block}s$$ | sed "/Angle_increment/ s/^.*/# Angle_increment ${newangleincr}/" \
                                      | sed "/Exposure_time/ s/^.*/# Exposure_time ${newexposuretime}/" \
                                      | sed "/Exposure_period/ s/^.*/# Exposure_period ${newexposureperiod}/" >/tmp/newheader_${user}_by${block}s$$
cat /tmp/newheader_${user}_by${block}s$$ /tmp/tail_${user}_by${block}s$$ > JLJ735by${block}s_1_rev_${newordinal}.cbf
rm /tmp/newheader_${user}_by${block}s$$ /tmp/tail_${user}_by${block}s$$ /tmp/header_${user}_by${block}s$$ 
end
