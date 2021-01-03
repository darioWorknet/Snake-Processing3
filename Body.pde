class Body{
  
  int size;
  ArrayList <PVector> snake;
  ArrayList<PVector> lastSnake;
  
  
  Body(int size){
    System.out.println ("creating new body");
    this.size = size;
    snake = new ArrayList <PVector> ();
    
    int x = 0;
    int y = 0;
    
    switch (direction) {
      case 0 : x = -1; y = 0;
      break;
      case 1 : x = 1; y = 0;
      break;
      case 2: x = 0; y = -1;
      break;
      case 3: x = 0; y = 1;
      break;
      default: System.out.println ("BUG NEEDS TO BE FIXED");
    }
    

    
    for (int i = 1; i <= size; i++){
      PVector newSnake = new PVector();
      newSnake.x = h.hPos.x +  i * x;
      newSnake.y = h.hPos.y +  i * y;
      snake.add (newSnake);
    }
    
  }
  
  
  
  
  void show(){
    int item = 0;
    lastSnake = new ArrayList<PVector>();

        for (PVector b : snake){
          lastSnake.add(b.copy());  //copy array elements (PVectors) to other array. one by one using copy() method to avoid rpointers
        item++;
            if (item==1){
              b.x = h.lastPos.x;
              b.y = h.lastPos.y;
            }else{
              b.x = lastSnake.get(item-2).x; 
              b.y = lastSnake.get(item-2).y;
            }
        pushMatrix();
        PVector gucciColor = getColor(item);
        fill(gucciColor.x , gucciColor.y , gucciColor.z);
        translate(b.x*cellSize, b.y*cellSize);
        rect(0 ,0,cellSize  ,cellSize );
        popMatrix();
        }
        
        //setSpeed(item);
        this.size = item;

  }
  
  
  
  void show (ArrayList<PVector> last){   
    int item = 0;
        for (PVector b : last){
        item++;
        pushMatrix();
        PVector gucciColor = getColor(item);
        fill(gucciColor.x , gucciColor.y , gucciColor.z);
        translate(b.x*cellSize, b.y*cellSize);
        rect(0 ,0,cellSize  ,cellSize );
        popMatrix();
        }
 
  }
  
  void grow(){
    PVector newBody = new PVector();
    snake.add(newBody.copy()); // this newBody <PVector> is located automatically by show() method in the next step
  }
  
  
  boolean touched (){  
    for (PVector s : lastSnake){
    if (h.hPos.x == s.x && h.hPos.y == s.y){
      return true;
    } 
    }
    return false;
  }
  
  private void setSpeed(){
        if (size == 7){
          gameSpeed += 1;
        } else if (size == 11){
          gameSpeed += 1;
        } else if (size == 15){
          gameSpeed += 1;
        } else if (size == 19){
          gameSpeed += 1;
        } else if (size == 20){
          gameSpeed += 1;
        } else if (size == 25){
          gameSpeed += 1;
        } else if (size == 30){
          gameSpeed += 1;
        }
        System.out.println(gameSpeed);
  }
  
  PVector getColor (int item){
    int patternSize = 6;
    int position = item % patternSize; // 1%10 = 1     2%10=2...
    PVector myColor = new PVector ();
    if (position>0 && position <=3){
      myColor.x = 125;
      myColor.y = 0;
      myColor.z = 0;
    }else if (position < patternSize && position != 5 ){
      myColor.x = 255;
      myColor.y = 234;
      myColor.z = 222;
    }else {
      myColor.x = 25;
      myColor.y = 25;
      myColor.z = 25;
    }

    return myColor;
  }
    
    
    
  
}
