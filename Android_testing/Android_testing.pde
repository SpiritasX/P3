Object object;
Platform[] platforms = new Platform[0];

void setup()
{
  size(800, 600);
  //fullScreen();
  object = new Object(150, height-300);
  platforms = (Platform[])append(platforms, new Platform(width));
}

void draw()
{
  background(0);

  object.update();

  if (frameCount % 100 == 0)
    platforms = (Platform[]) append(platforms, new Platform(object.x + width));

  for (int i = 0; i < platforms.length; i++)
  {
    platforms[i].update();
    
    if (platforms[i].offscreen())
    {
      for (int j = 0; j < platforms.length - 1; j++)
      {
        platforms[j] = platforms[j + 1];
      }
      platforms = (Platform[])shorten(platforms);
    }
    
    platforms[i].colliding(object);
    platforms[i].show();
  }
  
  object.show();
}

void keyPressed()
{
  if (key == ' ')
  {
    object.applyForce(-20);
  }
}

void touchStarted()
{
  object.applyForce(-20);
}
