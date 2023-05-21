int gameMode = 2; //gamemode = 1 (play), gamemode = 0 (gameover) 
int health = 100; //initialises health points at 100
int gold = 0; //gold coins collected starts as 0

PImage background; //imports background image
int bgY = 0; //global variable background location

//initalizing object containers
ArrayList<whale> whales; //initialises whales array list for whale objects
ArrayList<turtle> turtles; //initialises turtle array list for turtle objects
ArrayList <coin> coins; //initialises coins array list for gold coin objects
//ArrayList <player> user;
player player;  //initalises player

void setup() { 
  //setting up the window and background
  size(500, 800); //initialises size of the game window
  background = loadImage("bubblesBackground.jpg"); //sets variable background that loads and imports background image
  background.resize(width, height); //resize the background image to the size of the window (500, 800)
  
  //setting up the array lists
  whales = new ArrayList<whale>(); //creates a new arraylist called whales to contain each whale
  whales.add(new whale((int) random(0, 400), (int) random(0, 800), 3, 2)); //adds a new whale object to the array list with random (x, y) coordinates and x, y speeds
  whales.add(new whale((int) random(0, 400), (int) random(0, 800), 2, 2));
  
  turtles = new ArrayList<turtle>(); //creates a new arraylist called turtles to contain each turtle
  turtles.add(new turtle((int) random(0, 400), (int) random(0, 800), 2, 3)); //adds a new turtle object to the array list with random (x, y) coordinates and x, y speeds
  turtles.add(new turtle((int) random(0, 400), (int) random(0, 800), 4, 2));
  turtles.add(new turtle((int) random(0, 400), (int) random(0, 800), 3, 2));
  
  coins = new ArrayList <coin>(); //creates a new arraylist called coins to contain each coin
  coins.add(new coin((int) random(0, 400), (int) random(750, 820), (int) random(1, 5))); //adds a new coin object to the array list with random (x, y) coordinates and x speed
  coins.add(new coin((int) random(0, 400), (int) random(750, 820), (int) random(1, 5)));
  coins.add(new coin((int) random(0, 400), (int) random(750, 820), (int) random(1, 5)));
  
  player = new player(20, 10, 3, 2); //creates a new player object with the (x, y) coordinates and x, y speeds 
}

//gamemode procedure
void gameMode()
{
  if (gameMode == 1) //if gamemode = 1, continue playing state
  {
    scrollBackground(); //calls procedure to scroll the background upwards to mimick movement
    player.update(); //procedure to update the rendering and keypressed movement of the player
    
    fill(0);
    text("Health: " + health, 300, 20); //displays health left
    text("Gold: " + gold, 15, 20); //dislays gold coins collected
    fill(181, 211, 231);
    rect(380, 10, 100, 10);
    fill(0, 255, 0);
    rect(380, 10, health, 10);
    
    //turtle update rendering and crash
    for (int i = turtles.size() - 1; i >=0; i--) //for each turtle in the list
    {
      turtle turtie = turtles.get(i); //takes the location of the turtle in the list
      turtie.update(); //procedure to update the turtle rendering location and animation 
      
      if (player.turtleCrash(turtie)) //if the player and turtle collides
      {
        turtles.remove(i);
        health -= 10; //
      }
    }
    
    //whale crash update rendering and crash
    for (int i = whales.size() - 1; i >=0; i--) //for each whale in the list
    {
      whale whaler = whales.get(i); //takes the location of the whale in the list
      whaler.update(); //procedure to update the whale rendering location and animation 
      
      if (player.whaleCrash(whaler)) //if the player and whale collides
      {
        whales.remove(i);
        health -= 25;
        whales.add(new whale((int) random(0, 400), (int) random(750, 800), 2, 2));
        //health -= 0.1; //for the time of collision, health points decreases by 0.1
      }
    }
    
    //coin crash
    for (int i = coins.size() - 1; i >=0; i--) //for each coin in the list
    {
      coin part = coins.get(i); //takes the location of the coin in the list
      part.update(); //procedure to update the coin rendering location and animation 
      if (player.coinCrash(part)) //if the player and coin collides
      {
        coins.remove(i); //the specific coin is removed from the list
        gold += 1; //gold collected increases by 1
        coins.add(new coin((int) random(0, 400), (int) random(750, 850), (int) random(1, 5))); //adds a new coin object to the array list with random (x, y) coordinates and x speed
      }
    }
  }
    else if (gameMode == 2)
    {
      background(181, 211, 231); //makes background light blue
      fill(0); //fill black
      text("Press Spacebar to Start!", 190, 400);
    }
    //else gamemode != 1 and initialises gameover screen
    else
    {
      background(181, 211, 231); //makes background light blue
      fill(0); //fill black
      text("Game Over!", 210, 380); //game over text appears as black around the middle of the window
      text("You have collected " + gold + " gold!", 170, 400); //dislays gold coins collected
    }
}  //<>//

//drawing procedure
void draw ()
{
  gameMode(); //calls up gamemode function
  if (health <= 0) //if health is less than or equal to 0
    {
      gameMode = 0; //gamemode = 0 and loads game over screen
      health = 0; //health remains as 0
    }
}

//background scrolling procedure
void scrollBackground()
{
  image(background, 0, bgY); //draw background twice adjacent
  image(background, 0, bgY + background.height); //moves the background by bgY value (moves upwards)
  bgY -= 4; //minus 4 from bgY each time
  if (bgY == -background.height) //if the background is -800
  {  
    bgY = 0; //background location y is reset to 0
  } //wrap background
}

void keyPressed() 
{
  if (key == ' ') 
  {
      gameMode = 1;
  }
}
