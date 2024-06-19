#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <time.h>
#include "./include/dsp.h"

void write_output_d(double data[], char filename[], const int length) {
  FILE *output_data;
  output_data = fopen(filename, "w");

  for (int i = 0; i < length; i++) {
    fprintf(output_data, "%f\n", data[i]);
  }

  fclose(output_data);
}

void write_output_f(float data[], char filename[], const int length) {
  FILE *output_data;
  output_data = fopen(filename, "w");

  for (int i = 0; i < length; i++) {
    fprintf(output_data, "%f\n", data[i]);
  }

  fclose(output_data);
}

float* read_input_f() {
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

  float* data = (float*)malloc(linecount * sizeof(float));
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

double* read_input_d() {
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

int main(int argc,  char **argv)
{
  const int len = 1024;
  float data_re_f[len];
  float data_im_f[1024] = {0};
  double data_re_d[len];
  double data_im_d[1024] = {0};
  float x_f[len];
  float h_f[len];
  double x_d[len];
  double h_d[len];
  int lenY1_f,lenY1_d,lenY2_f,lenY2_d;
  float* input_data_f = read_input_f();
  double* input_data_d = read_input_d(); 
  for (int i = 0; i < len; i++) {
    data_re_f[i] = input_data_f[i];
    data_re_d[i] = input_data_d[i];
    x_f[i] = input_data_f[i];
    h_f[i] = input_data_f[i];
    x_d[i] = input_data_d[i];
    h_d[i] = input_data_d[i];
  }
  fft_opt_f(data_re_f,data_im_f,len);
  fft_opt_d(data_re_d,data_im_d,len);
  float *y1_f = convolution_op_f(h_f,x_f,len,len,&lenY1_f);
  double *y1_d = convolution_opt_d(h_d,x_d,len,len,&lenY1_d);
  float *y2_f = correlation_opt_f(h_f,x_f,len,len,&lenY2_f);
  double *y2_d = correlation_opt_d(h_d,x_d,len,len,&lenY2_d);
  
  write_output_f(data_re_f, "./output/fftmagnitude_f.txt", len);
  write_output_f(data_im_f, "./output/fftphase_f.txt", len);
  write_output_d(data_re_d, "./output/fftmagnitude_d.txt", len);
  write_output_d(data_im_d, "./output/fftphase_d.txt", len);
  write_output_f(y1_f, "./output/convooutput_f.txt", len);
  write_output_d(y1_d, "./output/convooutput_d.txt", len);
  write_output_f(y2_f, "./output/correoutput_f.txt", len);
  write_output_d(y2_d, "./output/correoutput_d.txt", len);
}
