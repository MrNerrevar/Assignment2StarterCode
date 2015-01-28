class DeathStar extends Entity
{
  PShape deathStar;

  DeathStar()
  {
    super(new PVector((width/2), (height/2)-(height*0.4)));
    this.initShape();
  }

  void update()
  {
  }

  boolean collided(Bullet b)
  {
    return false;
  }

  void initShape()
  {
    fill(60);
    stroke(55);
    deathStar = createShape(GROUP);

    PShape body = createShape();
    body.beginShape();

    body.fill(10, 10, 15);
    body.stroke(10, 0, 15);

    body.vertex(-4, -28);
    body.vertex(-10, -26);
    body.vertex(-18, -21);
    body.vertex(-22, -16);
    body.vertex(-25, -11);
    body.vertex(-27, -6);
    body.vertex(-28, -4);

    body.vertex(-28, 4);
    body.vertex(-27, 6);
    body.vertex(-25, 11);
    body.vertex(-22, 16);
    body.vertex(-18, 21);
    body.vertex(-10, 26);
    body.vertex(-4, 28);

    body.fill(40, 40, 45);
    body.stroke(40, 40, 45);

    body.vertex(4, 28);
    body.vertex(10, 26);
    body.vertex(18, 21);
    body.vertex(22, 16);
    body.vertex(25, 11);
    body.vertex(27, 6);
    body.vertex(28, 4);

    body.fill(80);
    body.stroke(70);

    body.vertex(28, -4);
    body.vertex(27, -6);
    body.vertex(25, -11);
    body.vertex(22, -16);
    body.vertex(18, -21);
    body.vertex(10, -26);
    body.vertex(4, -28);
    body.endShape(CLOSE);

    PShape contour = createShape(ELLIPSE, 4, -15, 15, 15);
    /*contour.beginShape();
     contour.fill(60);
     contour.endShape(CLOSE);*/

    deathStar.addChild(body);
    deathStar.addChild(contour);

    deathStar.translate(pos.x, pos.y);
    deathStar.scale(2);
  }

  void display()
  {
    shape(deathStar);
  }
}

