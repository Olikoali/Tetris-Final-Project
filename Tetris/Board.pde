public class Board{
  private Patch[] gameBoard;
  
  public Board(){  
    Patch[][] gameBoard = new Patch[16][8];
  }
  
  public Board(int xVal, int yVal){
    Patch[][] gameBoard = new Patch[yVal][xVal];
  }
  
  public void spawnBlock(){
    double ran = 7 * Math.random();
    if(ran < 1){
    }
    else if(ran < 2){
    }
    else if(ran < 3){
    }
    else if(ran < 4){
    }
    else if(ran < 5){
    }
    else if(ran < 6){
    }
    else if(ran < 7){
    }
  }
}
