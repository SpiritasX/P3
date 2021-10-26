int n = 7;
int r = 200;
int multiplier = 10;

void setup()
{
  size(600, 600);
}

void draw()
{
  translate(width/2, height/2);
  background(0);
  
  for(int i = 0; i < n; i++)
  {
    float angle = TWO_PI*i/n;
    
    float x = -r*cos(angle);
    float y = -r*sin(angle);
    
    stroke(255);
    circle(x, y, 4);
    
    
    float x1 = -r*cos(multiplier*angle);
    float y1 = -r*sin(multiplier*angle);
    
    line(x, y, x1, y1);
  }
}

void mouseMoved()
{
  n = mouseX/3;
}
