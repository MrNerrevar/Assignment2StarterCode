class Player extends Entity
{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  int shootDelay = 0;
  int shootCounter = 30;
  float angle = 0;
  PVector orbitPoint;
  PShape ship;
  int score;
  int lives = 3;

  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    super(new PVector((width*0.15) + ((width*0.7) * index), (height*0.814)));
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
    this.score = 0;

    if (this.index == 0)
    {
      this.orbitPoint = new PVector((width/2)+50, (height/2)-(height*0.243));
    } else if (this.index == 1)
    {
      this.orbitPoint = new PVector((width/2)-50, (height/2)-(height*0.243));
    }
    this.initShape();
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
    boolean leftLimit; 
    boolean rightLimit;

    switch(index)
    {
    case 0:
      leftLimit = this.pos.y < (height/2)+(height*0.2);
      rightLimit = this.pos.y >= height-(height*0.0714);
      break;
    default:
      rightLimit = this.pos.y < (height/2)+(height*0.2);
      leftLimit = this.pos.y >= height-(height*0.07);
      break;
    }

    if (checkKey(left) && !leftLimit)
    {
      angle = 0.01F;
    } else if (checkKey(right) && !rightLimit)
    {
      angle = -0.01F;
    } else
    {
      angle = 0;
    }
    if (checkKey(start))
    {
    }
    if (checkKey(button1) && canShoot)
    {
      float theta = getRawAngle(index);
      float xOffset = 4;
      float yOffset = 25;

      bullets.add(new Bullet(pos.x - xOffset, pos.y - yOffset, theta, index));
      clips[0].loop(1);
      canShoot = false;
      shootDelay = 0;
    }
    if (checkKey(button2))
    {
    }

    shootDelay++;
    if (shootDelay >= shootCounter) 
    {
      canShoot = true;
    }

    rotateEntity(angle);
  }

  void rotateEntity(float angle)
  {
    rotateEntity(angle, orbitPoint);
  }

  float getAngle()
  {
    return getAngle(index);
  }

  float getRawAngle(int i)
  {
    return getRawAngle(getEnemySpawn(), i);
  }

  float getAngle(int i)
  {
    return getAngle(getEnemySpawn(), i);
  }

  public boolean collided(Bullet b)
  {
    return collided(b.pos);
  }

  public boolean collided(PVector bpos)
  {
    return Math.pow((bpos.x - pos.x +30 ), 2)/Math.pow(30, 2) + Math.pow((bpos.y - pos.y), 2)/Math.pow(60, 2) <= 1;
  }

  void initShape()
  {
    ship = createShape();

    ship.beginShape(); 
    ship.stroke(100, 100, 100);
    ship.fill(150, 150, 150);     

    ship.vertex(-2, 0);
    ship.vertex(-6, 18);
    ship.vertex(-12, 102);
    ship.vertex(-20, 102);
    ship.vertex(-20, 106);
    ship.vertex(-58, 106);
    ship.vertex(-58, 100);
    ship.vertex(-60, 100);

    ship.stroke(colour);
    ship.fill(colour);    
    ship.vertex(-60, 48);
    ship.vertex(-62, 48);
    ship.stroke(100, 100, 100);
    ship.fill(150, 150, 150); 

    ship.vertex(-62, 100);
    ship.vertex(-64, 100);
    ship.vertex(-64, 128);
    ship.vertex(-20, 138);
    ship.vertex(-20, 136);
    ship.vertex(-18, 136);
    ship.vertex(-18, 158);

    ship.stroke(colour);
    ship.fill(colour);
    ship.vertex(-10, 158);
    ship.vertex(-10, 140);
    ship.vertex(10, 140);
    ship.vertex(10, 158);

    ship.stroke(100, 100, 100);
    ship.fill(150, 150, 150); 

    ship.vertex(18, 158);
    ship.vertex(18, 136);
    ship.vertex(20, 136);
    ship.vertex(20, 138);
    ship.vertex(64, 128);
    ship.vertex(64, 100);
    ship.vertex(62, 100);

    ship.stroke(colour);
    ship.fill(colour); 
    ship.vertex(62, 48);
    ship.vertex(60, 48);
    ship.stroke(100, 100, 100);
    ship.fill(150, 150, 150);
    
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
  }

  void display()
  {
    this.initShape();
    shape(ship);
  }
}

