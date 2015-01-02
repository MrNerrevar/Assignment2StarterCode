class Star extends SpaceBody
{  
  boolean twinkle;
  int twinkleMax;
  Random rand;

  Star(int i, int j, int max)
  {
    super(new PVector(i, j), 1, color(200, 200, 200));    
    this.twinkle = false;
    this.twinkleMax = 3*max;
    rand = new Random();
  }

  void draw()
  {
    super.draw();
    if (twinkle)
    {
      rect(pos.x-1, pos.y-1, 3, 3);
    } else
    {
      rect(pos.x, pos.y, 1, 1);
    }
  }

  void update()
  {
    twinkle = (rand.nextInt(twinkleMax) == 0);
  }
}

