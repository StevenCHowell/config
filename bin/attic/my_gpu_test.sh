#!/bin/bash
ITERS=273600

export LD_LIBRARY_PATH='/root' && oem_binom --oemrepeat=$ITERS --oemcard=0 && oem_mtxmul --oemrepeat=$ITERS --oemcard=0 && export LD_LIBRARY_PATH='/root/oem_dgemm' && /root/oem_dgemm/oem_dgemm 0 10 0 &
export LD_LIBRARY_PATH='/root' && oem_binom --oemrepeat=$ITERS --oemcard=1 && oem_mtxmul --oemrepeat=$ITERS --oemcard=1 && export LD_LIBRARY_PATH='/root/oem_dgemm' && /root/oem_dgemm/oem_dgemm 0 10 1 &
export LD_LIBRARY_PATH='/root' && oem_binom --oemrepeat=$ITERS --oemcard=2 && oem_mtxmul --oemrepeat=$ITERS --oemcard=2 && export LD_LIBRARY_PATH='/root/oem_dgemm' && /root/oem_dgemm/oem_dgemm 0 10 2 &
export LD_LIBRARY_PATH='/root' && oem_binom --oemrepeat=$ITERS --oemcard=3 && oem_mtxmul --oemrepeat=$ITERS --oemcard=3 && export LD_LIBRARY_PATH='/root/oem_dgemm' && /root/oem_dgemm/oem_dgemm 0 10 3 &
wait

#
#
#
#

# export LD_LIBRARY_PATH='/root/oem_dgemm'







#oem_mtxmul.sh - run test 1000 times on device 0.
#oem_dgemm.sh - run at the slowest speed, 25 times on card 0
#oem_testkit.sh - run all the three above executables at one go.
#oem_bandwidthTest.sh - run test 1000 times on device 0.


