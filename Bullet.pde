class Bullet
{
  PVector pos;
  float angle;
  int velocity = 5;

  Bullet(float xpos, float ypos, float angle)
  {
    this.pos = new PVector(xpos + velocity, ypos);    
    this.angle = angle;
  }

  void draw()
  {
    fill(0, 250, 0);
    stroke(0, 250, 0);
    ellipse(pos.x, pos.y, 2, 5);

    pos.x = pos.x + (float)(velocity*Math.cos(angle));
    pos.y = pos.y + (float)(velocity*Math.sin(angle));
  }
}

