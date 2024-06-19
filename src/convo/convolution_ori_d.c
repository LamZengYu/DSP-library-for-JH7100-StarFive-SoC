#include "../../include/dsp.h"

double* convolve(double h[], double x[], int lenH, int lenX, int* lenY)
{
  int nconv = lenH+lenX-1;
  (*lenY) = nconv;
  double *y = (double*) calloc(nconv, sizeof(double));

  for (int i=0; i<nconv; i++)
  {
    int x_start = MAX(0,i-lenH+1); 
    int h_start = MIN(i,lenH-1);
    int x_end   = MIN(i+1,lenX);

    for(int j=x_start; j<x_end; j++)
    {
      y[i] += h[h_start]*x[j];
      h_start--;
    }
  }
  return y;
}
