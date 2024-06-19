#include "../../include/dsp.h"

float* correlation(float h[], float x[], int lenH, int lenX, int* lenY)
{
  int ncorr = lenH+lenX-1;
  (*lenY) = ncorr;
  float *y = (float*) calloc(ncorr, sizeof(float));

  for (int i=0; i<ncorr; i++)
  {
    int x_start = MAX(0,i-lenH+1);
    int x_end   = MIN(i+1,lenX);
    int h_start = MAX(0,lenH-1-i);

    for(int j=x_start; j<x_end; j++)
    {
      y[i] += h[h_start]*x[j];
      h_start++;
    }
  }
  return y;
}
