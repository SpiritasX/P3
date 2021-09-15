class Circle
{
  float x;
  float y;
  float r;
  boolean growing = true;
  
  Circle(float x, float y, float r)
  {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  void grow()
  {
    if(growing)
    {
      r = sqrt(r*r + 10/PI);
    }
  }
  
  void show()
  {
    stroke(255);
    strokeWeight(2);
    noFill();
    ellipse(x, y, r*2, r*2);
  }
}
