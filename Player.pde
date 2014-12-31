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
    if (checkKey(left))
    {
      pos.x -= 3;
    }    
    if (checkKey(right))
    {
      pos.x += 3;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " button2");
    }
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
    
    translate(pos.x, pos.y);
    shape(ship);
  }
  
  
}

