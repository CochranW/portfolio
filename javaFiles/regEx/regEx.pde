import java.util.Arrays;
String text="Hello, I am nine syllables long. And it is great!";
  String s=text.toLowerCase();
void setup(){
  println(countWords(s));
  println(countVowels(s));
  println(countSentances(s));
  println(countSyllables(s));
}
int countWords(String s){
  int num;
  String[] words=s.split("\\W+");
  num=words.length;
  return num;
}
int countVowels(String s){
  int num;
  String[] words=s.split("[^aeiouy]+");
  num=words.length;
  return num;
}
int countSentances(String s){
  int num;
  String[] words=s.split("[^.?!]+");
  num=words.length;
  return num;
}
int countSyllables(String s){
  String[] exceptions = s.split("[e][\\s]");
  return countVowels(s)-exceptions.length;
}
