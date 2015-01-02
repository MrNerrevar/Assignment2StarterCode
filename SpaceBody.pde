abstract class SpaceBody
{
  PVector pos;
  int size;
  color colour;

  SpaceBody(PVector pos, int size, color colour)
  {
    this.pos = pos;
    this.size = size;
    this.colour = colour;
  }

  void draw()
  {
    fill(colour);
    stroke(colour);
  }

  abstract void update();
}

