PImage splash;
PImage gameOver;
boolean splashScreen;
boolean gameScreen;
boolean gameOverScreen;

void setupScreens()
{
  splash = loadImage("splash.png");
  gameOver = loadImage("gameOver.png");
}

void displaySplash()
{ 
  clips[2].loop(1);
  splash.resize(width, height);
  image(splash, 0, 0);

  /*fill(255,255,0);
   textAlign(CENTER);
   textSize(60);
   
   text("X-Wing", width/2, height*0.1);
   text("VS", width/2, height*0.2);
   text("Tie Fighter", width/2, height*0.3);
   textSize(30);
   text("(Kind of)", width/2, height*0.37);
   */

  if (keyPressed && key == ENTER)
  {
    splashScreen = false;
    gameScreen = true;
  }
}

void displayGameOver()
{
  clips[2].stop();
  clips[3].loop(1);

  gameOver.resize(width, height);
  image(gameOver, 0, 0);

  for (Entity player : players)
  {
    drawWinningScore((Player) player);
  }
  
  if (keyPressed && key == ENTER)
  {
    setup();
    clips[3].stop();
    clips[2].loop(10);
    splashScreen = false;
    gameOverScreen = false;
    gameScreen = true;
  }
}

void drawWinningScore(Player p)
{
  fill(255, 255, 0);
  textAlign(CENTER);
  textSize(60);

  if (blueWin = true)
  {
    text("Blue Leader Wins", width/2, height*0.6);
  }
  else if (redWin = true)
  {
    text("Blue Leader Wins", width/2, height*0.6);
  }
  
  fill(p.colour);
  float h = (p.index == 0) ? height*0.7f : height*0.8f;
  text("Score : " + p.score, width/2, h);
}

