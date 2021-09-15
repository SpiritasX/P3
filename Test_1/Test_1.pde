PImage pic;

Particle[] particles;

void setup()
{
  size(720, 720);
  pic = loadImage("img/test_pic.jpg");
  background(0);
  particles = new Particle [2000];
  for(int i = 0; i < particles.length; i++)
  {
    particles[i] = new Particle();
  }
}

void draw()
{
  for(int i = 0; i < particles.length; i++)
  {
    /*int x = int(random(0, width));
    int y = int(random(0, height));
    color c = pic.pixels[x + y * width];
    fill(c, 100);
    noStroke();
    ellipse(x, y, 8, 8);*/
    
    particles[i].display();
    particles[i].update();
  }
}
