class Object
{
  float x, y;
  float yVelocity;
  float gravity = 0.7;
  
  Object(float x_, float y_)
  {
    x = x_;
    y = y_;
  }
  
  void applyForce(float yAcceleration)
  {
    yVelocity += yAcceleration;
  }
  
  void update()
  {
    applyForce(gravity);
    y += yVelocity;
    
    if(y+300 > height)
    {
      yVelocity = 0;
      y = height - 300;
    }
    
    if(y < 0)
    {
      yVelocity = 0;
      y = 0;
    }
  }
  
  void show()
  {
    fill(255);
    noStroke();
    rect(x, y, 150, 300);
  }
}
