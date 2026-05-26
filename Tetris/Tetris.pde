Board board;
Block currentBlock;
//LeaderBoard leaderBoard;

int timer = 0; 
int dropSpeed = 30;
void setup(){
  size(400, 800);
  board = new Board(20, 10, 40);
  //leaderBoard = new Leaderboard();
  spawnBlock();
}

void draw(){
  background(0);
  
  timer++;
  if(timer >= dropSpeed){
    if(board.canMove(currentBlock, 0, 1)){
      currentBlock.move(0, 1);
    }
    else{
      board.placeBlock(currentBlock);
      board.clearLines();
      spawnBlock();
    }
    timer = 0;
  }
  
  board.display();
  currentBlock.display();
}

void keyPressed(){
  if(keyCode == LEFT){
    if(board.canMove(currentBlock, -1, 0)){
      currentBlock.move(-1, 0);
    }
  }
  
  if(keyCode == RIGHT){
    if(board.canMove(currentBlock, 1, 0)){
      currentBlock.move(1, 0);
    }
  }
  
  if(keyCode == DOWN){
    if(board.canMove(currentBlock, 0, 1)){
      currentBlock.move(0, 1);
    }
  }
  
  if(key == 'r'){
    currentBlock.rotate();
    if(!board.validPosition(currentBlock)){
      currentBlock.rotateBack();
    }
  }
}

void spawnBlock(){
  int r = (int)random(3);
  if(r == 0){
    currentBlock = makeI();
  }
  else if (r == 1) {
    currentBlock = makeO();
  }
  else {
    currentBlock = makeT();
  }
}

Block makeI() {

  return new Block(
    new int[][] {
      {1,1,1,1}
    },
    color(0,255,255)
  );
}

Block makeO() {

  return new Block(
    new int[][] {
      {1,1},
      {1,1}
    },
    color(255,255,0)
  );
}

Block makeT() {

  return new Block(
    new int[][] {
      {0,1,0},
      {1,1,1}
    },
    color(200,0,255)
  );
}
