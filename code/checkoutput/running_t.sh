#!/bin/bash

cd ../src/fft
echo "Running FFT (original)"
./exeori
echo "Running FFT (inlining)"
./exeinl
echo "Running FFT (rearranging)"
./exearr
echo "Running FFT (loop unrolling)"
./exeunr
echo "Running FFT (GCC -o1)"
./exefinalo
echo "Running FFT (GCC -o2)"
./exefinaloo
echo "Running FFT (GCC -o3)"
./exefinal
echo "Running FFT (assembly)"
./exeassem
