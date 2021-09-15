boolean started = false;

int scl = 5;

int cols;
int rows;

int[][] grid;

void setup()
{
  //fullScreen();
  //size(800, 500);
  cols = width/scl;
  rows = (height-100)/scl;
  
  grid = new int[cols][rows];
  background(0);
  
  /*for(int i = 0; i < cols; i++)
    for(int j = 0; j < rows; j++)
      grid[i][j] = floor(random(2));*/
  
  frameRate(24);
}

void draw()
{
  if(started)
  {
    background(0);
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        fill(grid[i][j] * 255);
        rect(i*scl, j*scl, scl, scl);
      }
    }
    
    int[][] next = new int[cols][rows];
    
    for(int x = 0; x < cols; x++)
    {
      for(int y = 0; y < rows; y++)
      {
        int number = countNeighbors(x, y);
        int state = grid[x][y];
        
        if(state == 1 && number < 2)
          next[x][y] = 0;
        if(state == 1 && number > 3)
          next[x][y] = 0;
        if(state == 1 && (number == 2 || number == 3))
          next[x][y] = 1;
        if(state == 0 && number == 3)
          next[x][y] = 1;
      }
    }
    
    grid = next;
  }
  
  fill(200);
  rect(width/2-100, height-90, 200, 100);
}

int countNeighbors(int x, int y)
{
  int sum = 0;
  for(int j = -1; j < 2; j++)
    for(int i = -1; i < 2; i++)
      sum += grid[(x + cols + i) % cols][(y + rows + j) % rows];
  return sum - grid[x][y];
}

void mouseClicked()
{
  if(mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height-90 && mouseY < height-10)
    started = !started;
  else if(mouseY < height-100)
  {
    if(grid[mouseX/scl][mouseY/scl] == 0)
    {
      grid[mouseX/scl][mouseY/scl] = 1;
      fill(255);
    }
    else
    {
      grid[mouseX/scl][mouseY/scl] = 0;
      fill(0);
    }
    rect((mouseX/scl)*scl, (mouseY/scl)*scl, scl, scl);
  }
}
