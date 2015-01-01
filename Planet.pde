class Planet
{
  int x;
  int y;
  int size;
  color colour;

  Planet(int i, int j, int s, color colour)
  {
    this.x = i;
    this.y = j; 
    this.size = s;
    this.colour = colour;
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
    ellipse(x, y, size, size);
  }
}

