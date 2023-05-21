class whale extends enemy
{
  PImage upLeftWhale, upRightWhale;
  
  boolean crash(whale other)
  {
    return (sqrt((this.x - other.x)*(this.x - other.x)) <= 50  &&  sqrt((this.y-other.y)*(this.y-other.y)) <= 50);
  }

  whale(int x, int y, int speedX, int speedY)
  {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    upLeftWhale = loadImage("upLeftWhale.png"); //loads from .pde source code directory
    upRightWhale = loadImage("upRightWhale.png");
    upLeftWhale.resize(60, 100);
    upRightWhale.resize(60, 100);
  }
  
  void update()
  {
    move();
    render();
  }

  void render()
  {
    if (speedX <= 0)
    {
      image(upLeftWhale, x, y);
    } else if (speedX >= 0)
    {
      image(upRightWhale, x, y);
    }
  }
}
