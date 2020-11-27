#!/bin/bash

cd src 2>&1 >&3 | tee -a $LOGFILE && leave 1
make libscotch esmumps 2>&1 >&3 | tee -a $LOGFILE && leave 1				
make prefix=$prefix/${dirinstall["$index"]} install 2>&1 >&3 | tee -a $LOGFILE && leave 1
