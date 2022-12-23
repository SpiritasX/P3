float alpha = 10;

void setup()
{
  size(600, 600);
  colorMode(HSB);
  
  background(0);
  loadPixels();
  for (int i = 0; i < height; i++)
  {
    for (int j = 0; j < width; j++)
    {
      int idx = i * width + j;
      int x = j - width/2;
      int y = i - height/2;
      
      float t = map(atan2(x, f(y)), -PI, PI, 0, 255);
      float b = map(sin(hypo(x, y)/alpha), -1, 1, 0, 255);
      color c = color(t, 255, b);
      pixels[idx] = c;
    }
  }
  updatePixels();
}

int f(int x)
{
  return -(x*x*x + x + 1);
}

float hypo(float x, float y)
{
  return sqrt(sq(x) + sq(y));
}
