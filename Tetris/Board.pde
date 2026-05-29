public class Board{
  private Patch[][] grid;
  private int cols;
  private int rows;
  private int cellSize;
  
  public Board(){  
    grid = new Patch[16][8];
  }
  
  public Board(int xVal, int yVal, int s){
    cols = xVal;
    rows = yVal;
    cellSize = s;
    grid = new Patch[rows][cols];
    
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < cols; j++){
        grid[i][j] = new Patch();
      }
    }
  }
  
  public void display(){
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < cols; j++){
        grid[i][j].display(j * cellSize,i * cellSize, cellSize);
      }
    }
  }
  
  public boolean canMove(Block b, int dx, int dy){
    for(int r = 0; r < b.shape.length; r++){
      for(int c = 0; c < b.shape[r].length; c++){
        if (b.shape[r][c] == 1){
          int newX = b.x + c + dx;
          int newY = b.y + r + dy;
          
          if(newX < 0|| newX >=cols || newY >= rows){
            return false;
          }
          
          if(newY >= 0 && grid[newY][newX].filled){
            return false;
          }
        }
      }
    }
    
    return true;
  }
  
  public boolean validPosition(Block b){
    return canMove(b, 0, 0);
  }
  
  public void placeBlock(Block b) { 
    for(int r = 0; r < b.shape.length; r++){
      for(int c = 0; c < b.shape[r].length; c++){
        if(b.shape[r][c] == 1){
          int boardX = b.getX() + c;
          int boardY = b.getY() + r;
          grid[boardY][boardX].setr(b.c);
          //Problem here(?)
        }
      }
    }
  }
  
  public void clearLines() {
    for(int y = rows - 1; y >= 0; y--){
      boolean full = true;
      
      for(int x = 0; x < cols; x++){
        if(!grid[y][x].getFilled()){
          full = false;
        }
      }


for(int x = 0; x < cols; x++){
  if(grid[y][x].getFilled()){
    print("X");
  } else {
    print(".");
  }
}
println();


      if(full){
        System.out.print("1"); //This is never called
        for(int row = y; row > 0; row--){
          for(int col = 0; col < cols; col++){
            grid[row][col].setFilled(grid[row - 1][col].getFilled());
            grid[row][col].setC(grid[row - 1][col].getC());
          }
        }
        for(int col = 0; col < cols; col++){
          grid[0][col].clearr();
        }
        y++;
      }
    }
  }
}
