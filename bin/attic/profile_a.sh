pstatsName=`echo $1 | sed "s:py:pstats:g"`
/usr/bin/env python -m cProfile -o $pstatsName ${@:1}
#pngName=`echo $1 | sed "s:py:png:g"`
#/usr/bin/env python ~/Copy/code/pylib/jrfonseca/gprof2dot.py -f pstats $pstatsName | dot -Tpng -o $pngName
#rm $pstatsName
#eog $pngName &
