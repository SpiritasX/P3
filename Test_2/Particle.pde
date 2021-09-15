class Particle
{
  float x;
  float y;
  float vx;
  float vy;
  
  Particle(float x, float y)
  {
    this.x = x;
    this.y = y;
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
    color c = pic.get(int(x), int(y));
    fill(c);
    rect(x, y, scl, scl);
  }
}
