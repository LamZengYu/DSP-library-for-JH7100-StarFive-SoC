CC = gcc
CFLAGS = -Wall -g -Iinclude

# Default target
all: main

# Linking target
main: main.o src/fft/fft_opt_f.o src/fft/fft_opt_d.o src/convo/convolution_opt_f.o src/convo/convolution_opt_d.o src/corre/correlation_opt_f.o src/corre/correlation_opt_d.o
	$(CC) $(CFLAGS) -o main main.o src/fft/fft_opt_f.o src/fft/fft_opt_d.o src/convo/convolution_opt_f.o src/convo/convolution_opt_d.o src/corre/correlation_opt_f.o src/corre/correlation_opt_d.o -lm

# Compiling source files into object files
main.o: example.c include/dsp.h
	$(CC) $(CFLAGS) -c example.c

src/fft/fft_opt_f.o: src/fft/fft_opt_f.c include/dsp.h
	$(CC) $(CFLAGS) -c src/fft/fft_opt_f.c -o src/fft/fft_opt_f.o

src/fft/fft_opt_d.o: src/fft/fft_opt_d.c include/dsp.h
	$(CC) $(CFLAGS) -c src/fft/fft_opt_d.c -o src/fft/fft_opt_d.o

src/convo/convolution_opt_f.o: src/convo/convolution_opt_f.c include/dsp.h
	$(CC) $(CFLAGS) -c src/convo/convolution_opt_f.c -o src/convo/convolution_opt_f.o

src/convo/convolution_opt_d.o: src/convo/convolution_opt_d.c include/dsp.h
	$(CC) $(CFLAGS) -c src/convo/convolution_opt_d.c -o src/convo/convolution_opt_d.o

src/corre/correlation_opt_f.o: src/corre/correlation_opt_f.c include/dsp.h
	$(CC) $(CFLAGS) -c src/corre/correlation_opt_f.c -o src/corre/correlation_opt_f.o

src/corre/correlation_opt_d.o: src/corre/correlation_opt_d.c include/dsp.h
	$(CC) $(CFLAGS) -c src/corre/correlation_opt_d.c -o src/corre/correlation_opt_d.o

# Clean target to remove generated files
clean:
	rm -f main main.o src/fft/fft_opt_f.o src/fft/fft_opt_d.o src/convo/convolution_opt_f.o src/convo/convolution_opt_d.o src/corre/correlation_opt_f.o src/corre/correlation_opt_d.o
