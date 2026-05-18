public class Board{
  private Patch[] gameBoard;
  
  public Board(){  
    Patch[][] gameBoard = new Patch[16][8];
  }
  
  public Board(int xVal, int yVal){
    Patch[][] gameBoard = new Patch[yVal][xVal];
  }
}
