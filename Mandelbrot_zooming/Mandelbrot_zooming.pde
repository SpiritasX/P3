Complex c;
long prev = 0;

float zoom = 4;

float new_x = -2;
float new_y = -2;

int res = 25;

boolean b = true;

void setup()
{
  fullScreen();
  //size(600, 600);
  colorMode(RGB);
}

void draw()
{
  background(0);
  loadPixels();
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      
      float a = map(x, 0, width, new_x, new_x+zoom*width/height);//map(x, 0, width, map(mouseX, 0, width, -2, 2), map(mouseY, 0, height, -2, 2));
      float b = map(y, 0, height, new_y, new_y+zoom);//map(y, 0, height, map(mouseX, 0, width, -2, 2), map(mouseY, 0, height, -2, 2));
      
      c = new Complex(a, b);

      float temp;

      if((temp = mandelbrot(new Complex(), 0)) >= 0)
      {
        pixels[x + y * width] = color(map(temp, 0, res, 0, 255), 170, 255);
      }
    }
  }
  updatePixels();
}


float mandelbrot(Complex z, int n)
{
  Complex result = new Complex();
  z = z.mul(z, z);
  result.add(z);
  result.add(c);
  if(abs(result.a + result.b) > 16)
    return n;

  if(n == res)//round((mouseX / float(width)) * 50))
    return res;
  
  return mandelbrot(result, ++n);
}

void mousePressed()
{
  if (b)
  {
    float mult = 2;
    zoom = 0.01;
    res = 100;
    new_x = float(mouseX)/width*mult-mult/2-zoom/2;
    new_y = float(mouseY)/height*mult-mult/2-zoom/2;
    b = !b;
  }
  else
  {
    new_x = -2;
    new_y = -2;
    zoom = 4;
    res = 25;
    b = !b;
  }
}
