String s, e1, e2, e3;
float y = 0;
int t=0;

void setup() {
  size(1250, 600, P3D);
  noStroke();
  String[] scroll = loadStrings("data/scroll");
  s = join(scroll, "\n");
  y = height/2;
  String[] episode1 = loadStrings("data/episodeOne");
  e1 = join(episode1, "\n");
  e1=e1.toLowerCase();
  String[] episode2 = loadStrings("data/episodeTwo");
  e2 = join(episode2, "\n");
  e2=e2.toLowerCase();
  String[] episode3 = loadStrings("data/episodeThree");
  e3 = join(episode3, "\n");
  e3=e3.toLowerCase();
}

void draw() {
  background(0);
  stars();
  translate(width/2, height/2);
  fill(240, 215, 75);
  textSize(width*0.04);
  textAlign(LEFT);
  rotateX(PI/4);
  float w = -width*0.6;
  text(s, -w/2, y, w, height*10);
  if (mousePressed==false)
  y-=2;
  else if (mousePressed==true)
  y-=10;
  if (t==1){
    getEpisode1();
    getEpisode2();
    getEpisode3();
  }
  t++;
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
  return score+2;
  
}
float getReadingScore(String s){
  float p1 = 2.002*(countWords(s)/countSentences(s));
  float p2 = 91.01*(countSyllables(s)/countWords(s));
  float score = 205.996-p1-p2;
  return score;
}

void getEpisode1(){
  println("\n"+"\n"+"\n"+"\n"+"\n");
  println("Episode I:"+"\n"+"Number of Words = "+countWords(e1)+"\n"+"Number of Vowels = "+countVowels(e1)+"\n"+"Number of Sentences = "+countSentences(e1)+"\n"+"Number of Syllables = "+countSyllables(e1)+"\n"+"Flesch Reading Ease Score = "+getReadingScore(e1)+"\n"+"Flesch Reading Grade Level = "+getReadingLevel(e1)+"\n"); 
}

void getEpisode2(){
 println("Episode II:"+"\n"+"Number of Words = "+countWords(e2)+"\n"+"Number of Vowels = "+countVowels(e2)+"\n"+"Number of Sentences = "+countSentences(e2)+"\n"+"Number of Syllables = "+countSyllables(e2)+"\n"+"Flesch Reading Ease Score = "+getReadingScore(e2)+"\n"+"Flesch Reading Grade Level = "+getReadingLevel(e2)+"\n"); 
}

void getEpisode3(){
 println("Episode III:"+"\n"+"Number of Words = "+countWords(e3)+"\n"+"Number of Vowels = "+countVowels(e3)+"\n"+"Number of Sentences = "+countSentences(e3)+"\n"+"Number of Syllables = "+countSyllables(e3)+"\n"+"Flesch Reading Ease Score = "+getReadingScore(e3)+"\n"+"Flesch Reading Grade Level = "+getReadingLevel(e3)+"\n"); 
}

void stars(){
  for(int i=0; i<50; i++){
  fill(255);
  ellipse(random(1250),random(600),3,3);
  }
}
