 //declare bacteria variables here
 Bacteria [] br;
 Bacteria [] br2;
 Bacteria [] br3;
 Bacteria [] bb;
 Bacteria [] bb2;
  Bacteria [] bb3;
   Bacteria [] bb4;
 String s = "Hover over each box and watch the bacteria move!";
 String s2 = "Note: Sequences do NOT reset themselves!";
 void setup()   
 {
   size(800,485);
   br=new Bacteria[300];
   br2=new Bacteria[300];
   br3=new Bacteria[400];
   bb=new Bacteria[300];
   bb2=new Bacteria[500];
   bb3=new Bacteria[500];
   bb4=new Bacteria[500];
   for (int i=0; i<br.length;i++){
     br[i]=new Bacteria(width/4+width/2, height/2);
   }
   for (int i=0; i<bb.length;i++){
     bb[i]=new Bacteria(width/4, height/2);
   }
   for (int i=0; i<br2.length;i++){
     br2[i]=new Bacteria(width, height/2);
   }
   for (int i=0; i<br3.length;i++){
     br3[i]=new Bacteria(width/2, height/2);
   }
   for (int i=0; i<bb2.length;i++){
     bb2[i]=new Bacteria(width/2, height/2);
   }
   for (int i=0; i<bb3.length;i++){
     bb3[i]=new Bacteria(width/2+width/4, height/2);
   }
   for (int i=0; i<bb4.length;i++){
     bb4[i]=new Bacteria(width/4, height/2);
   }
 }   
 void draw()   
 {    
   //move and show the bacteria   
   background(255);
   frameRate(60);
   fill(0,255,0);
   stroke(5);
   fill(100);
   textSize(32);
text(s, 10, 30);
text(s2, 60, 475);
fill(255);
    rect(0,40,145,100);
    fill(0);
    textSize(20);
    text("Expand from center of origin", 5,45,145,100);
    fill(255);
    rect(0,140,145,100);
    rect(0,240,145,100);
    rect(0,340,145,100);
    fill(0);
    textSize(20);
    text("Attack and defend sequence", 5,145,145,100);
    noStroke();
    text("Multiply bacteria sequence", 5,245,145,100);
    noStroke();
    text("Random bacteria death", 5,345,145,100);
    noStroke();
    if (mouseX<145&&mouseY<140&&mouseY>40){
        cursor(HAND);
        for (int i=0; i<br.length;i++){
     br[i].move();
     br[i].showRed();
   }
   for (int i=0; i<bb.length;i++){
   bb[i].move();
   bb[i].showBlue();
   }
    }
      if (mouseX<145&&mouseY<240&&mouseY>140){
        cursor(HAND);
   bb[0].defend();
   for (int i=0; i<br.length;i++){
     br2[i].attack();
     br2[i].showRed();
   }
      }
      if (mouseX<145&&mouseY<340&&mouseY>240){
        cursor(HAND);
      for (int i=0; i<bb2.length;i++){
     bb2[i].showBlue();
     bb2[i].multiply();
     bb2[i].move();
   }
   for (int i=0; i<bb2.length;i++){
     bb3[i].showBlue();
     bb3[i].multiply();
     bb3[i].move();
   }
   for (int i=0; i<bb2.length;i++){
     bb4[i].showBlue();
     bb4[i].multiply();
     bb4[i].move();
   }
 }
 if (mouseX<145&&mouseY<440&&mouseY>340){
        cursor(HAND);
 for (int i=0; i<br3.length;i++){
     br3[i].showRed();
     br3[i].death();
     br3[i].move();
 }
 }
 }
 class Bacteria    
 {     
   //lots of java!
   int x, y;
   boolean hit;

  public Bacteria(int x,int y) {
    this.x=x;
    this.y=y;
  }
    
  void showRed() {
    noStroke();
    fill(255,0,0);
    ellipse(x, y, 5, 5);
  }
  void showBlue() {
    noStroke();
    fill(0,0,255);
    ellipse(x, y, 5, 5);
  }
  void move() {
    x+=(int)(Math.random()*11)-5;
    y+=(int)(Math.random()*11)-5;
  }
  void defend(){
    int b=0;
        for (int i=0; i<=118; i++){
      b+=5;
      fill(0,0,255);
    ellipse(150, b, 5, 5);
    }
  }
  void attack(){
    int die=(int)(Math.random()*80);
    if (x>155 && hit==false){
    x+=(int)(Math.random()*-9);
    y+=(int)(Math.random()*31)-15;
    fill(0,0,255);
    ellipse(x, y, 5, 5);
    }
    if (x>150 && x<160){
      hit=true;
    }
    if (hit==true){
      if (die==0){
        x=5000;
        y=5000;
      }
      if (die!=1){
        x-=(int)(Math.random()*-9);
    y+=(int)(Math.random()*31)-15;
    fill(0,0,255);
    ellipse(x, y, 5, 5);
      }
    }
  }
  void multiply(){
    x+=(int)(Math.random()*11)-5;
    y+=(int)(Math.random()*11)-5;
      noStroke();
    fill(0,0,255);
    ellipse(x, y, 5, 5);
  }
  void death(){
    int die=(int)(Math.random()*500);
    if (die==0){
        x=5000;
        y=5000;
      }
  }
 }
