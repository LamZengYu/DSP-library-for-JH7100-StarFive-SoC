#!/bin/bash

echo "Running FFT (original)"
../src/fft/exeori
echo "Running FFT (inlining)"
../src/fft/exeinl
echo "Running FFT (rearranging)"
../src/fft/exearr
echo "Running FFT (loop unrolling)"
../src/fft/exeunr
echo "Running FFT (GCC -o1)"
../src/fft/exefinalo
echo "Running FFT (GCC -o2)"
../src/fft/exefinaloo
echo "Running FFT (GCC -o3)"
../src/fft/exefinal
echo "Running FFT (assembly)"
../src/fft/exeassem
