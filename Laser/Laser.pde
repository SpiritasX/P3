PVector laser, direction;

// Interesting directions:
// 1.8394351 -1.7823148

float dirX, dirY;

void setup()
{
  size(400, 400);

  init();
  stroke(255, 0, 0);
  frameRate(40);
}

void draw()
{
  laser.x = constrain(laser.x, 0, 400);
  laser.y = constrain(laser.y, 0, 400);
  float x = laser.x, y = laser.y;
  do
  {
    laser.add(direction);
  } while(laser.x > 0 && laser.x < 400 && laser.y > 0 && laser.y < 400);

  if(laser.x > 400 || laser.x < 0)
    direction.x = -direction.x;
  if(laser.y > 400 || laser.y < 0)
    direction.y = -direction.y;

  line(x, y, laser.x, laser.y);

  int red = 0, black = 0;
  loadPixels();
  for(int i = 0; i < 400; i++)
  {
    for(int j = 0; j < 400; j++)
    {
      if(red(pixels[j + i * 400]) > 50)
        red++;
      else
        black++;
    }
  }
  updatePixels();

  if(0.1 * red > black)
    init();
}

void init()
{
    background(0);
    dirX = random(-1, 1);
    dirY = random(-1, 1);
    direction = new PVector(dirX, dirY);
    laser = new PVector(random(400), random(400));
}

void keyPressed()
{
    if(key == ENTER)
        println(dirX + " " + dirY);
    if(key == ' ')
        init();
}
