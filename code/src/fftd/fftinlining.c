#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>

void fft(double data_re[], double data_im[],const int N);
double* read_input();
void write_output(double data[], char filename[], const int length);
void running_time(double data_re[], double data_im[], const int N);

void fft(double data_re[], double data_im[], const int N)
{

  //Bit reversal permutation
  unsigned int target = 0;
  unsigned int mask;
  for(unsigned int position=0; position<N; position++)
  {
    if(target>position) {
        const double temp_re = data_re[target];
        const double temp_im = data_im[target];
        data_re[target] = data_re[position];
        data_im[target] = data_im[position];
        data_re[position] = temp_re;
        data_im[position] = temp_im;
    }
    mask = N;
    while(target & (mask >>=1))
        target &= ~mask;
        target |= mask;
  }

  //Butterfly operation computation
  const double pi = -3.14159265358979323846;
  double twiddle_re, twiddle_im, angle;
  for(unsigned int step=1; step<N; step <<=1)
  {
    const unsigned int jump = step << 1;
    const double step_d = (double) step;
    twiddle_re = 1.0;
    twiddle_im = 0.0;
    for(unsigned int group=0; group<step; group++)
    {
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

      angle = pi*((double) group+1)/step_d;
      twiddle_re = cos(angle);
      twiddle_im = sin(angle);    
    }
  }
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

  for (int i = 0; i < length; i++) {
    fprintf(output_data, "%f\n", data[i]);
  }

  fclose(output_data);
}

void running_time(double data_re[], double data_im[], const int N) {
    clock_t start, stop;
    double cpu_time_used;
    start = clock();
    for(int i=0;i<100;i++) fft(data_re, data_im, N);
    stop = clock();
    cpu_time_used = ((double) (stop - start)) / CLOCKS_PER_SEC;
    printf("Average time: %fms\n", cpu_time_used*10);
}

int main(int argc,  char **argv)
{
  const int fftlength = 1024;
  double data_re[fftlength];
  double data_im[1024] = {0};
  double* input_data = read_input(); 
  for (int i = 0; i < fftlength; i++) {
        data_re[i] = input_data[i];
  }
  fft(data_re,data_im,fftlength);
  write_output(data_re, "fftcmagnitude.txt", 1024);
  write_output(data_im, "fftcphase.txt", 1024);
  for (int j=0; j<5; j++) {running_time(data_re, data_im, fftlength);}
}
