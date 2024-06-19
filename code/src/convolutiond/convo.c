#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <time.h>

#define MAX(X, Y) (((X) < (Y)) ? (Y) : (X))
#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))

double* convolve(double h[], double x[], int lenH, int lenX, int* lenY);

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
    for(int i=0;i<20;i++) convolve(h, x, N, N, &lenY);
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
  double *y = convolve(h, x, len, len, &lenY);
  write_output(y, "convooutput.txt", len);
  for (int j = 0; j<5; j++) {running_time(h, x, len);}
  free(y);
  return 0;
}