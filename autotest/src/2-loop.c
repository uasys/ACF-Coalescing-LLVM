int a(int iter, int* b) {
  for(int i=0; i<iter; i++) {
    if(b[i] == 0)
      return i;
  }
  return 0;
}
