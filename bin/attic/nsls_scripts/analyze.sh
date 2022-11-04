#!/bin/bash
# example usage: analyze "x007 x008" "x006 x009" outputName.dat .0045 500 "x007 01 02 03" "x009 03 04"
chmod +x *sh

dataPath=/home/gwdata/1307NSLSx9/

#echo entry 1: $1
data=''
for a in $1
  do data=$data`ls $dataPath$a*SAXS | sed 's/_SAXS//g'`' '
  name=`ls $dataPath$a*01.30s_SAXS | sed 's:01.30s_SAXS::g'`
done

buffers=''
for a in $2
  do buffers=$buffers`ls $dataPath$a*SAXS | sed 's/_SAXS//g'`' '
done

echo bad files removed:
for b in "$@"
  do 
  #echo "$b%"
  let i++
  if [ "$i" -gt "4" ]
#  if [ "$i" -gt "5" ]
      then
      #s echo input: $i
      #s echo $b
      #s echo
      j=0
      for c in $b
	do
	#echo "$c"
	let j++
	if [ "$j" -eq "1" ]
	    then
	    filename=`ls $dataPath$c*01.30s_SAXS | sed 's:01.30s_SAXS::g'`
	    #s echo $filename
	    #s echo
	else
	    echo $filename$c.30s | sed "s:$dataPath::g"

	    buffers=`echo $buffers | sed "s:$filename$c.30s::g"`
	    data=`echo $data | sed "s:$filename$c.30s::g"`
	fi
      done
  fi
done
echo

NL='
'

echo data files used: $data | sed "s:$dataPath:\\$NL:g"
echo
echo buffers used: $buffers | sed "s:$dataPath:\\$NL:g"
echo

sTest=show
show=0
for i in $*
do
    if [ "$i" = "$sTest" ]
    then
	show=1
    fi
done
if [ 1 = "$show" ]
then
    echo "showing plots"
    ./proc.py "$data" "$buffers" $4 $3 -show
else 
    echo "hiding plots"
    ./proc.py "$data" "$buffers" $4 $3
fi

avSamName=`echo $3 | sed "s:iq:sam:g"`
avBufName=`echo $3 | sed "s:iq:buf:g"`
pngBufName=`echo $3 | sed "s:.iq:_buf.png:g"`
pngSamName=`echo $3 | sed "s:.iq:_sam.png:g"`
echo averaged sample name: $avSamName
echo averaged buffer name: $avBufName
ls -1t /home/gwdata/1307NSLSx9/*.ddd | head -1 | xargs -I{} \mv -f {} ./$avBufName
ls -1t /home/gwdata/1307NSLSx9/*.ddd | head -1 | xargs -I{} \mv -f {} ./$avSamName
ls -1t /home/gwdata/1307NSLSx9/*.png | head -1 | xargs -I{} \mv -f {} ./figs/$pngBufName
ls -1t /home/gwdata/1307NSLSx9/*.png | head -1 | xargs -I{} \mv -f {} ./figs/$pngSamName

exit 0
