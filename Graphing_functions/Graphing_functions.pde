void setup()
{
  size(400, 400);
  background(0);
  stroke(255);
  
  line(0, height/2, width, height/2);  // X axis
  line(width/2, 0, width/2, height);   // Y axis
}

void draw()
{
  translate(width/2, height/2);
  
  // Draw points (x, y) for all X values from left to right
  // of the window with (0, 0) at the center.
  for(float x = -width/2; x < width/2; x+=0.1)
  {
    point(x, -f(x));
    point(x, -g(x));
    
    // Approximating intersections
    if(abs(f(x)-g(x)) <= 0.19)
      println(x + " " + f(x));
  }
  noLoop();
}

// Linear function
float f(float x)
{
  return 0.5*x+70;
}

// Quadratic function
float g(float x)
{
  return x*x/20;
}
