import java.util.Arrays;
String[] w;
String s,text;
void setup() {
  size(200,200);
   w=loadStrings("data/dream");
  text=join(w," ");
  s=text.toLowerCase();
  //println(s);
  //println(countWords(s));
  //println(countVowels(s));
  //println(countSentences(s));
  //println(countSyllables(s));
  //println(getReadingLevel(s));
  //println(getReadingScore(s));
}
void draw(){
  background(200);
  println(mousePress());
}
boolean mousePress(){
  if (mousePressed==true)
  return true;
  return false;
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
int countSentences(String s){
  int num;
  String[] words=s.split("[^.?!]+");
  num=words.length;
  return num;
}
int countSyllables(String s) {
  int count=countVowels(s);
  String e="e";
  String vowels="aeiouy";
  String[] str=s.split("\\W+");
  for (int i=0; i<str.length; i++) {
    if (str[i].length()>3) {
      if (str[i].substring(str[i].length()-1, str[i].length()).equals(e)==true)
      {
              count-=1;
      }
      for (int j=0; j<str[i].length()-1; j++) {
        for (int k=0; k<vowels.length(); k++) {
          if (str[i].substring(j, j+1).indexOf(vowels.charAt(k))>-1) {
            for (int p=0; p<vowels.length(); p++) {
              if (str[i].substring(j+1, j+2).indexOf(vowels.charAt(p))>-1) {
                count-=1;
              }
            }
          }
        }
      }
    }
  }
   return count;
}
int getReadingLevel(String s){
  float p1 = .39*(countWords(s)/countSentences(s));
  float p2 = 11.8*(countSyllables(s)/countWords(s));
  int score = round(p1+p2-15.59);
  return score;
}
float getReadingScore(String s){
  float p1 = 2.002*(countWords(s)/countSentences(s));
  float p2 = 91.01*(countSyllables(s)/countWords(s));
  float score = 215.996-p1-p2;
  return score;
}
