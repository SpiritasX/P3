int n = 100;
int r = 200;
float multiplier = 1;

void setup()
{
  size(600, 600);
  fill(255);
  textAlign(CENTER);
  stroke(255);
}

void draw()
{
  background(0);
  text("Multiplier: " + floor(multiplier), width/2, 40);
  translate(width/2, height/2);
  noFill();
  circle(0, 0, 2*r+1);
  
  for(int i = 0; i < n; i++)
  {
    float angle = TWO_PI*i/n;
    
    float x1 = -r*cos(angle);
    float y1 = -r*sin(angle);
    
    float x2 = -r*cos(multiplier * angle);
    float y2 = -r*sin(multiplier * angle);
    
    line(x1, y1, x2, y2);
  }
  
  multiplier+=0.008;
}
