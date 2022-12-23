class Complex
{
  float a;
  float b;
  
  Complex()
  {
    a = 0;
    b = 0;
  }
  
  Complex(float real, float imaginary)
  {
    a = real;
    b = imaginary;
  }
  
  Complex mul(Complex a, Complex b)
  {
    return new Complex(a.a * b.a - a.b * b.b, a.a * b.b + a.b * b.a);
  }
  
  void add(Complex z)
  {
    a += z.a;
    b += z.b;
  }
}
