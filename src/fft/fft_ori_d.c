#include "../../include/dsp.h"

void fft(double data_re[], double data_im[], const int N)
{
  unsigned int target = 0;
  double temp_re, temp_im;

  //Bit reversal
  for(unsigned int position=0; position<N; position++)
  {
    if(target>position) {
      double temp_re = data_re[target];
      double temp_im = data_im[target];
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
  
  //Computation
  unsigned int jump, match;
  double step_d, twiddle_re, twiddle_im, product_re, product_im;

  for(unsigned int step=1; step<N; step <<=1)
  {
    jump = step << 1;
    step_d = (double) step;
    twiddle_re = 1.0;
    twiddle_im = 0.0;
    for(unsigned int group=0; group<step; group++)
    {
      for(unsigned int pair=group; pair<N; pair+=jump)
      {
        int match = pair + step;
        product_re = twiddle_re*data_re[match]-twiddle_im*data_im[match];
        product_im = twiddle_im*data_re[match]+twiddle_re*data_im[match];
        data_re[match] = data_re[pair]-product_re;
        data_im[match] = data_im[pair]-product_im;
        data_re[pair] += product_re;
        data_im[pair] += product_im;
      }
      
      if(group+1 == step)
      {
        continue;
      }

      double angle =  -M_PI*((double) group+1)/step_d;
      twiddle_re = cos(angle);
      twiddle_im = sin(angle);
    }
  }
}
