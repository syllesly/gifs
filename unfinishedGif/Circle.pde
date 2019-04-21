class Circle {
  public float startX;
  public float startY;
  public float size;
  public float x=0;
  public float y=0;
  public float rad=0;
  public float speed=0;
  float i=0;
  public Circle(float getX, float getY, float getSize, float getRad, float getSpeed) {
    startX=getX;
    startY=getY;
    size=getSize;
    x=getX;
    y=getY;
    rad=getRad;
    speed=getSpeed;
  }
  public void update() {
    i+=speed;
    x=startX+sin(-i)*rad;
    y=startY+cos(-i)*rad;
  }
  public void show() {
    stroke(255);
    ellipse(x,y,size*2,size*2);
  }
}