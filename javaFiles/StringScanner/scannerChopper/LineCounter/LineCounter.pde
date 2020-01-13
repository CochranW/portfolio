import java.util.Scanner;
import static java.lang.System.*;

public class LineCount{
   private String line;

   public LineCount()
   {
    setLine("");
   }

   public LineCount(String s)
   {
     line=s;
   }

  public void setLine(String s)
  {
    line=s;
  }

  public int getCount()
  {
    Scanner kb = new Scanner(line);
    int c=0;
    while(kb.hasNext()){
      kb.nextInt();
      c++;
    }
    kb.close();
    return c;
  }

  public String getLine()
  {
    return line;
  }

  public String toString()
  {
    return getLine()+"\n"+"Count = "+getCount()+"\n";
  }
}
