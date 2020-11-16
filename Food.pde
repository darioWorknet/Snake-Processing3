class Food{
 PVector fPos;
 PVector lastPos;
 int r;
 int g;
 int b;
    
  void setPos(PVector Pos){
    this.fPos = new PVector();
    this.fPos.x = Pos.x;
    this.fPos.y = Pos.y;
    
    this.r = (int)random(255);
    this.g = (int)random(255);
    this.b = (int)random(255);
  }
  
    
    PVector getPos(){
      PVector getP = new PVector ((int) random (rows), (int) random (rows));
      if (validPos(getP)){
        return getP;
      }else{
        return getPos(); //recursive
      }
    }

boolean validPos(PVector newPos){
  PVector head = h.hPos;
  
  for (PVector b : body.snake){
    if ((b.x == newPos.x) && (b.y == newPos.y)){
      System.out.println("ASHDKFHSKJDHFKAHSDHFALHSDJFHAKSHDFKJHASKDHFK");
      return false;
    }
  }


  if ((this.lastPos.x == newPos.x) && (this.lastPos.y == newPos.y)){
    System.out.println("false");
    return false;
  }else{
    System.out.println("true");
    return true;
  }
}


boolean eaten(){
  PVector head = h.hPos;

  if (this.fPos.x == head.x && this.fPos.y == head.y){
    this.lastPos = new PVector (this.fPos.x,this.fPos.y);
    return true;
  }else{
    return false;
  }
}

  
    
  
  void show(){
    pushMatrix();
    noStroke();
    fill(this.r , this.g, this.b );
    translate(fPos.x*cellSize, fPos.y*cellSize);
    rect(0 ,0,cellSize  ,cellSize );
    popMatrix();
  }
  
}
