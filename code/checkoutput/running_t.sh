#!/bin/bash
ori_dir="../../checkoutput"

echo "" | tee "./running_time.txt"
cd ../src/fft
echo "Running FFT (original)" | tee -a "$ori_dir/running_time.txt"
./exeori | tee -a "$ori_dir/running_time.txt"
echo "Running FFT (inlining)" | tee -a "$ori_dir/running_time.txt"
./exeinl | tee -a "$ori_dir/running_time.txt"
echo "Running FFT (rearranging)" | tee -a "$ori_dir/running_time.txt"
./exearr | tee -a "$ori_dir/running_time.txt"
echo "Running FFT (loop unrolling)" | tee -a "$ori_dir/running_time.txt"
./exeunr | tee -a "$ori_dir/running_time.txt"
echo "Running FFT (GCC -o1)" | tee -a "$ori_dir/running_time.txt"
./exefinalo | tee -a "$ori_dir/running_time.txt"
echo "Running FFT (GCC -o2)" | tee -a "$ori_dir/running_time.txt"
./exefinaloo | tee -a "$ori_dir/running_time.txt"
echo "Running FFT (GCC -o3)" | tee -a "$ori_dir/running_time.txt"
./exefinal | tee -a "$ori_dir/running_time.txt"
echo "Running FFT (assembly)" | tee -a "$ori_dir/running_time.txt"
./exeassem | tee -a "$ori_dir/running_time.txt"

