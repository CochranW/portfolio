import processing.sound.*;
SoundFile ho;
Snow [] snow;
int xPos=-300, yPos=140, timer=0, lightTimer=0;
int []nums;
float ySnow=485, r, g, b;
PImage sleigh, house, gift, bg, tree, star;
void setup() {
  size(900, 500);
  nums=new int[19];
  ho = new SoundFile(this, "hohoho.wav");
  sleigh=loadImage("eyelessSleigh.png");
  sleigh.resize(300, 150);
  house=loadImage("house.png");
  house.resize(250, 325);
  gift=loadImage("gift.png");
  gift.resize(25, 25);
  bg=loadImage("bg.jpg");
  bg.resize(900, 500);
  tree=loadImage("tree.png");
  tree.resize(120, 200);
  star=loadImage("star.png");
  star.resize(80, 42);
  snow=new Snow[200];
  for (int i=0; i<200; i++) {
    snow[i]=new Snow();
  }
}
void draw() {
  noStroke();
  frameRate(60);
  background(0);
  image(bg, 0, 0);
  for (int i=0; i<snow.length; i++) {
    snow[i].move();
    snow[i].show();
  }
  moveSleigh();
  if (xPos>210 && xPos<631)
    dropGift();
  growSnow();
  image(house, 175, 275);
  image(star, 570, 258);
  image(tree, 550, 289);
  lights();
}
void moveSleigh() {
  image(sleigh, xPos, 30);
  if (xPos==210)
    ho.play();
  xPos+=2;
  if (xPos>900)
    xPos=-300;
}
void dropGift() {
  image(gift, 219, yPos);
  yPos++;
  if (yPos>350)
    yPos=140;
}
void growSnow() {
  timer++;
  if (timer%20==0 && timer<500)
    ySnow--;
  if (xPos==-300) {
    timer=0;
    ySnow=485;
  }
  rect(0, ySnow, 900, 150);
  println(mouseX, mouseY);
}
void lights() {
  lightTimer++;
  if (lightTimer==5 || lightTimer%30==0)
  for(int i=0; i<nums.length;i++)
    nums[i]=(int)(random(7));
  //first row
  fill(colorPicker(nums[0]));
  ellipse(575, 340, 8, 8);
  fill(colorPicker(nums[1]));
  ellipse(598, 341, 8, 8);
  fill(colorPicker(nums[2]));
  ellipse(621, 341, 8, 8);
  fill(colorPicker(nums[3]));
  ellipse(644, 340, 8, 8);
  //second row
  fill(colorPicker(nums[4]));
  ellipse(564, 381, 8, 8);
  fill(colorPicker(nums[5]));
  ellipse(586.25, 384, 8, 8);
  fill(colorPicker(nums[6]));
  ellipse(608.5, 380, 8, 8);
  fill(colorPicker(nums[7]));
  ellipse(630.75, 382, 8, 8);
  fill(colorPicker(nums[8]));
  ellipse(653, 385, 8, 8);
  //third row
  fill(colorPicker(nums[9]));
  ellipse(555, 411, 8, 8);
  fill(colorPicker(nums[10]));
  ellipse(580, 419, 8, 8);
  fill(colorPicker(nums[11]));
  ellipse(609, 415, 8, 8);
  fill(colorPicker(nums[12]));
  ellipse(641, 419, 8, 8);
  fill(colorPicker(nums[13]));
  ellipse(664, 413, 8, 8);
  //last row
  fill(colorPicker(nums[14]));
  ellipse(551, 449, 8, 8);
  fill(colorPicker(nums[15]));
  ellipse(579, 457, 8, 8);
  fill(colorPicker(nums[16]));
  ellipse(608, 460, 8, 8);
  fill(colorPicker(nums[17]));
  ellipse(640, 457, 8, 8);
  fill(colorPicker(nums[18]));
  ellipse(668, 449, 8, 8);
}
color colorPicker(int n){
    if (n==0){
    r=255;
    g=0;
    b=0;
}
  else if (n==1){
    r=255;
    g=128;
    b=0;
  }
  else if (n==2){
    r=255;
    g=255;
    b=0;
  }
    else if (n==3){
      r=128;
      g=255;
      b=0;
    }
    else if (n==4){
      r=51;
      g=255;
      b=255;
    }
    else if (n==5){
      r=51;
      g=51;
      b=255;
    }
    else if (n==6){
      r=153;
      g=51;
      b=255;
    }
    else if (n==7){
      r=255;
      g=51;
      b=255;
    }
    color c = color(r,g,b);
    return c;
}
void mousePressed() {
  noLoop();
}
