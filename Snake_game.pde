Board b;
Head h;
Food f;
Body body;
int rows;
int cellSize;
int direction;
int gameSpeed;


void setup(){
  gameSpeed = 7;
  int initSnakeSize = 4;
  frameRate (8);
  size (800,800);
  rows = 20;
  cellSize = width / rows;
  b = new Board(rows, cellSize, width); 
  h = new Head((int)random(initSnakeSize,rows-initSnakeSize),(int)random(initSnakeSize,rows-initSnakeSize)); //definition of the snake starting point
  f = new Food();
  f.fPos = new PVector ((int)random(rows),(int)random(rows));
  f.setPos(f.fPos);
  direction = h.chooseDir();//get the most favorable direcction to avoid crash at beginning;
  body = new Body (initSnakeSize);  //snake list defined: depend on head starting point
  delay(1000);
}


void draw() {

  if (!h.gameOver()){
    frameRate(gameSpeed);
    background(150);
    h.show(direction); //modify pos and show 
    f.show();
    b.show();
  
    if(body.touched()){
    System.out.println("GAME OVER");
    stop();
    } else if(f.eaten()){
      f.setPos(f.getPos());
      body.grow();
      body.setSpeed();
    }
    
  }else{
    System.out.println("GAME OVER");
    h.show(h.lastPos_x, h.lastPos_y);
    body.show(body.lastSnake);
    stop();
  }

}


void keyPressed(){
  switch(keyCode){
    case 39: if(h.direction != 1) {
      System.out.println(keyCode);
      direction = 0;
    }
    break;
    case 37: if (h.direction != 0){
      System.out.println(keyCode);
      direction = 1;
    }
    break;
    case 40: if (h.direction != 3){
      System.out.println(keyCode);
      direction = 2;
    }
    break;
    case 38: if (h.direction != 2){
      System.out.println(keyCode);
      direction = 3;
    }
    default:{
      System.out.println("CONTROL WITH ARROWS ONLY");
    break;
    }
  }
   

}
