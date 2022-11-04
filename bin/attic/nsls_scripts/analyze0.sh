#!/bin/bash

# -->  This file is set to reduce the data using all only the good data, and the same number of before/after buffers  <--

# rerun
./analyze.sh "x007 x008" "x005 x006 x013" wtTEK010c060.iq 0 "x007 06 03 04" "x008 02 04" "x006 06" "x013 01 02 03 04 06 09 15 16 18 19 20 21 22"
./analyze.sh "x009 x010 x011" "x005 x006 x013" wtTEK010c030.iq 0 "x009 04 01" "x010 05 06" "x011 03 04 09 10" "x006 06" "x013 01 02 03 04 06 09 15 16 18 19 20 21 22"
./analyze.sh "x012" "x005 x006 x013" wtTEK010c015.iq 0 "x012 24 25 30 31 33 34 36 37 38 39 40 41 42 43 44 45 46 47 48" "x006 06" "x013 01 02 03 04 06 09 15 16 18 19 20 21 22"

# no neg
./analyze.sh "x018" "x016 x017 x024" gH4TEK010c060.iq 0 "x018 01 02 03 04"  "x017 08" "x024 01 21 20 22 23 24 25 26 27 28" 
./analyze.sh "x019" "x016 x017 x024" gH4TEK010c030.iq 0 "x019 21 22"  "x017 08" "x024 01 21 20 22 23 24 25 26 27 28" 
./analyze.sh "x020 x021 x022 x023" "x016 x017 x024" gH4TEK010c015.iq 0 "x020 09 10 15 16 01 04" "x021 01 15 16 20 21 22 23 26" "x022 09 10 15" "x017 08" "x024 01 21 20 22 23 24 25 26 27 28" 
#Rg results 
#x016 x017 x024 x025 buffers: 123.7 I think this is too many after buffers (it changes the Rg)
#x017 x024 buffers: 129.0
#x016 x017 x024 buffers: 129.1

# no neg
./analyze.sh "x026" "x025 x030" gH3TEK010c060.iq 0 "x025 24 31" "x030 11 16"
./analyze.sh "x027" "x025 x030" gH3TEK010c030.iq 0 "x025 24 31" "x030 11 16"
./analyze.sh "x028" "x025 x030" gH3TEK010c015.iq 0 "x028 45 44 41 40 39 34 33" "x025 24 31" "x030 11 16"

# no neg
./analyze.sh "x031" "x030 x034" mwtTEK010c048.iq 0 "x030 11 16 27 28 29 30 31 32 33 34 35 36" #Rg 128.8
./analyze.sh "x032" "x030 x034" mwtTEK010c024.iq 0 "x030 11 16 27 28 29 30 31 32 33 34 35 36" #Rg 134.2
./analyze.sh "x033" "x030 x034" mwtTEK010c012.iq 0 "x033 18 19 41" "x030 11 16 27 28 29 30 31 32 33 34 35 36" #Rg 139.5

# ./analyze.sh "x037" "x036 x038 x039" poorlyLabeled.iq 0 "x036 01"  #this was not well labeled

./analyze.sh "x041" "x040 x048" gH3TEK100c046.iq 0 "x048 07 05 06 13 16" "x040 20 21 22 23 24"
./analyze.sh "x042" "x040 x048" gH3TEK100c023.iq 0 "x048 07 05 06 13 16" "x040 20 21 22 23 24"
./analyze.sh "x043 x044" "x040 x048" gH3TEK100c011.iq 0 "x043 21 22 27" "x044 01" "x048 07 05 06 13 16" "x040 20 21 22 23 24"

# rerun
./analyze.sh "x045" "x040 x048" gH4TEK100c046.iq 0 "x045 11" "x048 07 05 06 13 16 21" "x040 20 21 22 23 24"
./analyze.sh "x046" "x040 x048" gH4TEK100c023.iq 0 "x046 11 14" "x048 07 05 06 13 16 21" "x040 20 21 22 23 24"
./analyze.sh "x047" "x040 x048" gH4TEK100c011.iq 0 "x047 05 11 14" "x048 07 05 06 13 16 21" "x040 20 21 22 23 24"

# rerun
./analyze.sh "x050" "x049 x054" mwtTEK100c032.iq 0 "x054 01 02 13 22 24" "x049 01 06 18 21 24" "x050 11" #Rg 139.7
./analyze.sh "x051" "x049 x054" mwtTEK100c016.iq 0 "x054 01 02 13 22 24" "x049 01 06 18 21 24" "x051 05 08 11 14" #Rg 131.6
./analyze.sh "x052" "x049 x054" mwtTEK100c008.iq 0 "x054 01 02 13 22 24" "x049 01 06 18 21 24" "x052 05 08 11 14 39 40 44 45 46 47" #Rg 126.1 

# rerun
./analyze.sh "x055" "x054 x057" wtTEK100c019.iq 0 "x054 01 02 13 22 24" "x057 06 07 15 21 24" "x055 24" #Rg 120.47
./analyze.sh "x056" "x054 x057" wtTEK100c010.iq 0 "x054 01 02 13 22 24" "x057 06 07 15 21 24" #Rg 113.6

# rerun
./analyze.sh "x059 x060" "x058" mwtMg02c031.iq 0 "x059 06 07 11 13" "x058 06 07"
./analyze.sh "x061" "x058" mwtMg02c015.iq 0 "x058 06 07"

# no neg
./analyze.sh "x063" "x062" mwtMg04c031.iq 0 "x063 05 06 07 08 11 12" #Rg 138.3
./analyze.sh "x064" "x062" mwtMg04c015.iq 0 #Rg 141.5


./analyze.sh "x073 x074" "x068 x069" D2Osample.iq 0 "x073 01" "x068 01" "x069 02" #Rg 149.0