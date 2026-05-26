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
}

/*
public class Block{
  private int[][] shape;
  private int x; 
  private int u;
  private color c;
  private int cellSize = 40;
  private int[][] previousShape;
  
  public Block(int[][] s, color col){
    shape = s;
    c = col;
    x = 3;
    y = 0;
  }
  
  public void display(){
    fill(c);
    stroke(255);
    for(int r = 0; r < 
*/
