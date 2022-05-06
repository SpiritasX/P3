color g = color( 59, 165,  93);
color r = color(237,  66,  69);
color bg= color( 47,  49,  54);
color c = bg;

int k = 0;
float prev = 0;
String texts[] = {"", "Copied!", "Double Copy!", "Triple Copy!", "Dominating!!",
                 "Rampage!!", "Mega Copy!!", "Unstoppable!!",
                 "Wicked Sick!!", "Monster Copy!!", "GODLIKE!!!", "BEYOND GODLIKE!!!!"};

void setup()
{
  size(400, 200);
  textFont(createFont("PontanoSans-Regular.ttf", 60));
  textAlign(CENTER, CENTER);
}

void draw()
{
  if (k == 0) c = bg;
  else if (k < 10) c = g;
  else c = r;
  
  background(c);
  text(texts[k], 200, 100);
  
  if (millis()/1000.0 - prev > 1)
    k = 0;
}

void mousePressed()
{
  if (k < 11)
  {
    k++;
    prev = millis()/1000.0;
  }
}
