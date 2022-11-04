#!/bin/bash
# rerun
./analyze.sh "x007 x008" "x005 x006 x013" wtTEK10c060.iq 0 "x007 06" "x008 01" "x013 15 16 20 21 22" "x013 13 14 15 16 17 18 19 20 21 22 23 24"
./analyze.sh "x009 x010 x011" "x005 x006 x013" wtTEK10c030.iq 0 "x013 15 16 20 21 22" "x011 03 04 09 10 11 12" "x013 13 14 15 16 17 18 19 20 21 22 23 24" #Rg 134.3
#./analyze.sh "x012" "x005 x006 x013" wtTEK10c015sp.iq 10 "x013 15 16 20 21 22" "x012 24 25 30 31 33 34 38 39 40 41 44 45 46 47 48" "x013 13 14 15 16 17 18 19 20 21 22 23 24" #Rg 138.4
./analyze.sh "x012" "x005 x006 x013" wtTEK10c015sn.iq -1.5 "x013 15 16 20 21 22" "x012 24 25 30 31 33 34 38 39 40 41 44 45 46 47 48" "x013 13 14 15 16 17 18 19 20 21 22 23 24" #Rg 138.4 removed x013 13-24 so there were the same number of before and after buffers

# no neg
./analyze.sh "x018" "x016 x017 x024" gH4TEK10c060.iq 0 "x018 01 02 03 04"  "x024 19 20 21 22 23 24 25 26 27 28" #Rg 125.9
./analyze.sh "x019" "x016 x017 x024" gH4TEK10c030.iq 0 "x019 21 22"  "x024 19 20 21 22 23 24 25 26 27 28" #Rg 129.1
./analyze.sh "x020 x021 x022 x023" "x016 x017 x024" gH4TEK10c015.iq 0 "x020 09 10 15 16" "x021 01 15 16 20 21 22 23 26" "x022 09 10 15" "x024 19 20 21 22 23 24 25 26 27 28" #Rg 129.1
#x016 x017 x024 x025 buffers: 123.7 I think this is too many after buffers (it changes the Rg)
#x017 x024 buffers: 129.0
#x016 x017 x024 buffers: 129.1

# no neg
./analyze.sh "x026" "x025 x030" gH3TEK10c060.iq 0 #Rg 135.6
./analyze.sh "x027" "x025 x030" gH3TEK10c030.iq 0 #Rg 137.5
./analyze.sh "x028 x029" "x025 x030" gH3TEK10c015.iq 0 "x028 45 44 41 40 39 34 33" "x029 01" #Rg 130.6   x025 and x030 both have 36 files

# no neg
./analyze.sh "x031" "x030 x034" mwtTEK10c048.iq 0 "x030 25 26 27 28 29 30 31 32 33 34 35 36" #Rg 128.8
./analyze.sh "x032" "x030 x034" mwtTEK10c024.iq 0 "x030 25 26 27 28 29 30 31 32 33 34 35 36" #Rg 134.2
./analyze.sh "x033" "x030 x034" mwtTEK10c012.iq 0 "x030 25 26 27 28 29 30 31 32 33 34 35 36" #Rg 139.5

# ./analyze.sh "x037" "x036 x038 x039" poorlyLabeled.iq 0 "x036 01"  #this was not well labeled

# rerun
./analyze.sh "x041" "x040 x048" gH3TEK100c046.iq 0 "x048 07" "x040 24" #Rg 151.7
./analyze.sh "x042" "x040 x048" gH3TEK100c023.iq 0 "x048 07" "x040 24" #Rg 148.4
#./analyze.sh "x043 x044" "x040 x048" gH3TEK100c011sp.iq 10 "x048 07" "x043 22 27" #Rg 137.6
./analyze.sh "x043 x044" "x040 x048" gH3TEK100c011sn.iq -1.9 "x048 07" "x040 24" "x043 22 27" #Rg 137.6  removed x040 24 to have the same # buffs before and after

