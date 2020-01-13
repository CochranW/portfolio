int total;
int rTotal;
int xPos=25;
int totalPos;
int yPos=600;
import java.util.Timer;
import java.util.TimerTask;
void setup(){
  size(420, 820);
  Timer timer = new Timer(); 
  TimerTask task = new Helper(); 
  timer.schedule(task, 2000, 2000); 
  noLoop();
}
void draw()
{
  background(200);
  textSize(32);
  fill(255, 50, 50);
  text("Running Total = "+rTotal+"", 38, 35);
  textSize(21);
  text("Each Time you click your mouse the 9 \ndice will roll. The sum of the 9 dice \ndetermines how far the red dot below \nwill move. Land the dot COMPLETELY \nwithin the black area to win!", 25, 425);
  Die die1 = new Die(50, 50);
  die1.show();
  Die die2 = new Die(160, 50);
  die2.show();
  Die die3 = new Die(270, 50);
  die3.show();
  Die die4 = new Die(50, 160);
  die4.show();
  Die die5 = new Die(160, 160);
  die5.show();
  Die die6 = new Die(270, 160);
  die6.show();
  Die die7 = new Die(50, 270);
  die7.show();
  Die die8 = new Die(160, 270);
  die8.show();
  Die die9 = new Die(270, 270);
  die9.show();
  die9.shapee();
}
void mousePressed()
{
  redraw();
}

class Helper extends TimerTask { 
  public  int z = 0; 
  public void run() { 
    System.out.println("Dice! " + ++z);

    redraw();
  }
} 
class Die //models one single dice cube
{
  //variable declarations here
  int x;
  int y;
  Die(int x, int y) //constructor
  {
    this.x=x;
    this.y=y;
  }
  void show()
  {
    strokeWeight(2);
    fill(255);
    rect(x, y, 100, 100, 10);
    int random = (int)(Math.random()*6+1);
    fill(0);
    if (random==1) {
      ellipse(x+50, y+50, 10, 10);
      total++;
      rTotal++;
    }
    if (random==2) {
      ellipse(x+20, y+20, 10, 10);
      ellipse(x+80, y+80, 10, 10);
      total+=2;
      rTotal+=2;
    }
    if (random==3) {
      ellipse(x+20, y+20, 10, 10);
      ellipse(x+50, y+50, 10, 10);
      ellipse(x+80, y+80, 10, 10);
      total+=3;
      rTotal+=3;
    }
    if (random==4) {
      ellipse(x+25, y+25, 10, 10);
      ellipse(x+75, y+25, 10, 10);
      ellipse(x+25, y+75, 10, 10);
      ellipse(x+75, y+75, 10, 10);
      total+=4;
      rTotal+=4;
    }
    if (random==5) {
      ellipse(x+20, y+20, 10, 10);
      ellipse(x+80, y+20, 10, 10);
      ellipse(x+20, y+80, 10, 10);
      ellipse(x+80, y+80, 10, 10);
      ellipse(x+50, y+50, 10, 10);
      total+=5;
      rTotal+=5;
    }
    if (random==6) {
      ellipse(x+25, y+25, 10, 10);
      ellipse(x+25, y+50, 10, 10);
      ellipse(x+25, y+75, 10, 10);
      ellipse(x+75, y+25, 10, 10);
      ellipse(x+75, y+50, 10, 10);
      ellipse(x+75, y+75, 10, 10);
      total+=6;
      rTotal+=6;
    }

    strokeWeight(1);
    line(25, 600, 25, 630);
    line(395, 600, 395, 630);
    rect(375, 620, 20, 10);
    line(25, 600, 395, 600);
    line(25, 610, 395, 610);
    line(25, 620, 395, 620);
    line(25, 630, 395, 630);
  }
  int timeTotal() {
    int returnedTotal = total;
    total=0;
    textSize(32);
    fill(255, 50, 50);
    text("Roll Total = "+returnedTotal+"", 100, 685);
    return returnedTotal;
  }
  void shapee() {
    xPos+=timeTotal();
    if (xPos>375 && yPos<620) {
      yPos+=10;
      int leftOver=xPos-375;
      xPos=25+leftOver;
    }
    if (xPos>375 && yPos==620) {
      textSize(75);
      fill(255, 50, 50);
      text("You Lose!", 35, 800);
      xPos=25;
      yPos=600;
    }
    if (xPos>=375 && xPos<=385 && yPos==620) {
      textSize(75);
      fill(255, 50, 50);
      text("Winner!", 70, 800);
    }
    fill(255, 50, 50);
    rect(xPos, yPos, 10, 10);
  }
}
