int c;
Particle [] p;
Particle [] p2;
Particle [] p3;
void setup(){
  size(800,600);
  p = new Particle[310];
  for (int i=0; i<200;i++){
     p[i]=new NormalParticle();
  }
  for (int i=100; i<300;i++){
     p[i]=new OddballParticle();
  }
  for (int i=300; i<310;i++){
     p[i]=new JumboParticle();
   }
    p2 = new Particle[310];
  for (int i=0; i<200;i++){
     p2[i]=new NormalParticle();
  }
  for (int i=100; i<300;i++){
     p2[i]=new OddballParticle();
  }
  for (int i=300; i<310;i++){
     p2[i]=new JumboParticle();
   }
   p3 = new Particle[310];
  for (int i=0; i<200;i++){
     p3[i]=new NormalParticle();
  }
  for (int i=100; i<300;i++){
     p3[i]=new OddballParticle();
  }
  for (int i=300; i<310;i++){
     p3[i]=new JumboParticle();
   }
}
void draw(){
  background(0);
   frameRate(60);
   fill(255);
   for (int i=0; i<p.length; i++){
   p[i].showRed();
   p[i].move();
   }
   if (timer()>(100*(PI/3))){
   for (int i=0; i<p.length; i++){
   p2[i].showBlue();
   p2[i].move();
   }
   }
   if (timer()>(100*((PI/3)*2))){
   for (int i=0; i<p.length; i++){
   p3[i].showGreen();
   p3[i].move();
   }
   }
}
int timer(){
  frameRate(60);
  c++;
  return c;
}
class NormalParticle implements Particle{
double x,y,speed,angle;
int c;
NormalParticle(){
  x=width/2;
  y=height/2;
  speed=Math.random()*5;
  angle=(Math.PI*2)*Math.random();
}
public void move(){
  x+=Math.cos(angle)*speed;
  y+=Math.sin(angle)*speed;
  angle+=.02;
}
public void showRed(){
  noStroke();
  fill(255,0,0);
  ellipse((float)x,(float)y,5,5);
}
public void showBlue(){
  noStroke();
  fill(0,0,255);
  ellipse((float)x,(float)y,5,5);
}
public void showGreen(){
  noStroke();
  fill(0,255,0);
  ellipse((float)x,(float)y,5,5);
}
}
interface Particle{
  public void showRed();
  public void showBlue();
  public void showGreen();
  public void move();
}
class OddballParticle implements Particle
{
double x,y,speed,angle;
OddballParticle(){
  x=width/2;
  y=height/2;
  speed=Math.random()*5;
  angle=(Math.PI*2)*Math.random();
}
public void move(){
  x+=Math.cos(angle)*speed;
  y+=Math.sin(angle)*speed;
  angle+=.02;
}
public void showRed(){
  noStroke();
  fill(255,0,0);
  rect((float)x,(float)y,5,5);
}
public void showBlue(){
  noStroke();
  fill(0,0,255);
  rect((float)x,(float)y,5,5);
}
public void showGreen(){
  noStroke();
  fill(0,255,0);
  rect((float)x,(float)y,5,5);
}
}
class JumboParticle implements Particle
{
double x,y,speed,angle;
JumboParticle(){
  x=width/2;
  y=height/2;
  speed=Math.random()*5;
  angle=(Math.PI*2)*Math.random();
}
public void move(){
  x+=Math.cos(angle)*speed;
  y+=Math.sin(angle)*speed;
  angle+=.02;
}
public void showRed(){
  noStroke();
  fill(255,0,0);
  ellipse((float)x,(float)y,15,15);
}
public void showBlue(){
  noStroke();
  fill(0,0,255);
  ellipse((float)x,(float)y,15,15);
}
public void showGreen(){
  noStroke();
  fill(0,255,0);
  ellipse((float)x,(float)y,15,15);
}
}
