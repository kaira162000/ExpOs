#!/bin/bash
. ../../load_env.bash
shopt -s expand_aliases

xi fdisk

spl bootstrap.spl
xi load --os bootstrap.xsm
rm bootstrap.xsm

spl haltprog.spl
xi load --int=10 haltprog.xsm
xi load --exhandler haltprog.xsm
rm haltprog.xsm

expl numbers.expl
xi load --init numbers.xsm
rm numbers.xsm

spl sample_int7.spl
xi load --int=7 sample_int7.xsm
rm sample_int7.xsm

spl timerInterrupt.spl
xi load --int=timer timerInterrupt.xsm
rm timerInterrupt.xsm

xi load --library $OS_LAB_PROJ_DIR/myexpos/expl/library.lib

expl idleProcess.expl 
xi load --idle idleProcess.xsm
rm idleProcess.xsm

Xsm
