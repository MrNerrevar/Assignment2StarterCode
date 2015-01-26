/*
    DIT OOP Assignment 2 Starter Code
 =================================
 
 Loads player properties from an xml file
 See: https://github.com/skooter500/DT228-OOP 
 */

ArrayList<Entity> players;
ArrayList<Bullet> bullets;
boolean[] keys = new boolean[526];
PVector ENEMY_SPAWN;
Space space;
DeathStar deathstar;
EnemySpawner spawner;

boolean devMode = true;
boolean sketchFullScreen() 
{
  return ! devMode;
}

PVector getEnemySpawn()
{
  return new PVector(ENEMY_SPAWN.x, ENEMY_SPAWN.y);
}

void setup()
{
  
  ENEMY_SPAWN = new PVector(width/2, (height/2)-((height*0.4)));
  space = new Space(653928);
  deathstar = new DeathStar();
  spawner = new EnemySpawner();
  bullets = new ArrayList<Bullet>();
  players = new ArrayList<Entity>();
  
  if (devMode)
  {
    size(1000, 700, P2D);
  } else
  {
    size(displayWidth, displayHeight, P2D);
  }

  smooth();
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

  for (Entity player : players)
  {
    player.update();
    player.display();
  }

  spawner.update(players.get(0), getEnemySpawn());
  spawner.display();

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
    players.add(p);
  }
}

void checkCollision()
{
   for(Enemy e : spawner.enemies)
     for(Bullet b : bullets)
     {
       if(e.collided(b))
        e.isAlive = false; 
     }
}
