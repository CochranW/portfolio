void setup(){
  LineBreaker lc = new LineBreaker("1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9",4);
  println(lc);
  lc.setLineBreaker("t h e b i g b a d w o l f h a d b i g e a r s a n d t e e t h",2);
  println(lc);
  lc.setLineBreaker("a c o m p u t e r s c i e n c e p r o g r a m",7);
  println(lc);
  lc.setLineBreaker("i a m s a m i a m",2);
  println(lc);
}
