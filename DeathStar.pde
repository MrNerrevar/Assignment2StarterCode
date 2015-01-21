class DeathStar extends Entity
{
  
  DeathStar()
  {
  }
  
  void update()
  {
  }
  
  void display()
  {
    PShape deathStar = createShape();
    
    deathStar.beginShape();
    deathStar.vertex(-7, 0);
    deathStar.vertex(-8, 1);
    deathStar.vertex(-12, 1);
    deathStar.vertex(-13, 2);
    deathStar.vertex(-15, 2);
    deathStar.vertex(-16, 3);
    deathStar.vertex(-18, 3);
    deathStar.vertex(-19, 4);
    deathStar.vertex(-20, 4);
    deathStar.vertex(-21, 5);
    deathStar.vertex(-22, 5);
    deathStar.vertex(-23, 6);
    deathStar.vertex(-24, 6);
    deathStar.vertex(-25, 7);
    deathStar.vertex(-26, 7);
    deathStar.vertex(-27, 8);
    deathStar.vertex(-28, 8);
    deathStar.vertex(-29, 9);
    deathStar.vertex(-30, 10);
    
    deathStar.endShape(CLOSE);
    
    deathStar.translate(width/2, (height/2)-((height/10)*4));
    shape(deathStar);
    
  }
  
}
