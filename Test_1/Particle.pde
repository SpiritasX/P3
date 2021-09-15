class Particle
{
  float x;
  float y;
  float vx;
  float vy;
  
  Particle()
  {
    x = width/2;
    y = height/2;
    float a = random(TWO_PI);
    float speed = random(1, 2);
    vx = cos(a)*speed;
    vy = sin(a)*speed;
  }
  
  void update()
  {
    x += vx;
    if(x > width || x < 0)
    {
      x -= vx;
      vx = -vx;
    }
    y += vy;
    if(y > height || y < 0)
    {
      y -= vy;
      vy = -vy;
    }
  }
  
  void display()
  {
    noStroke();
    color c = pic.pixels[int(x) + int(y) * width];
    fill(c, 25);
    ellipse(x, y, 8, 8);
  }
}
