public class ScoreEntry{
  private String name;
  private int score;
  
  public ScoreEntry(){
    name = "";
    score = 0;
  }
  
  public ScoreEntry(String n, int s){
    name = n;
    score = s;
  }
  
  public String getN(){
    return name;
  }
  
  public void setN(String n){
    name = n;
  }
  
  public int getScore(){
    return score;
  }
  
  public void setScore(int i){
    score = i;
  }
}
