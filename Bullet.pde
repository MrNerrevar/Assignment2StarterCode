class Bullet 
{
  float x, y;

  Bullet(float xpos, float ypos) {
    x = xpos + 5;
    y = ypos;
  }

  void draw() 
  {
    fill(0, 250, 0);
    stroke(0, 250, 0);
    ellipse(x, y, 2, 5);
    y -= 5;
  }
}

