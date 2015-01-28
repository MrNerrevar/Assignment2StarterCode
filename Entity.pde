abstract class Entity
{
  PVector pos;
  boolean isAlive;
  color colour;
  boolean canShoot;

  Entity(PVector pos)
  {
    this.isAlive = true;
    this.canShoot = true;
    this.pos = pos;
  }


  void rotateEntity(float angle, PVector rotatePoint)
  {
    PVector orbitPointToOrigin = new PVector(-rotatePoint.x, -rotatePoint.y);
    PVector PosPointToOrigin = PVector.add(pos, orbitPointToOrigin );
    PosPointToOrigin.rotate(angle);
    PosPointToOrigin.add(rotatePoint);
    pos = PosPointToOrigin;
  }

  float getAngle(PVector pointPos, int i)
  {
    switch(i)
    {
    case 0:
      return (float) (Math.atan((pointPos.y - pos.y)/(pointPos.x - pos.x)) + Math.PI/2);  
    case 1:
      return (float) (Math.atan((pointPos.y - pos.y)/(pointPos.x - pos.x)) - Math.PI/2);
    }
    return 0;
  }

  float getRawAngle(PVector pointPos, int i)
  {
    return (float) ( (Math.atan((pointPos.y - pos.y)/(pointPos.x - pos.x))) + i*Math.PI);
  }
  
  abstract boolean collided(Bullet b);
  
  abstract void update();

  abstract void display();
}

