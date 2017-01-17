int a(int c1, int c2, int c3) {
  int a;
  int b = c3;
  if(c1) {
    a = 8;
  } else {
    if(c2) {
      a = 1;
      b += 4;
    } else {
      a = 2;
      b--;
    }
  }
  return a+b;
}
