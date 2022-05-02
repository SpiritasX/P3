void setup()
{
  //size(449, 972);
  fullScreen();
  background(100, 105, 110);
  
  stroke(0);
  for (int i = 0; i < 1000; i++)
  {
    strokeWeight(w(random(1)));
    float x1 = random(width);
    float y1 = random(height);
    float x2 = random(width);
    float y2 = random(height);
    
    line(x1, y1, x2, y2);
  }
  String str = "Let me know if you have any ideas about what I should do with the rest of my life";
  textFont(createFont("JMH Typewriter-Thin.ttf", 128));
  textSize(13);
  text(str, 700, 540);
  textSize(13.07);
  text(str, 700, 540);
}

float w(float x)
{
  float k = min(1, max(0, (x + 0.2) / (1.5 + 0.2)));
  return 3*k*k - 2*k*k*k;
}
