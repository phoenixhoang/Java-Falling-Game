//draw an player
class player
{
  int x;
  int y;
  int deltaX;
  int deltaY;
  int counter = 0;
  String direction = "right";
  PImage submarineLeft1, submarineLeft2, submarineLeft3, submarineRight1, submarineRight2, submarineRight3;

  player (int x, int y, int deltaX, int deltaY)
  {
    this.x = x;
    this.y = y;
    this.deltaX = deltaX;
    this.deltaY = deltaY;
    submarineLeft1 = loadImage("submarineLeft1.png");
    submarineLeft1.resize(50, 60);
    submarineLeft2 = loadImage("submarineLeft2.png");
    submarineLeft2.resize(50, 60);
    submarineLeft3 = loadImage("submarineLeft3.png");
    submarineLeft3.resize(50, 60);
    submarineRight1 = loadImage("submarineRight1.png");
    submarineRight1.resize(50, 60);
    submarineRight2 = loadImage("submarineRight2.png");
    submarineRight2.resize(50, 60);
    submarineRight3 = loadImage("submarineRight3.png");
    submarineRight3.resize(50, 60);
  }

  boolean whaleCrash(whale other)
  {
    return (sqrt((this.x - other.x)*(this.x - other.x)) <= 50  &&  sqrt((this.y-other.y)*(this.y-other.y)) <= 50);
  }
  
  boolean turtleCrash(turtle other)
  {
    return (sqrt((this.x - other.x)*(this.x - other.x)) <= 50  &&  sqrt((this.y-other.y)*(this.y-other.y)) <= 50);
  }
  
  boolean coinCrash(coin other)
  {
    return (sqrt((this.x - other.x)*(this.x - other.x)) <= 50  &&  sqrt((this.y-other.y)*(this.y-other.y)) <= 50);
  }


  void move()
  {
    counter += 1;
  }
  
  void render()
  {
    //draw a player
    if (direction == "left" && counter >= 0 && counter <= 30)
    {
      image(submarineLeft1, x, y);
    } 
    else if (direction == "left" && counter >= 30 && counter <= 60)
    {
      image(submarineLeft2, x, y);
    } 
    else if (direction == "left" && counter >= 60 && counter <= 90)
    {
      image(submarineLeft3, x, y);
    } 
    else if (direction == "right" && counter >= 0 && counter <= 30)
    {
      image(submarineRight1, x - 25, y);
    }
    else if (direction == "right" && counter >= 30 && counter <= 60)
    {
      image(submarineRight2, x - 25, y);
    }
    else if (direction == "right" && counter >= 60 && counter <= 90)
    {
      image(submarineRight3, x - 25, y);
    }
    else{
    counter = 0;
    }
  }

  void update()
  {
    move();
    render();
    keyPressed();
  }

  void keyPressed() 
  {
    if (key == CODED) 
    {
      if (keyCode == LEFT) 
      {
        player.x = x - deltaX;
        direction = "left";
        if (player.x <= 0)
        {
          player.x = 0;
        }
      } 
      else if (keyCode == RIGHT) 
      {
        player.x = player.x + deltaX;
        direction = "right";
        if (player.x >= width - 20)
        {
          x = width - 20;
        }
      }
      else if (keyCode == UP) {
        player.y = y - deltaY;
        if (player.y <= 0)
        {
          player.y = 0;
        }
      } else if (keyCode == DOWN ) 
      {
        player.y = player.y + deltaY;
        if (player.y >= 100)
        {
          y = 100;
        }
      }
    }
  }

}
