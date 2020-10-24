#!/bin/bash
. ../../../load_env.bash
shopt -s expand_aliases

xi fdisk

spl os_startup.spl
xi load --os os_startup.xsm
rm os_startup.xsm

spl BOOT_MODULE.spl
xi load --module 7 BOOT_MODULE.xsm
rm BOOT_MODULE.xsm

spl haltprog.spl
xi load --int=10 haltprog.xsm
xi load --exhandler haltprog.xsm
rm haltprog.xsm

expl even100.expl
xi load --init even100.xsm
rm even100.xsm

expl odd100.expl
xi load --exec odd100.xsm
rm odd100.xsm

spl int7.spl
xi load --int=7 int7.xsm
rm int7.xsm

spl timer.spl
xi load --int=timer timer.xsm
rm timer.xsm

xi load --library $OS_LAB_PROJ_DIR/myexpos/expl/library.lib

expl idle.expl 
xi load --idle idle.xsm
rm idle.xsm

Xsm --debug
