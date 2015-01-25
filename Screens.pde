PImage splash;

void setupScreens()
{
  splash = loadImage("splash.png");
}

void displayScreens()
{
  if (splashScreen == true)
  {
    displaySplash();
  }
  
  if (mainScreen == true)
  {
    displayMain();
  }
}

void displaySplash()
{
  image(splash, 0, 0);
}



