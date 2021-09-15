class Cell
{
  float x;
  float y;
  int w;
  int size;
  int[] history;
  boolean awesome = false;
  int generations = 0;
  
  Cell(float x_, float y_, int w_, int size_)
  {
    x = x_;
    y = y_;
    w = w_;
    size = size_;
    history = new int[size_];
  }
  
  void display()
  {
    if(awesome)
    {
      /*float avg = 0;
      for(int i = 0; i < size; i++)
        avg += history[i];
      avg /= 100;*/
      fill(peek()*255, peek()*50, peek()*150, map(generations, 0, 1000, 0, 255));
    }
    else
      fill(peek()*255);
      
    rect(x*w, y*w, w, w);
  }
  
  void push(int newState)
  {
    for(int i = size - 1; i > 0; i--)
      history[i] = history[i - 1];
      
    history[0] = newState;
    generations++;
  }
  
  void pop()
  {
    for(int i = 0; i < size - 1; i++)
      history[i] = history[i + 1];
    history[size - 1] = 0;
    generations--;
  }
  
  int peek()
  {
    return history[0];
  }
}
