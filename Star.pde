class Star
{
  int x;
  int y;
  int size;
  color colour;
 
  Star(int i, int j, int s)
  {
    this.x = i;
     this.y = j; 
     this.size = s;
     this.colour = color(255, 255, 255);
  }
  
  int getX()
  {
    return this.x; 
  }
  
  int getY()
  {
   return this.y; 
  }
  
  int getSize()
  {
   return this.size; 
  }
  
  void setX(int i)
  {
     this.x = i; 
  }
  
  void setY(int i)
  {
    this.y = i;
  }
  
  void draw()
  {
    fill(colour);
    stroke(colour);    
    rect(x, y, size, size);
  }

  
}
