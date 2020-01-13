// A+ Computer Science  -  www.apluscompsci.com
//Name -
//Date -
//Class - 
//Lab  -

import static java.lang.System.*;

public class OddOrEven
{
  private int number;

  public OddOrEven()
  {
  }

  public OddOrEven(int num)
  {
    number=num;
  }

  public void setNum(int num)
  {
    number=num;
  }

  public String isOdd( )
  {
    if (number%2==1)
      return "Odd";
    else
      return "Even";
  }

  public String toString()
  {

    return number+" is "+isOdd()+".\n\n";
  }
}
