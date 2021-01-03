class Board{
  
  int rows;
  int cellSize;
  int screen;
  
  Board(int rows, int cellSize, int screen){
    this.rows = rows;
    this.cellSize = cellSize;
    this.screen = screen;
  }
  
  void show (){
    
    stroke(200);
    for (int x = 0; x <= screen; x += cellSize){
     line (x, 0, x, screen); 
    }
    for (int y = 0; y <= screen; y += cellSize){
     line (0, y, screen, y); 
    }
  }  
  
}
