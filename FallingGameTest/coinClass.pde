class coin
{
  int x;
  int y;
  int speedX;
  int speedY;
  PImage coin;
  
  boolean coinCrash(coin other)
  {
    return (sqrt((this.x - other.x)*(this.x - other.x)) <= 50  &&  sqrt((this.y-other.y)*(this.y-other.y)) <= 50);
  }

  coin(int x, int y, int speedY)
  {
    this.x = x;
    this.y = y;
    this.speedY = speedY;
    coin = loadImage("coin.png"); //loads from .pde source code directory
    coin.resize(50, 50);
  }

  void update()
  {
    move();
    render();
}

  void move()
  {
    int speedY = 2;
    y = y - speedY;
    
    if (y <= 0)
    {
      y = 820;
    }    
  }

  void render()
  {
    if (speedX <= 0)
    {
      image(coin, x, y);
    } else if (speedX >= 0)
    {
      image(coin, x, y);
    }
  }
}
