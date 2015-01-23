/*
    DIT OOP Assignment 2 Starter Code
 =================================
 
 Loads player properties from an xml file
 See: https://github.com/skooter500/DT228-OOP 
 */

ArrayList<Entity> players = new ArrayList<Entity>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Entity> enemies = new ArrayList<Entity>();
boolean[] keys = new boolean[526];
PVector enemySpawn;
Space space = new Space(653928);
DeathStar deathstar = new DeathStar();

boolean devMode = true;
boolean sketchFullScreen() 
{
  return ! devMode;
}

void setup()
{
  if (devMode)
  {
    size(1000, 700, P2D);
  } else
  {
    size(displayWidth, displayHeight, P2D);
  }

  smooth();
  enemySpawn = new PVector(width/2, (height/2)-((height/10)*4));
  space.generate();
  setUpPlayerControllers();
}

void draw()
{
  space.draw();
  space.update();

  deathstar.display();
  deathstar.update();

  //println(frameRate);

  //if(frameRate > 55)
  //{  
  
  //}

  //stroke(0, 0, 255);
  //ellipse(500, 300, width-50, height+130);

  for (Entity player : players)
  {
    player.update();
    player.display();
  }
  
  for (Entity enemy : enemies)
  {
    enemy.update();
    enemy.display();
  }

  Iterator<Bullet> iterator = bullets.iterator();
  while (iterator.hasNext ())
  {    
    Bullet b = iterator.next();
    if (b.isOnScreen())
    {
      b.draw();
    } else
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
    p.pos.x = (width*0.15) + ((width*0.7) * i);
    p.pos.y = (height*0.814);
    players.add(p);
    
    Enemy e = new Enemy();
    e.pos.x = width/2;
    e.pos.y = height/2;
    enemies.add(e);
  }
}

