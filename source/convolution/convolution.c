#include <stdlib.h>
#include <stdio.h>
#include <math.h>

// helper functions to get the min and max of two numbers
#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))
#define MAX(X, Y) (((X) < (Y)) ? (Y) : (X))

float* convolve(float h[], float x[], int lenH, int lenX, int* lenY);

float* convolve(float h[], float x[], int lenH, int lenX, int* lenY)
{
  int nconv = lenH+lenX-1;
  (*lenY) = nconv;
  int i,j,h_start,x_start,x_end;

  float *y = (float*) calloc(nconv, sizeof(float));

  for (i=0; i<nconv; i++)
  {
    x_start = MAX(0,i-lenH+1);
    x_end   = MIN(i+1,lenX);
    h_start = MIN(i,lenH-1);
    for(j=x_start; j<x_end; j++)
    {
      y[i] += h[h_start--]*x[j];
    }
  }
  return y;
}

int main(int argc, char *argv[])
{
  float h[] = { 1.0, 1.0, 1.0, 1.0, 1.0 };
  float x[] = { 1.0, 1.0, 1.0, 1.0, 1.0 };
  int lenY;
  float *y = convolve(h,x,5,5,&lenY);
  for(int i=0;i<lenY;i++) {
    printf("%0.f ",y[i]);
  }
  puts("");
  free(y);
  return 0;
}
