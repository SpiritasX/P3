ArrayList<Circle> circles;

float radius = 0;

void setup()
{
  //size(600, 600);
  fullScreen();
  circles = new ArrayList<Circle>();
}

void draw()
{
  background(0);
  
  int iterations = 0;
  int tries = 0;
  while(iterations < 10)
  {
    Circle circle = TryMakeCircle();
    if(circle != null)
    {
      circles.add(circle);
      iterations++;
    }
    tries++;
    if(tries > 1000)
    {
      noLoop();
      break;
    }
  }
  
  for (Circle c : circles)
  {
    if(c.growing)
    {
      if(c.x + c.r > width - radius || c.x - c.r < radius || c.y + c.r > height - radius || c.y - c.r < radius)
      {
        c.growing = false;
      }
      
      for (Circle other : circles)
      {
        if(dist(c.x, c.y, other.x, other.y) - 1 < c.r + other.r && other != c)
        {
          c.growing = false;
          break;
        }
      }
    }
    
    c.grow();
    c.show();
  }
}

Circle TryMakeCircle()
{
  float x = random(width);
  float y = random(height);
  
  for (Circle c : circles)
  {
    float d = dist(c.x, c.y, x, y);
    if(d < c.r + radius)
    {
      return null;
    }
  }
  
  return new Circle(x, y, radius);
}
