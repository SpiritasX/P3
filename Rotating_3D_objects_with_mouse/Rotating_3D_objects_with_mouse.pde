float rotX = 0, rotY = 0;

int scale = 4;

void setup()
{
  size(800, 800, P3D);
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  fill(255);
  rotateX(rotX);
  rotateY(rotY);
  box(width/scale);
}

void mouseDragged()
{
  rotX += abs(mouseY/100 - pmouseY/100);
  rotY += abs(mouseX/100 - pmouseX/100);
  
  rotX = (mouseY / 100) % TWO_PI; 
  rotY = (mouseX / 100) % TWO_PI;
  
  println(rotX + " " + rotY);
}

void mouseWheel(MouseEvent event)
{
  scale += event.getCount();
  scale = constrain(scale, 2, 100);
}
