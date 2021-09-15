class Object
{
  PVector pos, vel, acc;
  
  Object(float x, float y, float v)
  {
    pos = new PVector(x, y);
    vel = new PVector(v, 0);
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector force)
  {
    acc.add(force);
  }
  
  void update()
  {
    vel.add(acc);
    pos.add(vel);
    acc.set(0, 0);
    
    if(pos.y > height)
    {
      vel.y *= 0;
      pos.y = height;
    }
  }
  
  void show()
  {
    fill(255);
    noStroke();
    rect(pos.x - 24, pos.y - 100, 50, 100);
  }
}
