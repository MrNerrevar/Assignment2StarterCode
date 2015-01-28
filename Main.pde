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
int skipFrame;
boolean blueWin;
boolean redWin;

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
  if (devMode)
  {
    size(1000, 700, P2D);
  } else
  {
    size(displayWidth, displayHeight, P2D);
  } 
  
  blueWin = false;
  redWin = false;

  splashScreen = true;
  gameScreen = false;
  gameOverScreen = false;

  setupScreens();
  setupAudio();

  ENEMY_SPAWN = new PVector(width/2, (height/2)-((height*0.4)));
  space = new Space(653928);
  deathstar = new DeathStar();
  spawner = new EnemySpawner();
  bullets = new ArrayList<Bullet>();
  players = new ArrayList<Entity>();
  skipFrame = 0;
  smooth();
  space.generate();
  setUpPlayerControllers();
}

void draw()
{
  if (splashScreen == true && gameScreen == false && gameOverScreen == false)
  {
    displaySplash();
  }

  if (gameScreen == true && splashScreen == false && gameOverScreen == false)
  {
    clips[3].stop();
    drawGame();
  }

  if (gameOverScreen == true && splashScreen == false && gameScreen == false)
  {
    displayGameOver();
  }
}

void drawGame()
{
  space.draw();
  
  if (skipFrame == 1)
  {
    space.update();
    skipFrame = 0;
  }  

  deathstar.display();
  deathstar.update();

  for (Entity player : players)
  {
    player.update();
    player.display();
    drawScore((Player) player);
  }

  spawner.update(players, getEnemySpawn());
  spawner.display();

  Iterator<Bullet> iterator = bullets.iterator();
  while (iterator.hasNext ())
  {    
    Bullet b = iterator.next();
    if (b.isOnScreen())
    {      
      b.draw();
      if (spawner.bulletCollide(b))
        iterator.remove();
    } else
    {
      iterator.remove();
    }
  }

  skipFrame++;
  println(frameRate);
}

void drawScore(Player p)
{
  fill(p.colour);
  float w = (p.index == 0) ? width*0.05f : width*0.85f;
  textSize(30);  
  text("Score : " + p.score, w, height*0.1f);
  text("Lives : " + p.lives, w, height*0.2f);
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
  for (Enemy e : spawner.enemies)
    for (Bullet b : bullets)
    {
      if (e.collided(b))
        e.isAlive = false;
    }
}

