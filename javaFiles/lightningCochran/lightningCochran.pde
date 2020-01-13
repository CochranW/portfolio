import processing.sound.*;
SoundFile storm;
float startX;
float startY;
float endX;
float endY;
float startX2;
float startY2;
float endX2;
float endY2;
float startX3;
float startY3;
float endX3;
float endY3;
int xPos=125;
int yPos=200;
int yPos2=200;
PImage img1;
PImage img2;
PImage img3;
int timer;
void setup()
{
  size(600, 400);
  strokeWeight(1.5);
  background(0);
  img1 = loadImage("toaster.png");
  img2 = loadImage("bathtub.png");
  img3 = loadImage("basketballPlayerNew.png");
  storm = new SoundFile(this, "test.wav");
  img1.resize(60, 45);
  img2.resize(175, 100);
  img3.resize(250, 175);
}
void reset() {
  xPos=125;
  yPos=200;
  yPos2=200;
  timer=0;
  storm.stop();
}
void draw() {
  background(0);
  image(img3, 35, yPos2);
  image(img1, xPos, yPos);
  if (xPos<150 && xPos>=125) {
    frameRate(40);
    xPos+=1;
    yPos-=2;
    yPos2-=1;
  }
  if (xPos<175 && xPos>=150) {
    frameRate(40);
    xPos+=1;
    yPos-=2;
    yPos2+=1;
  }
  if (xPos<225 && xPos>=175) {
    frameRate(50);
    xPos+=1;
    yPos-=1;
  }
  if (xPos<275 && xPos>=225) {
    frameRate(60);
    xPos+=1;
  }
  if (xPos>=275 && xPos<325) {
    frameRate(50);
    xPos+=1;
    yPos+=1;
  }
  if (xPos>=325 && xPos<375) {
    frameRate(40);
    xPos+=1;
    yPos+=2;
  }
  if (xPos>=375) {
  }
  image(img2, 310, 160);
  startX=400;
  startY=194;
  startX2=400;
  startY2=194;
  startX3=400;
  startY3=194;
  endX=0;
  endY=0;
  endX2=0;
  endY2=0;
  endX3=0;
  endY3=0;
  if (xPos>=360) {
    timer++;
    frameRate(60);
    stroke(200, 200, 255);
    while (endX<width) {
      endX=startX+(float)((Math.random()*20)-9);
      endY=startY+(float)((Math.random()*10)-10);
      line(startX, startY, endX, endY);
      startX=endX;
      startY=endY;
    }
    stroke(175, 175, 255);
    while (endX2<width) {
      endX2=startX2+(float)((Math.random()*20)-9);
      endY2=startY2+(float)((Math.random()*10)-10);
      line(startX2, startY2, endX2, endY2);
      startX2=endX2;
      startY2=endY2;
    }
    stroke(150, 150, 255);
    while (endX3<width) {
      endX3=startX3+(float)((Math.random()*20)-9);
      endY3=startY3+(float)((Math.random()*10)-10);
      line(startX3, startY3, endX3, endY3);
      startX3=endX3;
      startY3=endY3;
    }
    textSize(72);
    text("SWISH!", 75, 150); 
    storm.play();
    fill(((int)(Math.random()*50)+150), ((int)(Math.random()*50)+150), 255);
    if (timer==250) {
      reset();
    }
  }
}
