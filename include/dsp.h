void fft_ori_f(float data_re[], float data_im[], const int N);
void fft_opt_f(float data_re[], float data_im[], const int N);

void fft_ori_d(double data_re[], double data_im[], const int N);
void fft_opt_d(double data_re[], double data_im[], const int N);

float* correlation_ori_f(float h[], float x[], int lenH, int lenX, int* lenY);
float* correlation_opt_f(float h[], float x[], int lenH, int lenX, int* lenY);

double* correlation_ori_d(double h[], double x[], int lenH, int lenX, int* lenY);
double* correlation_opt_d(double h[], double x[], int lenH, int lenX, int* lenY);

float* convolution_ori_f(float h[], float x[], int lenH, int lenX, int* lenY);
float* convolution_opt_f(float h[], float x[], int lenH, int lenX, int* lenY);

double* convolution_ori_d(double h[], double x[], int lenH, int lenX, int* lenY);
double* convolution_opt_d(double h[], double x[], int lenH, int lenX, int* lenY);
