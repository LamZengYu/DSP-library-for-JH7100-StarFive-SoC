#include "../../include/dsp.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

float* correlation(float h[], float x[], int lenH, int lenX, int* lenY)
{
  const int ncorr = lenH+lenX-1;
  (*lenY) = ncorr;
  int i,j,h_start,x_start,x_end;
  float *y = (float*) calloc(ncorr, sizeof(float));

  y[0] = h[lenH-1]*x[0];
  y[1] = h[lenH-2]*x[0]+h[lenH-1]*x[1];
  y[2] = h[lenH-3]*x[0]+h[lenH-2]*x[1]+h[lenH-1]*x[2];
  y[ncorr-1] = h[0]*x[lenX-1];
  y[ncorr-2] = h[0]*x[lenX-2] + h[1]*x[lenX-1];
  y[ncorr-3] = h[0]*x[lenX-3]+h[1]*x[lenX-2]+h[2]*x[lenX-1];

  for (i=3; i<ncorr-3; i++)
  {
    x_start = ((i-lenH+1)>0)?(i-lenH+1):0;
    x_end   = ((i+1)<lenX)?(i+1):lenX;
    h_start = (0>(lenH-1-i))?0:(lenH-1-i);

    for(j=x_start; j<x_end; j++)
    {
      y[i] += h[h_start++]*x[j];
    }
  }
  return y;
}
