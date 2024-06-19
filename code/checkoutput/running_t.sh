#!/bin/bash
ori_dir="../../checkoutput"

cd ../src/fft
echo "Running FFT (original)"
./exeori | tee -a "$ori_dir/output.txt"
echo "Running FFT (inlining)"
./exeinl | tee -a "$ori_dir/output.txt"
echo "Running FFT (rearranging)"
./exearr | tee -a "$ori_dir/output.txt"
echo "Running FFT (loop unrolling)"
./exeunr | tee -a "$ori_dir/output.txt"
echo "Running FFT (GCC -o1)"
./exefinalo | tee -a "$ori_dir/output.txt"
echo "Running FFT (GCC -o2)"
./exefinaloo | tee -a "$ori_dir/output.txt"
echo "Running FFT (GCC -o3)"
./exefinal | tee -a "$ori_dir/output.txt"
echo "Running FFT (assembly)"
./exeassem | tee -a "$ori_dir/output.txt"

