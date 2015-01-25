class EnemySpawner
{
  ArrayList<Enemy> enemies;
  int timer;
  final int MAX_DELAY = 60;
  final int MAX_ENEMIES = 10;
  PVector currentPos;
  int index = 0;


  EnemySpawner()
  {
    enemies = new ArrayList<Enemy>();
    currentPos = new PVector(width/2, (height/2)-(height*0.4));
    timer = 0;
  }

  void update(Entity p, PVector eSpawn)
  {
    if (MAX_DELAY < timer && MAX_ENEMIES > enemies.size())
    {
      enemies.add(new Enemy(eSpawn, p.pos));
      timer = 0;
    }
    timer++;
  }

  void display()
  {
    Iterator<Enemy> iterator = enemies.iterator();
    while (iterator.hasNext ())
    {    
      Enemy e = iterator.next();
      if (e.isAlive)
      {
        e.update();
        e.display();        
      } else
      {
        iterator.remove();
      }
    }
  }
} 

