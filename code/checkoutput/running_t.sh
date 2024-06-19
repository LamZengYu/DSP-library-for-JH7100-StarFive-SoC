#!/bin/bash
./exeori
./exeinl
./exearr
./exeunr
./exefinalo
./exefinaloo
./exefinal
./exeassem

echo "Running FFT (original)"
../src/fft/exeori | tee -a "./running_time.txt"
echo "Running FFT (inlining)"
../src/fft/exeinl | tee -a "./running_time.txt"
echo "Running FFT (rearranging)"
../src/fft/exearr | tee -a "./running_time.txt"
echo "Running FFT (loop unrolling)"
../src/fft/exeunr | tee -a "./running_time.txt"
echo "Running FFT (GCC -o1)"
../src/fft/exefinalo | tee -a "./running_time.txt"
echo "Running FFT (GCC -o2)"
../src/fft/exefinaloo | tee -a "./running_time.txt"
echo "Running FFT (GCC -o3)"
../src/fft/exefinal | tee -a "./running_time.txt"
echo "Running FFT (assembly)"
../src/fft/exeassem | tee -a "./running_time.txt"
