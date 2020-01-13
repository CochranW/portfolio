import java.util.Scanner;
import static java.lang.System.*;

public class LineBreaker
{
   private String line;
   private int breaker;

   public LineBreaker()
   {
     setLineBreaker("",0);
   }

   public LineBreaker(String s, int b)
   {
     line=s;
     breaker=b;
   }

  public void setLineBreaker(String s, int b)
  {
    line=s;
    breaker=b;
  }

  public String getLine()
  {
    return line;
  }

  public String getLineBreaker()
  {
    String box ="";
    Scanner kb = new Scanner(line);
    int c = 0;
    while(kb.hasNext()){
     box+=kb.next();
     c++;
     if(breaker==c){
       box+="\n";
       c=0;
     }
    }
    kb.close();
    return box;
  }

  public String toString()
  {
    return getLine()+"\n"+getLineBreaker()+"\n";
  }
}
