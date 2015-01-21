class DeathStar extends Entity
{

  DeathStar()
  {
  }

  void update()
  {
    
  }

  void display()
  {
    PShape deathStar = createShape(GROUP);

    PShape body = createShape();
    body.beginShape();
    body.fill(80);
    body.stroke(70);
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
    body.vertex(4, 28);
    body.vertex(10, 26);
    body.vertex(18, 21);
    body.vertex(22, 16);
    body.vertex(25, 11);
    body.vertex(27, 6);
    body.vertex(28, 4);
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

    deathStar.translate(width/2, (height/2)-((height/10)*4));
    deathStar.scale(2);
    shape(deathStar);
  }
}


