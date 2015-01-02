class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  boolean canShoot = true;
  int shootDelay = 0;
  float angle = 0;
  PVector orbitPoint;

  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }

  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;

    if (this.index == 0)
    {
      this.orbitPoint = new PVector((width/2)+50, (height/2)-170);
    } else if (this.index == 1)
    {
      this.orbitPoint = new PVector((width/2)-50, (height/2)-170);
    }
  }

  Player(int index, color colour, XML xml)
  {
    this(index
      , colour
      , buttonNameToKey(xml, "up")
      , buttonNameToKey(xml, "down")
      , buttonNameToKey(xml, "left")
      , buttonNameToKey(xml, "right")
      , buttonNameToKey(xml, "start")
      , buttonNameToKey(xml, "button1")
      , buttonNameToKey(xml, "button2")
      );
  }

  void update()
  {
    if (checkKey(up))
    {
      pos.y -= 3;
    }
    if (checkKey(down))
    {
      pos.y += 3;
    }
    if (checkKey(left) && this.pos.y >= height/2 && this.pos.y <= height-50)
    {
      angle = 0.01F;
    } 
    else if (checkKey(right) && this.pos.y >= height/2 && this.pos.y <= height-50)
    {
      angle = -0.01F;
    } 
    else
    {
      angle = 0;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1) && canShoot)
    {
      println("Player " + index + " button 1");  
      bullets.add(new Bullet(pos.x-4, pos.y-25, getRawAngle(index)));
      canShoot = false;
      shootDelay = 0;
    }
    if (checkKey(button2))
    {
      println("Player " + index + " button2");
    }

    shootDelay++;
    if (shootDelay >= 10) 
    {
      canShoot = true;
    }

    rotatePlayer(angle);
  }
  
  float getAngle()
  {
    return getAngle(index);
  }
 
  float getRawAngle(int i)
  {
    return (float) ( (Math.atan((enemySpawn.y - pos.y)/(enemySpawn.x - pos.x))) + i*Math.PI );
  }
 
  float getAngle(int i)
  {
    switch(i)
    {
    case 0:
      return (float) (Math.atan((enemySpawn.y - pos.y)/(enemySpawn.x - pos.x)) + Math.PI/2);  
    case 1:
      return (float) (Math.atan((enemySpawn.y - pos.y)/(enemySpawn.x - pos.x)) - Math.PI/2);
    }
    return 0;
  }

  void rotatePlayer(float angle)
  {
    stroke(0, 250, 0);
    ellipse(orbitPoint.x, orbitPoint.y, 10, 10);
    PVector orbitPointToOrigin = new PVector(-orbitPoint.x, -orbitPoint.y);
    PVector PosPointToOrigin = PVector.add(pos, orbitPointToOrigin );
    PosPointToOrigin .rotate(angle);
    PosPointToOrigin .add(orbitPoint);
    pos = PosPointToOrigin;
  }

  void display()
  {    
    stroke(colour);
    fill(colour);    

    PShape ship = createShape();

    ship.beginShape();
    ship.stroke(colour);
    ship.vertex(-2, 0);
    ship.vertex(-6, 18);
    ship.vertex(-12, 102);
    ship.vertex(-20, 102);
    ship.vertex(-20, 106);
    ship.vertex(-58, 106);
    ship.vertex(-58, 100);
    ship.vertex(-60, 100);
    ship.vertex(-60, 48);
    ship.vertex(-62, 48);
    ship.vertex(-62, 100);
    ship.vertex(-64, 100);
    ship.vertex(-64, 128);
    ship.vertex(-20, 138);
    ship.vertex(-20, 136);
    ship.vertex(-18, 136);
    ship.vertex(-18, 158);
    ship.vertex(-10, 158);
    ship.vertex(-10, 140);
    ship.vertex(10, 140);
    ship.vertex(10, 158);
    ship.vertex(18, 158);
    ship.vertex(18, 136);
    ship.vertex(20, 136);
    ship.vertex(20, 138);
    ship.vertex(64, 128);
    ship.vertex(64, 100);
    ship.vertex(62, 100);
    ship.vertex(62, 48);
    ship.vertex(60, 48);
    ship.vertex(60, 100);
    ship.vertex(58, 100);
    ship.vertex(58, 106);
    ship.vertex(20, 106);
    ship.vertex(20, 102);
    ship.vertex(12, 102);
    ship.vertex(6, 18);
    ship.vertex(2, 0);
    ship.endShape(CLOSE);

    ship.translate(pos.x, pos.y-25);
    ship.scale(0.5);
    ship.rotate(getAngle());
    shape(ship);

    //rect(pos.x, pos.y, 20, 20);
  }
}

