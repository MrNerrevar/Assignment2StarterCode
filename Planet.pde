class Planet extends SpaceBody
{
  PVector orbitPoint;
  float angle;
  boolean hasOrbit;

  Planet(int i, int j, int s, color colour, int orbitX, int orbitY, float angle, boolean hasOrbit)
  {
    super(new PVector(i, j), s, colour);
    this.orbitPoint = new PVector(orbitX, orbitY);
    this.angle = angle;
    this.hasOrbit = hasOrbit;
  }

  void draw()
  {
    super.draw();   
    ellipse(pos.x, pos.y, size, size);
  }

  void update()
  {
    if (hasOrbit)
    {
      PVector tempPoint = new PVector(-orbitPoint.x, -orbitPoint.y);
      PVector tempPosPoint = PVector.add(pos, tempPoint);
      tempPosPoint.rotate(angle);
      tempPosPoint.add(orbitPoint);
      pos = tempPosPoint;
    }
  }
}

