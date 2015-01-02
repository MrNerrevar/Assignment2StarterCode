/*
    DIT OOP Assignment 2 Starter Code
 =================================
 
 Loads player properties from an xml file
 See: https://github.com/skooter500/DT228-OOP 
 */

ArrayList<Entity> players = new ArrayList<Entity>();
boolean[] keys = new boolean[526];
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
PVector enemySpawn;

Space space = new Space(653928);

void setup()
{
  size(1000, 750, P2D);
  smooth();
  enemySpawn = new PVector(width/2, (height/2)-300);
  space.generate();
  setUpPlayerControllers();
}

void draw()
{
  space.draw();
  
  println(frameRate);
  
  if(frameRate > 55)
  {  
    space.update();
  }

  //stroke(0, 0, 255);
  //ellipse(500, 300, width-50, height+130);

  for (Entity player : players)
  {
    player.update();
    player.display();
  }

  Iterator<Bullet> iterator = bullets.iterator();
  while(iterator.hasNext())
  {    
    Bullet b = iterator.next();
    if(b.isOnScreen())
    {
      b.draw();
    }
    else
    {
      iterator.remove();
    } 
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }

  //.. Others to follow
  return value.charAt(0);
}

void setUpPlayerControllers()
{
  color playerColour;
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);

  for (int i = 0; i < children.length; i ++)  
  {
    //Condition to define the player colour
    if (i==0)
    {
      playerColour = color(0, 0, 250);
    } else
    {
      playerColour = color(250, 0, 0);
    }


    XML playerXML = children[i];
    Player p = new Player(i, playerColour, playerXML);
    int x = (i + 1) * gap;
    p.pos.x = 150 + (700 * i);
    p.pos.y = 570;
    players.add(p);
  }
}

