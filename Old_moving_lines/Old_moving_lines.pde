float x1 = random(0, 600);
float y1 = random(0, 600);
float x2 = random(0, 600);
float y2 = random(0, 600);

float dx1 = random(50);
float dy1 = random(50);
float dx2 = random(50);
float dy2 = random(50);

int k = 0;

void setup()
{
  fullScreen();
  //size(600, 600);
  colorMode(HSB);
  background(0);
  strokeWeight(3);
}

void draw()
{
  noStroke();
  fill(0, 6);
  rect(0, 0, width, height);
  
  x1 += dx1;
  y1 += dy1;
  x2 += dx2;
  y2 += dy2;
  
  if (x1 < 0 || x1 > width)
    dx1 = -dx1;
  if (y1 < 0 || y1 > height)
    dy1 = -dy1;
  if (x2 < 0 || x2 > width)
    dx2 = -dx2;
  if (y2 < 0 || y2 > height)
    dy2 = -dy2;
  
  stroke(color(k, 255, 255));
  line(x1, y1, x2, y2);
  
  k = (k + 1) % 256;
}
