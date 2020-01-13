void setup(){
  Average lc = new Average("9 10 5 20 1 2 3");
  //println( (double)(Math.round(lc.getAverage()*100/100)));
  println(lc);
  lc.setLine("11 22 33 44 55 66 77 5 6 7");
  println(lc);
  lc.setLine("48 52 29 100 50 293 4");
  println(lc);
  lc.setLine("0");
  println(lc);
  lc.setLine("100 90 95 98 100 97");
  println(lc);
}
