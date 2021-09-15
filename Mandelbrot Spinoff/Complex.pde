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
  
  void sqr(Complex z)
  {
    //a = z.a * z.a - z.b * z.b;
    //b = 2 * z.a * z.b;
    a = pow(z.a, 3) - 3*z.a*pow(z.b, 2);
    b = 3*pow(z.a,2)*z.b - pow(z.b, 3);
  }
  
  void add(Complex c)
  {
    a += c.a;
    b += c.b;
  }
}
