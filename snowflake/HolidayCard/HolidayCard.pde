import processing.sound.*;
SoundFile ho;
Snow [] snow;
int xPos=-300;
PImage sleigh;
void setup(){
  size(900, 500);
  ho = new SoundFile(this, "hohoho.wav");
  sleigh=loadImage("eyelessSleigh.png");
  sleigh.resize(300,150);
  snow=new Snow[200];
  for(int i=0;i<200;i++){
    snow[i]=new Snow();
  }
}
void draw(){
  background(0);
for(int i=0; i<snow.length; i++){
    snow[i].move();
    snow[i].show();
  }
  moveSleigh();
}
void moveSleigh(){
  image(sleigh,xPos,30);
  if (xPos==-50)
    ho.play();
  xPos+=2;
  if (xPos>900)
  xPos=-300;
}
void mousePressed(){
 noLoop(); 
}