# rerun
./analyze.sh "x045" "x040 x048" gH4TEK100c046.iq 0 "x048 07" "x040 24"  #Rg 124.1
#./analyze.sh "x046" "x040 x048" gH4TEK100c023sp.iq 35 "x048 07" "x040 24" "x046 01 07" #Rg 137.0
./analyze.sh "x046" "x040 x048" gH4TEK100c023sn.iq -4 "x048 07" "x040 24" "x046 01 07" #Rg 137.0
#./analyze.sh "x047" "x040 x048" gH4TEK100c011sp.iq 70 "x048 07" "x040 24" "x047 07" #Rg 131.0
./analyze.sh "x047" "x040 x048" gH4TEK100c011sn.iq -20 "x048 07" "x040 24" "x047 07" #Rg 131.0

# rerun
./analyze.sh "x050" "x049 x054" mwtTEK100c032.iq 0 "x054 01 02 03 04" "x049 24 23 22 21" #Rg 139.7
./analyze.sh "x051" "x049 x054" mwtTEK100c016.iq 0 "x054 01 02 03 04" "x049 24 23 22 21"  "x051 05 11 14" #Rg 131.6
#./analyze.sh "x052" "x049 x054" mwtTEK100c008sp.iq 4  "x054 01 02 03 04"  "x049 24 23 22 21" "x052 05 08 11 14 27 28 33 34 40 45 46" #Rg 126.1 
./analyze.sh "x052" "x049 x054" mwtTEK100c008sn.iq -.7  "x054 01 02 03 04"  "x049 24 23 22 21" "x052 05 08 11 14 27 28 33 34 40 45 46" #Rg 126.1 
# "x049 24 23 22 21" removed to have the same number of before and after buffers

# rerun
#./analyze.sh "x055" "x054 x057" wtTEK100c019sp.iq 8 "x055 15 16 09 21 22" "x054 01 02 03 04" "x057 24 23 22 21" #Rg 120.47
./analyze.sh "x055" "x054 x057" wtTEK100c019sn.iq -.9 "x055 15 16 09 21 22" "x054 01 02 03 04" "x057 24 23 22 21" #Rg 120.47

#./analyze.sh "x056" "x054 x057" wtTEK100c010sp.iq 12 "x054 01 02 03 04" "x056 39 40 46" "x057 24 23 22 21" #Rg 113.6
./analyze.sh "x056" "x054 x057" wtTEK100c010sn.iq -2.2 "x054 01 02 03 04" "x056 39 40 46" "x057 24 23 22 21" #Rg 113.6
#  "x057 24 23 22 21" removed to have the same number of before and after buffers

# rerun
#./analyze.sh "x059 x060" "x058" mwtTEK100Mg02c031sp.iq 9 "x059 01 02 03 04 05 06 07 08 09 10 11 14 15 16 17 21 22" "x060 03 04 09 10 15 16 21 22"  #Rg 155.3
./analyze.sh "x059 x060" "x058" mwtTEK100Mg02c031sn.iq -1.8 "x059 01 02 03 04 05 06 07 08 09 10 11 14 15 16 17 21 22" "x060 03 04 09 10 15 16 21 22"  #Rg 155.3
#./analyze.sh "x061" "x058" mwtTEK100Mg02c015sp.iq 12 "x061 03 04 09 10 33 34" #Rg 140.6
./analyze.sh "x061" "x058" mwtTEK100Mg02c015sn.iq -1.4 "x061 03 04 09 10 33 34" #Rg 140.6

# no neg
./analyze.sh "x063" "x062" mwtTEK100Mg04c031.iq 0 #Rg 138.3
./analyze.sh "x064" "x062" mwtTEK100Mg04c015.iq 0 #Rg 141.5

./analyze.sh "x071 x073 x074" "x068 x069 x070" D2Osample.iq 0 "x071 02" #Rg 149.0