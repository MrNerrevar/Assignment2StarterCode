class Bullet 
{
  float x, y;

  Bullet(float xpos, float ypos) {
    x = xpos + 5;
    y = ypos;
  }

  void draw() {
    ellipse(x, y, 2, 5);
    y -= 5;
  }
}

