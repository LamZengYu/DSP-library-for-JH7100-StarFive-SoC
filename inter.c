  int a = N/2;
  int b = N;
  int c;
  for(int i=1; i<N-1; i++)
  {
    c = -M_PI*a;
    while(a & (b >>=1))
        a &= ~b;
    a |= b;
    b = N;
    c /= N;
  }
