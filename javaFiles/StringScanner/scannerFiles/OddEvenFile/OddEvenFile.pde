
import java.util.Scanner;

void setup(){
  
  try{
    Scanner scan = new Scanner(new File("Desktop/StringScanner/scannerFiles/OddEvenFile/oe.txt"));
    scan.nextLine();
    
    while(scan.hasNext()){
      int num=scan.nextInt();
      OddOrEven oe=new OddOrEven(num);
      println(oe);
    }
    scan.close();
    
    
  }catch(Exception e){
    println(e);
  }
  
}
