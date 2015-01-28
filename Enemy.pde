class Enemy extends Entity
{
  PVector playerSpawn;
  float velocity = 3;
  PShape fighter;
  PVector lastPos;

  Enemy(PVector pos, PVector spawn)
  {
    super(pos);
    this.playerSpawn = spawn;
    this.lastPos = new PVector();
    this.initShape();
  }

  void update()
  {
    update(velocity);
  }

  void update(float velocity)
  {
    PVector direction = PVector.sub(playerSpawn, pos);
    direction.normalize();
    direction.mult(velocity);    

    pos.add(direction);
    fighter.translate(direction.x, direction.y);
  }

  boolean collided(Bullet b)
  {
    return Math.pow((b.pos.x - pos.x), 2)/Math.pow(24 + 14, 2) + Math.pow((b.pos.y - pos.y), 2)/Math.pow(12, 2) <= 1;
  }

  void initShape()
  {
    fighter = createShape();

    fighter.beginShape();
    fighter.fill(40, 40, 42);
    fighter.stroke(0);   

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
    
    fighter.fill(80, 80, 85);

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

    fighter.fill(40, 40, 42);

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
    fighter.scale(0.35);
  }

  void display()
  {
    shape(fighter);
  }
}

