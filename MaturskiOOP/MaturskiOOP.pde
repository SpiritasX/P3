int res = 10;  // Velicina celije
int his = 1000;  // Velicina niza istorije

int cols; // Broj celija u jednoj vrsti
int rows; // Broj celija u jednoj koloni

boolean started = false; // Proverava da li je igra pauzirana

int interval = 100;  // Broj milisekundi izmedju dve generacije
int lastRecordedTime = 0; // Vreme kad se prethodna generacija dogodila

int text = 0;

Cell[][] cells;  // Matrica celija koja se prikazuje
Cell[][] buffer; // Pomocna matrica celija

void setup()
{
  //fullScreen();
  size(800, 400);
  cols = width/res;
  rows = height/res;
  
  stroke(40);
  noSmooth();
  
  cells = new Cell[cols][rows];
  
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      cells[i][j] = new Cell(i, j, res, his);
      cells[i][j].display();
    }
  }
  
  textSize(32);
}

void draw()
{
  if(started && millis() - lastRecordedTime > interval)
  {
    iteration();
    lastRecordedTime = millis();
  }
  
  if(text > 0) 
  {
    fill(0);
    rect(0, 0, 20 + 20*(floor(log(interval)/log(10)) + 1), 40);
    fill(255, text);
    text(interval, 10, 30);
    text -= 10;
  }
}

void iteration()
{
  buffer = new Cell[cols][rows];
  
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      buffer[i][j] = new Cell(i, j, res, his);
      int neighbors = countNeighbors(i, j);
      int state = cells[i][j].peek();
      
      if(state == 1 && neighbors < 2)
        buffer[i][j].push(0);
      if(state == 1 && (neighbors == 2 || neighbors == 3))
        buffer[i][j].push(1);
      if(state == 1 && neighbors > 3)
        buffer[i][j].push(0);
      if(state == 0 && neighbors == 3)
        buffer[i][j].push(1);
    }
  }
  
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      cells[i][j].push(buffer[i][j].peek());
      cells[i][j].display();
    }
  }
}

void mouseClicked()
{
  int x = mouseX/res;
  int y = mouseY/res;
  cells[x][y].push((cells[x][y].peek() + 1) % 2);
  cells[x][y].display();
}

void keyPressed()
{
  if(key == ' ')
  {
    started = !started;
  }
  
  else if(keyCode == RIGHT && !started)
  {
    iteration();
  }
  
  else if(key == 'c' || key == 'C' || key == 'r' || key == 'R')
  {
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        cells[i][j] = new Cell(i, j, res, his);
        if(key == 'r' || key == 'R')
          cells[i][j].push(floor(random(2)));
        cells[i][j].display();
      }
    }
  }
  
  else if(keyCode == UP)
  {
    interval += 10;
    text = 255;
  }
  
  else if(keyCode == DOWN && interval > 0)
  {
    interval -= 10;
    text = 255;
  }
  
  else if(keyCode == LEFT && !started)
  {
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        cells[i][j].pop();
        cells[i][j].display();
      }
    }
  }
  
  else if(keyCode == ENTER)
  {
    background(0);
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        cells[i][j].awesome = !cells[i][j].awesome;
      }
    }
  }
  
}
 
int countNeighbors(int x, int y)
{
  int sum = 0;
  for(int j = -1; j <= 1; j++)
    for(int i = -1; i <= 1; i++)
      sum += cells[(x + cols + i) % cols][(y + rows + j) % rows].peek();
  return sum - cells[x][y].peek();
}
