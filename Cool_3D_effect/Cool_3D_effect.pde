float angle = 0;
int x = 0;
int y = 0;

void setup()
{
  size(800, 800, P3D);
  background(0);
}

void draw()
{
  translate(x, y);
  rotateY(angle);
  rotateX(angle/5);
  box(200);
  angle += 0.025;
  x += 1;
  y += 1;
}
