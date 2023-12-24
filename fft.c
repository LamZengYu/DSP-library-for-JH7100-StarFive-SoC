#include <stdio.h>
#include <math.h>
#include <time.h>

void dft(int xn[], float Xr[], float Xi[], const int N, const int K);
void idft(int xn[], float Xr[], float Xi[], const int N, const int K);
void fft(float data_re[], float data_im[],const int N);

// Function to calculate the DFT (xn input, sequence length N, number of points K)
void dft(int Xn[], float Xr[], float Xi[], const int N, const int K)
{
    int k, n;
 
    for (k = 0; k < K; k++) {
        Xr[k] = 0;
        Xi[k] = 0;
        for (n = 0; n < N; n++) {
            Xr[k] = (Xr[k] + Xn[n] * cos(2 * 3.141592 * k * n / N));
            Xi[k] = (Xi[k] - Xn[n] * sin(2 * 3.141592 * k * n / N));
        }
    }
}

// Function to calculate the Inverse DFT (Xr and Xi input, sequence length N, number of points K)
void idft(int Xn[], float Xr[], float Xi[], const int N, const int K) 
{
  int k, n = 0;
 
  for (n = 0; n < K; n++) {
    Xn[n] = 0;
    for (k = 0; k < K; k++) {
      int theta = (2 * 3.141592 * k * n) / K;
      Xn[n] = Xn[n] + Xr[k] * cos(theta) + Xi[k] * sin(theta);
    }
    Xn[n] = Xn[n] / N;
  }
}

void fft(float data_re[], float data_im[], const int N)
{
  unsigned int target = 0;
  for(unsigned int position=0; position<N; position++)
  {
    if(target>position) {
      const float temp_re = data_re[target];
      const float temp_im = data_im[target];
      data_re[target] = data_re[position];
      data_im[target] = data_im[position];
      data_re[position] = temp_re;
      data_im[position] = temp_im;
    }
    unsigned int mask = N;
    while(target & (mask >>=1))
      target &= ~mask;
    target |= mask;
  }

  const float pi = -3.14159265358979323846;
  
  for(unsigned int step=1; step<N; step <<=1)
  {
    const unsigned int jump = step << 1;
    const float step_d = (float) step;
    float twiddle_re = 1.0;
    float twiddle_im = 0.0;
    for(unsigned int group=0; group<step; group++)
    {
      for(unsigned int pair=group; pair<N; pair+=jump)
      {
        const unsigned int match = pair + step;
        const float product_re = twiddle_re*data_re[match]-twiddle_im*data_im[match];
        const float product_im = twiddle_im*data_re[match]+twiddle_re*data_im[match];
        data_re[match] = data_re[pair]-product_re;
        data_im[match] = data_im[pair]-product_im;
        data_re[pair] += product_re;
        data_im[pair] += product_im;
      }
      
      if(group+1 == step)
      {
        continue;
      }

      float angle = pi*((float) group+1)/step_d;
      twiddle_re = cos(angle);
      twiddle_im = sin(angle);
    }
  }
}

int main(int argc,  char **argv)
{

  int i; // loop iterator
  clock_t start,  stop;
  double cpu_time_used;

  //functionality test for array length of 8

  //For DFT
  int dftXn[8] = {1.0,  2.0,  3.0,  4.0,  5.0,  6.0,  7.0,  8.0};
  float dftXr[8];
  float dftXi[8];

  dft(dftXn, dftXr, dftXi, 8, 8);

  printf("DFT output:\n");
  for(i=0;i<8;i++)
  {
    printf("re = %f im = %f \n",dftXr[i],dftXi[i]); 
  }
  printf("\n");
  //For IDFT
  float idftXr[8] = {1.0,  2.0,  3.0,  4.0,  5.0,  6.0,  7.0,  8.0};
  float idftXi[8] = {1.0,  2.0,  3.0,  4.0,  5.0,  6.0,  7.0,  8.0};
  int idftXn[8];

  idft(idftXn, idftXr, idftXi, 8, 8);

  printf("IDFT output:\n");
  for(i=0;i<8;i++)
  {
    printf("x[%d] = %d \n",i, idftXn[i]); 
  }
  printf("\n");
  //For FFT
  float data_re[8] = {1.0,  2.0,  3.0,  4.0,  5.0,  6.0,  7.0,  8.0};
  float data_im[8] = {1.0,  2.0,  3.0,  4.0,  5.0,  6.0,  7.0,  8.0};

  fft(data_re, data_im, 8);

  printf("FFT output:\n");
  for(i=0;i<8;i++)
  {
    printf("re = %f im = %f \n",data_re[i],data_im[i]); 
  }
  printf("\n");
  //test for fft running time (N = 128)
  float data1_re[128];
  float data1_im[128];
  start = clock();
  for(i=0;i<100000;i++) fft(data1_re, data1_im, 128);
  stop = clock();
  cpu_time_used = ((double) (stop - start)) / CLOCKS_PER_SEC;
  printf("Average time per fft %fms", cpu_time_used/1000);
}
