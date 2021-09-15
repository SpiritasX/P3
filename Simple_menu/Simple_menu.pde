int screen = 0;
float zoff = 0;
int yoff = 10 * height;

void setup()
{
  size(1280, 774, P3D);
}

void draw()
{
  switch(screen)
  {
    case 0: // Main menu
      background(0);
      fill(255);
      //text("Start", 
      rect(width/2-85, 150, 170, 50);
      rect(width/2-85, 220, 170, 50);
      rect(width/2-85, 290, 170, 50);
      break;
    case 1: // Animation
      loadPixels();
      float xoff = 0;
      for(int i = 0; i < width; i++)
      {
        xoff += 0.1;
        float yoff = 0;
        for(int j = 0; j < height; j++)
        {
          pixels[i + j * width] = color(noise(xoff, yoff, zoff)*255, 30, 40);
          yoff += 0.1;
        }
      }
      zoff+=0.18;
      updatePixels();
      fill(255, 100);
      noStroke();
      rect(20, 20, 30, 30);
      break;
    case 2: // Shop???
      background(0);
      /*PFont myFont;
      myFont = createFont("Starjout.ttf", 150);
      textFont(myFont);
      textAlign(CENTER, CENTER);
      textLeading(110);
      text("STAR\nWARS", width/2, height/2);*/
      
      PImage img = loadImage("logo.png");
      image(img, map(zoff/2, 0, 700, 0, 1280), map(zoff/2, 0, 700, 0, 774), width - map(zoff, 0, 700, 0, 1280), height - map(zoff, 0, 700, 0, 774));
      zoff += 1;
      
      /*background(0);
      translate(width/2, height/2);
      rotateX(radians(65));
      scale(0.5);
      PFont myFont = createFont("NewsCycle-Bold", 56);
      textFont(myFont);
      fill(255, 213, 78);
      text("The dead speak! The galaxy has\nheard a mysterious broadcast, a\nthreat of REVENGE in the sinister\nvoice of the late EMPEROR\nPALPATINE.\n\nGENERAL LEIA ORGANA\ndispatches secret agents to\ngather intelligence, while REY,\nthe last hope of the Jedi, trains\nfor battle against the diabolical\nFIRST ORDER.\n\nMeanwhile, Supreme Leader\nKYLO REN rages in search of the\nphantom Emperor, determined to\ndestroy any threat to his power....", -300, yoff);
      yoff--;
      if(yoff == -2 * height)
      {
        screen = 0;
      }*/
      break;
  }
}

void mouseClicked()
{
  // Prvi taster u meniju
  if(mouseX > (width-170)/2 && mouseX < (width+170)/2 && mouseY > 150 && mouseY < 200)
  {
    screen = 1;
  }
  // Drugi taster u meniju
  else if(mouseX > (width-170)/2 && mouseX < (width+170)/2 && mouseY > 220 && mouseY < 270)
  {
    screen = 2;
  }
  // Treci taster u meniju
  else if(mouseX > (width-170)/2 && mouseX < (width+170)/2 && mouseY > 290 && mouseY < 340)
  {
    exit();
  }
  // Back taster u animaciji
  else if(screen == 1 && mouseX > 20 && mouseX < 50 && mouseY > 20 && mouseY < 50)
  {
    screen = 0;
  }
}
