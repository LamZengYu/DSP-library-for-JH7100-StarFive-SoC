#include <stdlib.h>
#include <stdio.h>
#include <math.h>

// helper functions to get the min and max of two numbers
#define MIN(X, Y) (((X) < (Y)) ? (X) : (Y))
#define MAX(X, Y) (((X) < (Y)) ? (Y) : (X))

float corre(float x[], float y[], int n, int delay, int maxdelay)
{
   int i,j;
   float mx,my,sx,sy,sxy,denom,r;
   
   /* Calculate the mean of the two series x[], y[] */
   mx = 0;
   my = 0;   
   for (i=0;i<n;i++) {
      mx += x[i];
      my += y[i];
   }
   mx /= n;
   my /= n;

   /* Calculate the denominator */
   sx = 0;
   sy = 0;
   for (i=0;i<n;i++) {
      sx += (x[i] - mx) * (x[i] - mx);
      sy += (y[i] - my) * (y[i] - my);
   }
   denom = sqrt(sx*sy);

   /* Calculate the correlation series */
   for (delay=-maxdelay;delay<maxdelay;delay++) {
      sxy = 0;
      for (i=0;i<n;i++) {
         j = i + delay;
         if (j < 0 || j >= n)
            continue;
         else
            sxy += (x[i] - mx) * (y[j] - my);
      }
      r = sxy / denom;

      return r;
      
      /* r is the correlation coefficient at "delay" */

   }
}

int main(int argc, char *argv[])
{
  float h[] = { 1.0, 1.0, 1.0, 1.0, 1.0 };
  float x[] = { 1.0, 1.0, 1.0, 1.0, 1.0 };
  return 0;
}
