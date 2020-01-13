import java.util.Scanner;
import java.text.DecimalFormat;
import static java.lang.System.*;

public class Average{
   private String line;

   public Average()
   {
     setLine("");
   }

   public Average(String s)
   {
     line=s;
   }

  public void setLine(String s)
  {
    line=s;
  }

  public double getCount()
  {
    Scanner kb1 = new Scanner(line);
    int c=0;
    while(kb1.hasNext()){
      kb1.nextDouble();
      c++;
    }
    kb1.close();
    return c;
  }


  public double getSum()
  {
    Scanner kb2 = new Scanner(line);
    int t = 0;
    while(kb2.hasNext()){
      t+=kb2.nextDouble();
    }
    kb2.close();
    return t;
  }

  public double getAverage()
  {
    double average=0.0;
    //DecimalFormat df = new DecimalFormat("#.###");
    average=getSum()/getCount();
    average=(Math.round((average*(double)1000))/(double)1000);
    
    return average;
  }

  public String getLine()
  {
    return line;
  }

  public String toString()
  {
     return getLine()+"\n"+"Average = "+getAverage()+"\n";
  }
}
