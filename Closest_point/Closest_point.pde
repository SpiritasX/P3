int n = 30;
float points[];

void setup()
{
  size(600, 600);
  colorMode(HSB);
  
  // Initialize random N points
  points = new float[2*n];
  
  for(int i = 0; i < n; i++)
  {
    points[2*i] = random(0, width);
    points[2*i+1] = random(0, height);
  }
}

void draw()
{
  loadPixels();
  for(int j = 0; j < height; j++)
  {
    for(int i = 0; i < width; i++)
    {
      // Set the distance from the point to be the maximum possible
      float x = width;
      float y = height;
      float prev_dist = dist(i, j, x, y);
      int closest = 1;
      
      // Go through all the points
      for(int k = 0; k < n; k++)
      {
        float new_dist = dist(i, j, points[2*k], points[2*k+1]);
        
        // Find the smallest distance
        if(new_dist < prev_dist)
        {
          prev_dist = new_dist;
          closest = k+1;
        }
      }
      
      // Set the color of the pixel based on what point it's closest to
      int index = i + j * width;
      pixels[index] = color(255/closest, 255, 255);
    }
  }
  updatePixels();
  
  // Draw points, can be commented out...
  for(int i = 0; i < 2*n; i+=2)
  {
    circle(points[i], points[i+1], 4);
  }
}
