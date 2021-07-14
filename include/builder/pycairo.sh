#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

if [[ "$compiler" == "intel" ]] ; then
	LDSHARED="icc -shared" $pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
else
	$pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
fi	

cp -f $prefix/${dirinstall["$index"]}/lib/python${pythonVersion}/site-packages/cairo/include/* $prefix/${dirinstall["$index"]}/include/python${pythonVersion}/. 2>&1 | tee -a $LOGFILE && leave