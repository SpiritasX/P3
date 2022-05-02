// Pink   223,  21,  94
// Orange 250, 106,  17

void setup()
{
  // Allows per-vertex color changing but also seems
  // to lower the quality quite a bit...
  size(600, 600, P3D);
  background(255);
  
  int space = 50;
  
  strokeWeight(2);
  noFill();
  for (int i = 0; i <= 440 / space; i++)
  {
    float y = 80 + space * i;
    beginShape();
    stroke(250, 106,  17);
    vertex(80, y);
    for (int j = 1; j <= 20; j++)
    {
      stroke(223 + 1.35*j,21 + 4.25*j, 94 - 3.85*j);
      vertex(80 + 22*j, y + random(c(i, j)));
    }
    //vertex(520, y);
    endShape();
  }
}

// function of position
float c(int x, int y)
{
  return (x*y)/4;
}
