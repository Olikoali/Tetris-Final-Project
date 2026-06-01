Board board;
Block currentBlock;
//LeaderBoard leaderBoard;
Boolean pressed;
int score;
Boolean gameOver;

int timer = 0; 
int dropSpeed = 30;
void setup(){
  size(400, 800);
  board = new Board(10, 17, 40);
  //leaderBoard = new Leaderboard();
  score = 0;
  gameOver = false;
  pressed = false;
  spawnBlock();
}

void draw(){
  if(pressed == true && !gameOver){
  background(0);
  fill(255);
  textSize(24);
  
  timer++;
  if(timer >= dropSpeed){
    if(board.canMove(currentBlock, 0, 1)){
      currentBlock.move(0, 1);
    }
    else{
      board.placeBlock(currentBlock);
      int lines = board.clearLines();
      if(lines == 1) score += 100;
      if(lines == 2) score += 300;
      if(lines == 3) score += 500;
      if(lines >= 4) score += 800;
      spawnBlock();
      if(!board.validPosition(currentBlock)){
        gameOver = true;
      }
    }
    timer = 0;
  }
  
  board.display();
  currentBlock.display();
  text("Score: " + score, 10, 30);
  }
  
  if(gameOver){
      fill(255, 0, 0);
      textSize(40);
      text("GAME OVER", 80, height/2);

      textSize(24);
      text("Final Score: " + score, 110, height/2 + 40);
  }
}

void keyPressed(){
  pressed = true;
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
  int r = (int)random(7);
  if(r == 0){
    currentBlock = makeI();
  }
  else if (r == 1) {
    currentBlock = makeO();
  }
  else if(r == 2){
    currentBlock = makeT();
  }
  else if(r == 3){
    currentBlock = makeJ();
  }
  else if(r == 4){
    currentBlock = makeL();
  }
  else if(r == 5){
    currentBlock = makeS();
  }
  else{
    currentBlock = makeZ();
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

Block makeJ() {
  return new Block(
    new int[][] {
      {1,0,0},
      {1,1,1}
    },
    color(0,0,255)
  );
}

Block makeL() {
  return new Block(
    new int[][] {
      {0,0,1},
      {1,1,1}
    },
    color(255,165,0)
  );
}

Block makeS() {
  return new Block(
    new int[][] {
      {0,1,1},
      {1,1,0}
    },
    color(0,255,0)
  );
}

Block makeZ() {
  return new Block(
    new int[][] {
      {1,1,0},
      {0,1,1}
    },
    color(255,0,0)
  );
}
