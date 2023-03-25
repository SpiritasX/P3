int w = 200;
int h = 100;
int x = 450;
int y = height/2 - 50;

void setup() {
  size(800, 800);
}

void draw() {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + w) {
    x = (int)random(width - 200);
    y = (int)random(height - 100);
  }
  background(50, 150, 170);
  fill(255);
  rect(150, height/2 - 50, 200, 100);
  rect(x, y, w, h);
  textSize(60);
  fill(0);
  text("Are you dumb?", 200, 100);
  text("YES", 200, height/2 + 25);
  text("NO",  x + 50, y + 75);
}

void mouseClicked() {
  if (mouseX >= 150 && mouseX <= 350 && mouseY >= height / 2 - 50 && mouseY <= height / 2 + 50) {
    textSize(100);
    text("Good job", 100, height/2);
    noLoop();
  }
}
