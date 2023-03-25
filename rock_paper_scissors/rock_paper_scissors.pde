int KAMEN = 0;
int PAPIR = 1;
int MAKAZE = 2;

int n = 100;

int niz[] = new int[n];
float koordinate[] = new float[2 * n];

void setup() 
{
  size(400, 400);
  colorMode(HSB);
  
  for (int i = 0 ; i < n; i++)
  {
    niz[i] = (int)random(0, 3);
    koordinate[2 * i] = random(width);
    koordinate[2 * i + 1] = random(height);
  }
}

void draw()
{
  background(255);
  //noStroke();
  for (int i = 0; i < n; i++)
  {
    fill(niz[i] * 255 / 3, 150, 255);
    circle(koordinate[2 * i], koordinate[2 * i + 1], 10);
  }
  
  for (int i = 0; i < n; i++)
  {
    do
    {
      koordinate[2 * i]     += random(10) - 5;
      koordinate[2 * i + 1] += random(10) - 5;
    } while(koordinate[2 * i] < 5 || koordinate[2 * i] > width - 5 || koordinate[2 * i + 1] < 5 || koordinate[2 * i + 1] > height - 5);
  }
  
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < n; j++)
    {
      float x1 = koordinate[2 * i];
      float y1 = koordinate[2 * i + 1];
      float x2 = koordinate[2 * j];
      float y2 = koordinate[2 * j + 1];
      
      float d = sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
      
      if (d < 10)
      {
        if (niz[i] == KAMEN && niz[j] == PAPIR)
          niz[i] = PAPIR;
        else if (niz[i] == KAMEN && niz[j] == MAKAZE)
          niz[j] = KAMEN;
        else if (niz[i] == PAPIR && niz[j] == MAKAZE)
          niz[i] = MAKAZE;
      }
    }
  }
}
