private float r, g, b;
Flake [] snow=new Flake[200];
float m=800;
boolean light=true;
boolean box;
boolean keepGrowing;
void setup() {
  size(800, 400);
  for (int i=0; i<snow.length; i++) {
    snow[i]=new Flake();
  }
}
void draw() {
  background(r, g, b);
  for (int i=0; i<snow.length; i++) {
    snow[i].move();
    snow[i].show();
  }
  drawSnowman();
  drawMerry();
  growSnow();
  boxLocation();
  byeSnow();
  reset();
  
  if (light==true)
    drawMoon();
  else
    drawSun();
}
void boxLocation(){
  if (mouseX<100&&mouseX>0&&mouseY<40&&mouseY>0){
  box=true;
}
else{
box=false;
}
}
void drawMerry() {
  textSize(30);
  fill(255, 0, 0);
  text("MERRY CHRISTMAS!", m, 365);
  if (m<-250) {
    m=800;
  }
  m-=1;
}
void byeSnow(){
  fill(255,0,0);
  rect(0,0,100,20);
  fill(255);
  textSize(12);
  text("Send Snow Away", 0, 14);
  cursor(ARROW);
  if (mouseX<100&&mouseY<20){
    cursor(HAND);
    if (mousePressed){
      for (int i=0; i<snow.length; i++){
        snow[i].sendAway();
      }
    }
  }
}
void reset(){
    fill(255,0,0);
  rect(0,20,100,20);
  fill(255);
  textSize(12);
  text("Reset Snow", 18, 34);
  cursor(ARROW);
  if (mouseX<100&&mouseX>0&&mouseY<40){
    cursor(HAND);
  }
  if (mouseX<100&&mouseX>0&&mouseY<40&&mouseY>20){
    if (mousePressed){
      for (int i=0; i<snow.length; i++){
        snow[i].resetSnow();
      }
    }
  }
}
void drawSnowman() {
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(200, 300, 125, 125);
  ellipse(200, 210, 100, 100);
  ellipse(200, 130, 75, 75);
  fill(0);
  ellipse(200, 210, 10, 10);
  ellipse(200, 230, 10, 10);
  ellipse(200, 190, 10, 10);
  ellipse(190, 125, 10, 10);
  ellipse(210, 125, 10, 10);
  fill(255, 155, 0);
  triangle(200, 135, 200, 145, 225, 140);
  stroke(100, 50, 0);
  strokeWeight(3);
  line(251, 210, 290, 180);
  line(149, 210, 119, 180);
}
void drawMoon() {
  stroke(0);
  strokeWeight(0);
  fill(204, 204, 204);
  ellipse(725, 75, 125, 125);
  fill(0);
  ellipse(755, 75, 95, 108);
}
void drawSun() {
  stroke(0);
  strokeWeight(0);
  fill(255, 200, 0);
  ellipse(725, 75, 100, 100);
}
  void mousePressed() {      
  if (box==false){
    if (light==true) {
    r=50;
    g=150;
    b=255;
    light=false;
  }
 else if (light==false) {
    r=0;
    g=0;
    b=0;
    light=true;
  }
  }
  if (box==true&&light==true){
    light=true;
  }
  else if (box==true&&light==false){
    light=false;
  }
}
void growSnow(){
  int y=400;
  int h=0;
    for (int i=0; i<=1000; i++){
      y-=.05;
      h+=.05;
  }
  noStroke();
  fill(255);
  rect(0,y,800,h);
}
class Flake {

  double x, y, xSpeed, ySpeed, size;

  public Flake() {
    x=(int)(Math.random()*width);
    y=(int)(Math.random()*500)-200;
    xSpeed=(int)(Math.random()*4)-3;
    ySpeed=(int)(Math.random()*2)+3;
    size=(int)(Math.random()*8)+4;
  }
  void show() {
    fill(255);
    ellipse((float)x, (float)y, (float)size, (float)size);

    fill(255, 255, 225);
  }
  void move() {
    x+=xSpeed;
    y+=ySpeed;
    if (y>400) {
      y=(Math.random()*100)-100;
    }
  }
  void sendAway() {
    for (int i=0; i<=100; i++){
    xSpeed+=.01;
  }
  }
  void resetSnow() {
    xSpeed=(int)(Math.random()*4)-3;
    x=(int)(Math.random()*width);
    y=(int)(Math.random()*500)-200;
  }
}
