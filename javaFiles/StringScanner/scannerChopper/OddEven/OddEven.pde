import java.util.Scanner;
import static java.lang.System.*;

public class OddEvenCounter
{
  private String line;

   public OddEvenCounter()
   {
     setLine("");
   }

   public OddEvenCounter(String s)
   {
     line=s;
   }

  public void setLine(String s)
  {
    line=s;
  }

  public int getEvenCount()
  {
    Scanner kb1 = new Scanner(line);
    int c=0;
    while(kb1.hasNext()){
      int i = kb1.nextInt();
      if((i)%2==0 && i!=0){
      c++;
    }
    }
    kb1.close();
    return c;
  }

  public int getOddCount()
  {
    Scanner kb1 = new Scanner(line);
    int c=0;
    while(kb1.hasNext()){
      if((kb1.nextInt())%2==1){
      c++;
    }
    }
    kb1.close();
    return c;
  }
  
  public String getLine()
  {
    return line;
  }

  public String toString( )
  {
    return getLine()+"\n"+"Even Count = "+getEvenCount()+"\n"+"Odd Count = "+getOddCount()+"\n";
  }
}
