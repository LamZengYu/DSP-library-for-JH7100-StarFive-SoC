#!/bin/bash
ori_dir="../../checkoutput"

cd ../src/fft
echo "Running FFT (original)"
./exeori | tee "$ori_dir/output.txt"
echo "Running FFT (inlining)"
./exeinl | tee "$ori_dir/output.txt"
echo "Running FFT (rearranging)"
./exearr | tee "$ori_dir/output.txt"
echo "Running FFT (loop unrolling)"
./exeunr | tee "$ori_dir/output.txt"
echo "Running FFT (GCC -o1)"
./exefinalo | tee "$ori_dir/output.txt"
echo "Running FFT (GCC -o2)"
./exefinaloo | tee "$ori_dir/output.txt"
echo "Running FFT (GCC -o3)"
./exefinal | tee "$ori_dir/output.txt"
echo "Running FFT (assembly)"
./exeassem | tee "$ori_dir/output.txt"

