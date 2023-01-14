

Life me = new Life();

void setup()
{
  me.alive = floor(random(2)) == 1;
}

void draw()
{
  if (me.alive)
    background(map(sin(millis()/100), -1, 1, 0, 255), 0, 0);
  else
    background(0);
    
  if (millis() > 3000)
    me.end();
    
  println(me.alive);
}
