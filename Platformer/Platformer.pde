Object object;
Object obstacle;

float increment = 0.02;
int scale = 10;

void setup()
{
  size(800, 600);
  
  object = new Object(width/2, height, 4);
  obstacle = new Object(width, height, 0);
}

void draw()
{
  
  // BACKGROUND
  float xoff = object.pos.x * (increment / scale);
  for(int i = 0; i < width/scale; i++)
  {
    xoff += increment;
    float yoff = 0;
    for(int j = 0; j < height/scale; j++)
    {
      fill(int(noise(xoff, yoff) * 255));
      yoff += increment;
      rect(i*scale, j*scale, scale, scale);
    }
  }
  
  // Move the camera so that the object is in the middle
  translate(-object.pos.x + width/2, 0);
  
  // GRAVITY
  object.applyForce(new PVector(0, 0.7));
  
  // REFRESH
  object.update();
  object.show();
  obstacle.update();
  obstacle.show();
}

void keyPressed()
{
  // JUMP
  if(key == ' ')
  {
    object.applyForce(new PVector(0, -20));
  }
}
