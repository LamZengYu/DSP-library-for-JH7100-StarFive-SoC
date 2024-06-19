#include "../../include/dsp.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

void fft_opt_d(double data_re[], double data_im[], const int N)
{

  //Bit reversal permutation
  unsigned int target = N/2;
  double temp_re, temp_im;
  unsigned int mask = N;
  for(unsigned int position=1; position<N-2; position+=2)
  {
    if(target>position) {
        temp_re = data_re[target];
        temp_im = data_im[target];
        data_re[target] = data_re[position];
        data_im[target] = data_im[position];
        data_re[position] = temp_re;
        data_im[position] = temp_im;
    }

    while(target & (mask >>=1)) {
        target &= ~mask;
    }
        target |= mask;
        mask = N;

    if(target>position+1) {
        temp_re = data_re[target];
        temp_im = data_im[target];
        data_re[target] = data_re[position+1];
        data_im[target] = data_im[position+1];
        data_re[position+1] = temp_re;
        data_im[position+1] = temp_im;
    }

    while(target & (mask >>=1)) {
        target &= ~mask;
    }
        target |= mask;
        mask = N;
  }

  //Butterfly operation computation
  const double pi = -3.14159265358979323846;
  double twiddle_re, twiddle_im, angle;
  for(unsigned int step=1; step<N; step <<=1)
  {
    const unsigned int jump = step << 1;
    twiddle_re = 1.0;
    twiddle_im = 0.0;
    const double step_d = (double) step;
    
    for(unsigned int group=0; group<step; group++)
    {
      angle = pi*((double) group+1)/step_d;
      for(unsigned int pair=group; pair<N; pair+=jump)
      {
        const unsigned int match = pair + step;
        const double product_re = twiddle_re*data_re[match]-twiddle_im*data_im[match];
        const double product_im = twiddle_im*data_re[match]+twiddle_re*data_im[match];
        data_re[match] = data_re[pair]-product_re;
        data_im[match] = data_im[pair]-product_im;
        data_re[pair] += product_re;
        data_im[pair] += product_im;
      }
      
      if(group+1 == step)
      {
        continue;
      }

      twiddle_re = cos(angle);
      twiddle_im = sin(angle);    
    }
  }
}
