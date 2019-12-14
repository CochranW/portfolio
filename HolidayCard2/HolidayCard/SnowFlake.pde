class Snow{
float x, y, xSpeed, ySpeed, size;
  public Snow() {
    x=(int)(Math.random()*width);
    y=(int)(Math.random()*500)-200;
    xSpeed=(int)(Math.random()*4)-3;
    ySpeed=(int)(Math.random()*2)+3;
    size=(int)(Math.random()*8)+16;
  }
  void show() {
    fill(255);
    textSize(size);
    text("*",(float)x, (float)y);
  }
  void move() {
    x+=xSpeed;
    y+=ySpeed;
    if (y>height) {
      y=0;
      x=(int)(Math.random()*width);
    }
  }
}
