class Platform
{
  float x, y, w = 300;
  float xVelocity = -4;
  
  Platform(float x_)
  {
    x = x_;
    y = random(300, 500);
  }
  
  void show()
  {
    fill(255);
    noStroke();
    rect(x, y, w, 50);
  }
  
  void update()
  {
    x += xVelocity;
  }
  
  boolean offscreen()

  {
    return x + w < 0;
  }
  
  void colliding(Object object)
  {
    if (object.x + 150 > x && object.x < x + w && object.y + 300 < y)
    {
      object.y = y - 300;
    }
  }
}
