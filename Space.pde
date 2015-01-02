import java.util.Random;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

class Space
{
  int seed;
  List<SpaceBody> bodies;

  int START = 40;
  int SPREAD = 80;
  int PLANETS = 15;
  int TWINKLE = 300;
  int ASTEROIDS = 1;

  Space()
  {
    this(15);
  }

  Space(int i)
  {
    this.seed = i;
    this.bodies = new ArrayList<SpaceBody>();
  }

  void generate()
  {
    Random rand = new Random(seed);
    int size = START + rand.nextInt(SPREAD);

    for (int i = 0; i < size; i++)
    {
      bodies.add(new Star(rand.nextInt(width), rand.nextInt(height), rand.nextInt(TWINKLE) + 1));
    }

    for (int i = 0; i < PLANETS; i++)
    {
      bodies.add(new Planet(rand.nextInt(width), rand.nextInt(height), rand.nextInt(10) + 1, color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255)), rand.nextInt(width), rand.nextInt(height), rand.nextFloat()*0.001F, rand.nextBoolean()));
    }

    for (int i = 0; i < ASTEROIDS; i++)
    {
      bodies.add(new Asteroid(color(45, 45, 45), 10));
    }
  }

  void update()
  {
    for (SpaceBody body : bodies) 
    {
      body.update();
    }
  }

  void draw()
  {
    this.drawBackground();
    this.drawBodies();
  }

  boolean isOnScreen(PVector pos)
  {
    return pos.x >= 0 && pos.y >= 0 && pos.x < width && pos.y < height;
  }
  
  void drawBodies()
  {
    for (SpaceBody asteroid : bodies)
    {
      if (isOnScreen(asteroid.pos))
        asteroid.draw();
    }
  }

  void drawBackground()
  {
    background(0);
  } 
}

