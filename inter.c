  int a, c = 0;
  int b = N;
  for(int i=1; i<N; i++)
  {
    c = -M_PI*a/N;
    b = N;
    while(a & (b >>=1))
        a &= ~b;
    a |= b;
  }
