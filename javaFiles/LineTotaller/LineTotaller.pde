import static java.lang.System.*;
import java.util.Scanner;

public class LineTotal{
   private String line;

  public LineTotal()
  {
    setLine("");
  }

  public LineTotal(String s)
  {
    line=s;
  }

  public void setLine(String s)
  {
    line=s;
  }

  public int getSum()
  {
    Scanner kb = new Scanner(line);
    int t = 0;
    while(kb.hasNext()){
      t+=kb.nextInt();
    }
    kb.close();
    return t;
  }

  public String getLine()
  {
    return line;
  }

  public String toString()
  {
    return getLine()+"\n"+"Total = "+getSum()+"\n";
  }
}
