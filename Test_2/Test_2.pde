PImage pic;

Particle[] particles;

int scl = 10;

void setup()
{
  colorMode(GRAY);
  size(640, 860);
  pic = loadImage("img/cat.jpg");
  
  particles = new Particle[width*height/scl/scl];
  for(int x = 0; x < width/scl; x++)
  {
    for(int y = 0; y < height/scl; y++)
    {
      particles[x + y * width/scl] = new Particle(x*scl, y*scl);
    }
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < particles.length; i++)
  {
    particles[i].display();
    //particles[i].update();
  }
}
