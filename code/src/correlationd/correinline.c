#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <time.h>

double* correlation(double h[], double x[], int lenH, int lenX, int* lenY);

double* correlation(double h[], double x[], int lenH, int lenX, int* lenY)
{
  const int ncorr = lenH+lenX-1;
  double *y = (double*) calloc(ncorr, sizeof(double));
  (*lenY) = ncorr;

  y[0] = h[lenH-1]*x[0];
  y[1] = h[lenH-2]*x[0]+h[lenH-1]*x[1];
  y[2] = h[lenH-3]*x[0]+h[lenH-2]*x[1]+h[lenH-1]*x[2];
  y[ncorr-1] = h[0]*x[lenX-1];
  y[ncorr-2] = h[0]*x[lenX-2] + h[1]*x[lenX-1];
  y[ncorr-3] = h[0]*x[lenX-3]+h[1]*x[lenX-2]+h[2]*x[lenX-1];

  for (int i=3; i<(ncorr-3); i++)
  {
    const int x_start = ((i-lenH+1)>0)?(i-lenH+1):0;
    const int x_end   = ((i+1)<lenX)?(i+1):lenX;
    int h_start = (0>(lenH-1-i))?0:(lenH-1-i);

    for(int j=x_start; j<x_end; j++)
    {
      y[i] += h[h_start]*x[j];
      h_start++;
    }
  }

  return y;
}

double* read_input() {
  FILE *input_data;
  char filename[] = "example_input.txt";
  input_data = fopen(filename, "r");
  int linecount = 0;
  char buffer[30];
  while(fgets(buffer, sizeof(buffer), input_data) != NULL) 
	{
    linecount++;
  }
  fclose(input_data);

  double* data = (double*)malloc(linecount * sizeof(double));
  char datastr[30];
  int i = 0;

  input_data = fopen(filename, "r");
  while(fgets(datastr, sizeof(datastr), input_data) != NULL) 
	{
    char *newline_position = strchr(datastr, '\n');
    if (newline_position != NULL) {
        *newline_position = '\0';
    }
    data[i] = atof(datastr);
    i++;
  }
  fclose(input_data);
  return data;
}

void write_output(double data[], char filename[], const int length) {
  FILE *output_data;
  output_data = fopen(filename, "w");

  for (int i = 0; i < length*2-1; i++) {
    fprintf(output_data, "%f\n", data[i]);
  }

  fclose(output_data);
}

void running_time(double h[], double x[], const int N) {
    clock_t start, stop;
    double cpu_time_used;
    int lenY;
    start = clock();
    for(int i=0;i<20;i++) correlation(h, x, N, N, &lenY);
    stop = clock();
    cpu_time_used = ((double) (stop - start)) / CLOCKS_PER_SEC;
    printf("Average time: %fms\n", cpu_time_used*50);
}

int main(int argc, char *argv[])
{
  const int len = 1024;
  double x[len];
  double h[len];
  int lenY;
  double* input_data = read_input(); 
  for (int i = 0; i < len; i++) {
        x[i] = input_data[i];
        h[i] = input_data[i];
  }
  double *y = correlation(h, x, len, len, &lenY);
  write_output(y, "correoutput.txt", len);
  for (int j = 0; j<5; j++) {running_time(h, x, len);}
  free(y);
  return 0;
}
