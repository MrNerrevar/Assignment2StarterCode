class EnemySpawner
{
  ArrayList<Enemy> enemies;
  int timer;
  int MAX_DELAY = 30;
  int MAX_ENEMIES = 5;
  PVector currentPos;
  int index = 0;
  int level = 1;

  EnemySpawner()
  {
    enemies = new ArrayList<Enemy>();
    currentPos = new PVector(width/2, (height/2)-(height*0.4));
    timer = 0;
  }

  void update(List<Entity> list, PVector eSpawn)
  {
    if (MAX_DELAY < timer && MAX_ENEMIES > enemies.size())
    {
      int i = (int) random(0, list.size());
      Entity e = list.get(i);
      PVector p = new PVector(e.pos.x, e.pos.y);

      if((level = ((Player) e).score/10) > 1)
        level(level);
      else
        level(level = 1);

      switch((int) random(0, 3))
      {
      case 0:
        p.x = (i == 0) ? 0 : width;
        break;
      case 1:
        p.y = height;
        break;
      case 2:
        p.x = (i == 0) ? 0 : width;
        p.y = height;
        break;
      }

      enemies.add(new Enemy(eSpawn, p));
      timer = 0;
    }
    timer++;
  }

  void level(int i)
  {
    MAX_DELAY = 30 - (i + 1) * 5;
    MAX_ENEMIES = (i + 1) * 5;
  }

  void display()
  {
    Iterator<Enemy> iterator = enemies.iterator();
    while (iterator.hasNext ())
    {    
      Enemy e = iterator.next();
      if (e.isAlive && !hasTerminated(e) && !hasPlayerCollided(e))
      {
        e.update();
        e.display();
      } else
      {
        clips[1].loop(1);
        iterator.remove();
      }
    }
  }

  boolean hasTerminated(Enemy e)
  {
    boolean flag = e.pos.x <= 0;
    boolean flag2 = e.pos.x >= width;  
    if (flag || flag2 || e.pos.y >= height)
    {      
      if (flag)
      {
        ((Player) players.get(0)).score -= 2;
      } else if (flag2)
      {
        ((Player) players.get(1)).score -= 2;
      }
      return true;
    }
    return false;
  }

  boolean hasPlayerCollided(Enemy e)
  {
    boolean flag = false;
    for (Entity p : players)
    {
      if ( ((Player) p).collided(e.pos))
      {
        flag = true;
        Player player = (Player) p;
        player.score -= 10;
      }
    }
    return flag;
  } 

  boolean bulletCollide(Bullet b)
  {
    for (Enemy e : enemies)
    {
      if (e.collided(b))
      {
        e.isAlive = false;
        ((Player) players.get(b.index)).score += 1;
        return true;
      }
    }
    return false;
  }
} 

