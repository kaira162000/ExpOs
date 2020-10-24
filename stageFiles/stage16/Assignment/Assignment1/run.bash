#!/bin/bash
. ../../../../load_env.bash
shopt -s expand_aliases

xi fdisk

spl ../../os_startup.spl
xi load --os ../../os_startup.xsm
rm ../../os_startup.xsm

spl ../../BOOT_MODULE.spl
xi load --module 7 ../../BOOT_MODULE.xsm
rm ../../BOOT_MODULE.xsm

spl ../../SCHEDULER.spl
xi load --module 5 ../../SCHEDULER.xsm
rm ../../SCHEDULER.xsm

spl ../../DEVICE_MANAGER.spl
xi load --module 4 ../../DEVICE_MANAGER.xsm
rm ../../DEVICE_MANAGER.xsm

spl ../../RESOURCE_MANAGER.spl
xi load --module 0 ../../RESOURCE_MANAGER.xsm
rm ../../RESOURCE_MANAGER.xsm

spl ../../haltprog.spl
xi load --exhandler ../../haltprog.xsm
rm ../../haltprog.xsm

spl ../../CONSOLE_INT.spl
xi load --int=console ../../CONSOLE_INT.xsm
rm ../../CONSOLE_INT.xsm

spl ../../int10.spl
xi load --int=10 ../../int10.xsm
rm ../../int10.xsm

spl ../../int7.spl
xi load --int=7 ../../int7.xsm
rm ../../int7.xsm

spl ../../int6.spl
xi load --int=6 ../../int6.xsm
rm ../../int6.xsm

spl ../../timer.spl
xi load --int=timer ../../timer.xsm
rm ../../timer.xsm

xi load --library $OS_LAB_PROJ_DIR/myexpos/expl/library.lib

expl ../../idle.expl 
xi load --idle ../../idle.xsm
rm ../../idle.xsm

expl bubbleSort.expl
xi load --init bubbleSort.xsm
rm bubbleSort.xsm

Xsm --debug --timer 1024
