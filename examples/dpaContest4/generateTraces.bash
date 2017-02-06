#!/bin/bash

# filename for the simulation
file="$1"

# remove old file with plaintexts
if [ -f inputs.csv ]
then
	rm inputs.csv
fi

# create directories for simulated traces
if [ ! -f traces ]
then
	mkdir traces
fi
if [ ! -f traces_exe ]
then
	mkdir traces_exe
fi


# repeat simulation by calling python script
for (( i=0; i<10; i++ ))
do
    python3 generateInputs.py $i | ../../simulavr/src/simulavr -t traces_exe/trace_exe_`printf "%05d" $i` -P traces/trace`printf "%05d" $i` -d atmega16 -f $file -W 0x20,- -R 0x22,- -T exit
    
done;

