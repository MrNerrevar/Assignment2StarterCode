import java.util.Random;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

class Space
{
  int seed;
  List<Star> stars;
  List<Planet> planets;

  int START = 20;
  int SPREAD = 80;
  int PLANETS = 10;

  Space()
  {
    this.seed = 15;
    this.stars = new ArrayList<Star>();
    this.planets = new ArrayList<Planet>();
  }

  Space(int i)
  {
    this.seed = i;
    this.stars = new ArrayList<Star>();
    this.planets = new ArrayList<Planet>();
  }

  void generate()
  {
    Random rand = new Random(seed);
    int size = START + rand.nextInt(SPREAD);

    for (int i = 0; i < size; i++)
    {
      stars.add(new Star(rand.nextInt(width), rand.nextInt(height), 1));
    }

    for (int i = 0; i < PLANETS; i++)
    {
      planets.add(new Planet(rand.nextInt(width), rand.nextInt(height), rand.nextInt(10) + 1, color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255))));
    }
  }

  void draw()
  {
    this.drawBackground();
    this.drawStars();
    this.drawPlanets();
  }

  void drawBackground()
  {
    background(0);
  }

  void drawStars()
  {
    for (Star star : stars)
    {
      star.draw();
    }
  }

  void drawPlanets()
  {
    for (Planet planet : planets) 
    { 
      planet.draw();
    }
  }
}

