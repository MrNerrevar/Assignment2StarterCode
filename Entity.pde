abstract class Entity
{
  PVector pos;
  boolean isAlive;
  color colour;
  boolean canShoot;
  
  Entity()
  {
    isAlive = true;
    canShoot = true;
    pos = new PVector(width/2, height/2);
  }
  
  abstract void update();

  abstract void display();
}
