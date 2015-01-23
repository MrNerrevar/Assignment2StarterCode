class Enemy extends Entity
{
  PVector enemySpawn; 
  
  Enemy()
  {
    enemySpawn = new PVector(width/2, (height/2)-300);
  } 
  
  void update()
  {
  }
  
  void display()
  {
    PShape fighter = createShape();
    
    fighter.beginShape();
    fighter.fill(80);
    fighter.stroke(60);
    
    fighter.vertex(0, 0);
    fighter.vertex(-4, 0);
    fighter.vertex(-5, 1);
    fighter.vertex(-6, 2);
    fighter.vertex(-8, 3);
    fighter.vertex(-10, 4);
    fighter.vertex(-11, 5);
    fighter.vertex(-13, 6);
    fighter.vertex(-14, 7);
    fighter.vertex(-15, 8);
    fighter.vertex(-19, 9);
    fighter.vertex(-20, 13);
    fighter.vertex(-43, 18);
    fighter.vertex(-46, 16);
    fighter.vertex(-48, -7);
    fighter.vertex(-60, -50);
    fighter.vertex(-76, -18);
    fighter.vertex(-65, 58);
    fighter.vertex(-52, 88);
    fighter.vertex(-43, 43);
    fighter.vertex(-45, 23);
    fighter.vertex(-20, 28);
    fighter.vertex(-16, 34);
    fighter.vertex(-10, 37);
    fighter.vertex(-7, 40);
    fighter.vertex(-7, 44);
    fighter.vertex(-4, 44);
    fighter.vertex(-4, 40);
    
    fighter.vertex(0, 40); // Center
    
    fighter.vertex(4, 40);
    fighter.vertex(4, 44);
    fighter.vertex(7, 44);
    fighter.vertex(7, 40);
    fighter.vertex(10, 37);
    fighter.vertex(16, 34);
    fighter.vertex(20, 28);
    fighter.vertex(45, 23);
    fighter.vertex(43, 43);
    fighter.vertex(52, 88);
    fighter.vertex(65, 58);
    fighter.vertex(76, -18);
    fighter.vertex(60, -50);
    fighter.vertex(48, -7);
    fighter.vertex(46, 16);
    fighter.vertex(43, 18);
    fighter.vertex(20, 13);
    fighter.vertex(19, 9);
    fighter.vertex(15, 8);
    fighter.vertex(14, 7);
    fighter.vertex(13, 6);
    fighter.vertex(11, 5);
    fighter.vertex(10, 4);
    fighter.vertex(8, 3);
    fighter.vertex(6, 2);
    fighter.vertex(5, 1);
    fighter.vertex(4, 0);
    fighter.vertex(0, 0);
    
    fighter.endShape(CLOSE);
    
    fighter.translate(pos.x, pos.y);
    fighter.scale(0.4);
    shape(fighter);
  }
}
