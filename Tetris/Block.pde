//fix
class Block {

  int[][] shape;
  int x;
  int y;
  color c;
  int cellSize = 40;
  int[][] previousShape;

  Block(int[][] s, color col) {
    shape = s;
    c = col;
    x = 3;
    y = 0;
  }

  void display() {
    fill(c);
    stroke(255);
    for (int r = 0; r < shape.length; r++) {
      for (int col = 0; col < shape[r].length; col++) {
        if (shape[r][col] == 1) {
          rect(
            (x + col) * cellSize,
            (y + r) * cellSize,
            cellSize,
            cellSize
          );
        }
      }
    }
  }

  void move(int dx, int dy) {
    x += dx;
    y += dy;
  }

  void rotate() {
    previousShape = shape;
    int rows = shape.length;
    int cols = shape[0].length;
    int[][] rotated =
      new int[cols][rows];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        rotated[c][rows - 1 - r]
          = shape[r][c];
      }
    }
    shape = rotated;
  }
  void rotateBack() {
    shape = previousShape;
  }
  
    public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
}
