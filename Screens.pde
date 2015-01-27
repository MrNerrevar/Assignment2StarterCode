PImage splash;
PImage gameOver;
boolean splashScreen = true;
boolean gameOverScreen;

void setupScreens()
{
  splash = loadImage("splash.png");
  gameOver = loadImage("gameOver.png");
}

void displayScreens()
{
  if (splashScreen == true)
  {
    displaySplash();
  }
  
  if (gameOverScreen == true)
  {
    displayGameOver();
  }
}

void displaySplash()
{ 
  image(splash, 0, 0);
  
  if (keyPressed == true)
  {
    splashScreen = false;
  }
}

void displayGameOver()
{
  image(gameOver, 0, 0);
}
