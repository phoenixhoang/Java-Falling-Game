class enemy
{
  int x;
  int y;
  int speedX;
  int speedY;
  
  void bounce()
  {
    speedX = -speedX;
    speedY = -speedY;
  }

  void move()
  {
    x = x + speedX;
    y = y - speedY;
    if (x <= 0)
    {
      speedX = -speedX;
    }
    if (x >= 450)
    {
      speedX = -speedX;
    }
    if (y <= -50)
    {
      y = 850;
    }
  }
}
