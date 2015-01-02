class Asteroid extends SpaceBody
{
  float angle;
  int velocity;

  Asteroid(color c, int s)
  {
    super(new PVector(), s, c);
    this.angle = 0;
    this.velocity = 0;
    this.regenerate();
  }

  void draw()
  {
    super.draw();   
    ellipse(pos.x, pos.y, size, size);
  }
  
  void update()
  {
    pos.x = pos.x + (float)(velocity*Math.cos(angle));
    pos.y = pos.y + (float)(velocity*Math.sin(angle));
    
    if(hasDied() && new Random().nextInt(50) == 0)
      regenerate();
  }
  
  boolean hasDied()
  {
    return (pos.x < 0 || pos.y < 0 || pos.x >= width || pos.y >= height); 
  }
  
  void regenerate()
  {
    Random rand = new Random(); 
  
    if(rand.nextFloat() < 0.5F)
    {
      pos = new PVector(rand.nextInt(2) * width, rand.nextInt(height));
      angle = rand.nextFloat();
    }
    else
    {
      pos = new PVector(rand.nextInt(width), rand.nextInt(2) * height);
      angle = -1.0F * rand.nextFloat();
    }    
    velocity = rand.nextInt(10) + 10;   
  }
}

