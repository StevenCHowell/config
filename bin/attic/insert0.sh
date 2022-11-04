#!/bin/bash
# run from the folder containing the data files to be renamed: /home/gwdata/1307NSLSx9
# this replaces the file run number in the file name with a 3-digit version of the number
# example: 
# 017-TEK10-1.30s_SAXS
# is renamed to be
# x017-TEK10-01.30s_SAXS

for filename in x0*-?.30s*
  do newname=`echo $filename | sed 's/[1-9].30s/0&/g'`
     echo changing $filename to $newname;
     mv $filename $newname;
done
#s 
#s for filename in x0*-1*
#s   do newname=`echo $filename | sed 's/\-1\./-01\./g'`;
#s      mv $filename $newname;
#s done
#s 
#s for filename in x0*-2*
#s   do newname=`echo $filename | sed 's/\-2\./-02\./g'`;
#s      mv $filename $newname;
#s done
#s for filename in x0*-3*
#s   do newname=`echo $filename | sed 's/\-3\./-03\./g'`;
#s   mv $filename $newname; 
#s done
#s 
#s for filename in x0*-4*
#s   do newname=`echo $filename | sed 's/\-4\./-04\./g'`;
#s      mv $filename $newname;
#s done
#s for filename in x0*-5*
#s   do newname=`echo $filename | sed 's/\-5\./-05\./g'`;
#s      mv $filename $newname;
#s done
#s 
#s for filename in x0*-6*
#s   do newname=`echo $filename | sed 's/\-6\./-06\./g'`;
#s      mv $filename $newname;
#s done
#s 
#s for filename in x0*-7*
#s   do newname=`echo $filename | sed 's/\-7\./-07\./g'`;
#s      mv $filename $newname;
#s done
#s 
#s for filename in x0*-8*
#s   do newname=`echo $filename | sed 's/\-8\./-08\./g'`;
#s      mv $filename $newname;
#s done
#s 
#s for filename in x0*-9*
#s   do newname=`echo $filename | sed 's/\-9\./-09\./g'`;
#s      mv $filename $newname;
#s done

