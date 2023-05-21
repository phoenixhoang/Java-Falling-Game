class turtle extends enemy
{
  PImage upLeftTurtle, upRightTurtle;
  
  boolean crash(turtle other)
  {
    return (sqrt((this.x - other.x)*(this.x - other.x)) <= 50  &&  sqrt((this.y-other.y)*(this.y-other.y)) <= 50);
  }

  turtle(int x, int y, int speedX, int speedY)
  {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    upLeftTurtle = loadImage("seaTurtleLeft.png"); //loads from .pde source code directory
    upRightTurtle = loadImage("seaTurtleRight.png");
    upLeftTurtle.resize(50, 75);
    upRightTurtle.resize(50, 75);
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
      image(upLeftTurtle, x, y);
    } else if (speedX >= 0)
    {
      image(upRightTurtle, x, y);
    }
  }
}
