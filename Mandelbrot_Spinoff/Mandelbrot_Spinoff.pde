Complex c;
long prev = 0;

void setup()
{
  size(600, 600);
  background(0);

  loadPixels();
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      float a = map(x, 0, width, -2, 2);
      float b = map(y, 0, height, -2, 2);

      c = new Complex(a, b);

      if(mandelbrot(new Complex(0, 0), 0))
      {
        pixels[x + y * width] = color(255);
      }
    }
  }
  updatePixels();
}

void draw() {}


boolean mandelbrot(Complex z, int n)
{
  Complex result = new Complex();
  z.sqr(z);
  result.add(z);
  result.add(c);
  if(abs(result.a + result.b) > 16)
  {
    return false;
  }

  if(n == 10)
  {
    return true;
  }
  return mandelbrot(result, ++n);
}
