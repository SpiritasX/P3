color g = color( 59, 165,  93);
color r = color(237,  66,  69);
color bg= color( 47,  49,  54);
color c = bg;

float x = 250;
float y = 100;

int k = 0;
float prev = 0;
String texts[] = {"", "Copied!", "Double Copy!", "Triple Copy!", "Dominating!!",
                 "Rampage!!", "Mega Copy!!", "Unstoppable!!",
                 "Wicked Sick!!", "Monster Copy!!", "GODLIKE!!!", "BEYOND GODLIKE!!!!"};

void setup()
{
  //fullScreen();
  size(500, 200);
  textFont(createFont("PontanoSans-Regular.ttf", width/10));
  textAlign(CENTER, CENTER);
}

void draw()
{
  if (k == 0) c = bg;
  else if (k < 10)
  {
    x = width/2;
    y = height/2;
    c = g;
  }
  else 
  {
    x = random(width/2-30, width/2+30);
    y = random(height/2-40, height/2+40);
    c = r;
  }
  
  background(c);
  text(texts[k], x, y);
  
  if (millis()/1000.0 - prev > 1)
    k = 0;
}

void mousePressed()
{
  prev = millis()/1000.0;
  if (k < 11)
    k++;
}
