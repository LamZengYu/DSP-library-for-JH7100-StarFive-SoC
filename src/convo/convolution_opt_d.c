#include "../../include/dsp.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

double* convolution_opt_d(double h[], double x[], int lenH, int lenX, int* lenY)
{
  const int nconv = lenH+lenX-1;
  (*lenY) = nconv;
  int i,j,h_start,x_start,x_end;
  double *y = (double*) calloc(nconv, sizeof(double));

  y[0] = h[0]*x[0];
  y[1] = h[1]*x[0]+h[0]*x[1];
  y[2] = h[2]*x[0]+h[1]*x[1]+h[0]*x[2];
  y[nconv-1] = h[lenH-1]*x[lenX-1];
  y[nconv-2] = h[lenH-1]*x[lenX-2] + h[lenH-2]*x[lenX-1];
  y[nconv-3] = h[lenH-1]*x[lenX-3]+h[lenH-2]*x[lenX-2]+h[lenH-3]*x[lenX-1];

  for (i=3; i<nconv-3; i++)
  {
    x_start = ((i-lenH+1)>0)?(i-lenH+1):0;
    x_end   = ((i+1)<lenX)?(i+1):lenX;
    h_start = (i<(lenH-1))?i:(lenH-1);

    for(j=x_start; j<x_end; j++)
    {
      y[i] += h[h_start--]*x[j];
    }
  }
  return y;
}
