public class Patch{
  private boolean filled;
  private color c; 
  
  public Patch(){
    filled = false;
    c = color(0);
  }
  
  public void setr(color newColor){
    filled = true;
    c = newColor;
  }
  
  public void clearr() {
    filled = false;
    c = color(0);
  }
  
  public void display(int x, int y, int size){
    stroke(80);
    fill(c);
    rect(x, y, size, size);
  }
  
  
  public void setFilled(Boolean bool){
    filled = bool;
  }
  
  public Boolean getFilled(){
    return filled;
  }
  
  public color getC(){
    return c;
  }
  
  public void setC(color col){
    c = col;
  }
}
