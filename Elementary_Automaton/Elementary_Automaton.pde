int resolution = 2;

int h;
int w;

int rule = 169;

int mainArray[][];

int time = millis();

void setup()
{
  size(500, 1000);
  
  h = height;
  w = width;
  
  mainArray = new int[h / resolution][w / resolution];
  
  mainArray[h / resolution - 1][(w / resolution) / 2] = 1;
}

void draw()
{
  if(millis() - time > 500)
  {
    background(0);
    
    pushRow();
    
    for(int j = 0; j < h / resolution; j++)
    {
      for(int i = 0; i < w / resolution; i++)
      {
        fill(mainArray[j][i]*255);
        noStroke();
        rect(i * resolution, j * resolution, resolution, resolution);
      }
    }
  }
}

void pushRow()
{
  for(int j = 0; j < h / resolution - 1; j++)
    mainArray[j] = mainArray[j + 1];
    
  mainArray[h / resolution - 1] = generation();
}

int[] generation()
{
  int array[] = new int[w / resolution];
  int temp;
  
  for(int k = 0; k < array.length; k++)
  {
    if(k == 0)
      temp = (mainArray[h / resolution - 1][k] << 1) | mainArray[h / resolution - 1][k + 1];
    else if(k == array.length - 1)
      temp = (mainArray[h / resolution - 1][k - 1] << 2) | (mainArray[h / resolution - 1][k] << 1);
    else
      temp = (mainArray[h / resolution - 1][k - 1] << 2) | (mainArray[h / resolution - 1][k] << 1) | mainArray[h / resolution - 1][k + 1];
    
    array[k] = (rule >> temp) & 1;
  }
  
  return array;
}
