#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

double* read_input(char filename[]) {
  FILE *input_data;
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

double compareoutput (double ref[], double data[], int length) {
    double sum = 0;
    for (int i=0; i<length; i++) {
        sum += fabs(ref[i]-data[i]);
    }
    return sum/(double)length;
}

int main(int argc,  char **argv)
{
  const int fftlength = 1024;
  const int convolength = 2047;
  const int correlength = 2047;

  double fftmag_f[fftlength];
  double fftphase_f[fftlength];
  double convo_f[convolength];
  double corre_f[correlength];
  double fftmag_d[fftlength];
  double fftphase_d[fftlength];
  double convo_d[convolength];
  double corre_d[correlength];
  double fftmag_ref[fftlength];
  double fftphase_ref[fftlength];
  double convo_ref[convolength];
  double corre_ref[correlength];

  double* ffftmag = read_input("ffftmagnitude.txt");
  double* ffftphase = read_input("ffftphase.txt");
  double* fconvo = read_input("fconvooutput.txt");
  double* fcorre = read_input("fcorreoutput.txt");
  double* dfftmag = read_input("dfftmagnitude.txt");
  double* dfftphase = read_input("dfftphase.txt");
  double* dconvo = read_input("dconvooutput.txt");
  double* dcorre = read_input("dcorreoutput.txt");
  double* fftmagr = read_input("fftmagnituderef.txt");
  double* fftphaser = read_input("fftphaseref.txt");
  double* convor = read_input("convooutputref.txt");
  double* correr = read_input("correoutputref.txt"); 
  for (int i = 0; i < fftlength; i++) {
        fftmag_f[i] = ffftmag[i];
        fftphase_f[i] = ffftphase[i];
        fftmag_d[i] = dfftmag[i];
        fftphase_d[i] = dfftphase[i];
        fftmag_ref[i] = fftmagr[i];
        fftphase_ref[i] = fftphaser[i];
  }

  for (int j = 0; j < fftlength; j++) {
        convo_f[j] = fconvo[j];
        corre_f[j] = fcorre[j];
        convo_d[j] = dconvo[j];
        corre_d[j] = dcorre[j];
        convo_ref[j] = convor[j];
        corre_ref[j] = correr[j];
        
  }

  double fftmag_f_error = compareoutput (fftmag_ref, fftmag_f, fftlength);
  double fftphase_f_error = compareoutput (fftphase_ref, fftphase_f, fftlength);
  double fftmag_d_error = compareoutput (fftmag_ref, fftmag_d, fftlength);
  double fftphase_d_error = compareoutput (fftphase_ref, fftphase_d, fftlength);
  double convo_f_error = compareoutput (convo_ref, convo_f, convolength);
  double convo_d_error = compareoutput (convo_ref, convo_d, convolength);
  double corre_f_error = compareoutput (corre_ref, corre_f, correlength);
  double corre_d_error = compareoutput (corre_ref, corre_d, correlength);
  
  FILE *output_data;
  output_data = fopen("error_result.txt", "w");

    fprintf(output_data,"Error result: \n\n");

  fclose(output_data);

  output_data = fopen("error_result.txt", "a");

    fprintf(output_data,"FFT magnitude (single precision): %e\n", fftmag_f_error);
    fprintf(output_data,"FFT magnitude (double precision): %e\n", fftmag_d_error);
    fprintf(output_data,"FFT phase (single precision): %e\n", fftphase_f_error);
    fprintf(output_data,"FFT phase (double precision): %e\n", fftphase_d_error);
    fprintf(output_data,"Convolution (single precision): %e\n", convo_f_error);
    fprintf(output_data,"Convolution (double precision): %e\n", convo_d_error);
    fprintf(output_data,"Correlation (single precision): %e\n", corre_f_error);
    fprintf(output_data,"Correlation (double precision): %e\n", corre_d_error);

  fclose(output_data);

}