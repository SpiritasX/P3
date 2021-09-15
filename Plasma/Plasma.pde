float phase = 0.0;
float phaseIncrement = 0.034;
float colorStretch = 0.008;

int resolution = 5;

int cols;
int rows;

void setup() 
{
  size(400, 400);
  cols = width / resolution;
  rows = height / resolution;
}

void draw()
{
  phase += phaseIncrement;
  float x1 = (sin(phase*1.000)+1.5) * width/15;
  float y1 = (sin(phase*1.310)+3) * height/25;
  
  float x2 = (sin(phase*1.770)+1.5) * width/15;
  float y2 = (sin(phase*2.065)+3) * height/25;
  
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      //float distance = (j - x1)*(j - x1) + (i - y1)*(i - y1);
      float distance = dist(i, j, x1, y1);
      distance *= dist(i, j, x2, y2);
      
      //distance *= (j - x2)*(j - x2) + (i - y2)*(i - y2);
      //distance = sqrt(distance);
      
      float color_f = (sin( distance * colorStretch ) + 1.0) * 0.5;
      
      //color_f *= color_f;
      
      fill(map(color_f, 0, 1, 0, 255));
      noStroke();
      rect(i*resolution, j*resolution, resolution, resolution);
    }
  }
}
