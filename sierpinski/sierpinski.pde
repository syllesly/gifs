float current=0;
float totalframes=90;
float d=0;

void settings() {
  size(displayHeight, displayHeight);
}
void setup() {
  frameRate(2);
  d=dist(width/2,height/2,width*1.5,height);
}
void draw() {
  render(current/totalframes);
  current++;
  saveFrame("../output/gif"+nf((int) current, 3)+".png");
  if(current>=totalframes) {
    current=0;
    exit();
  }
}

void render(float p) {
  background(255);
  float rad=map(p,0,1,d,d*2);
  float stAn=PI;
  stroke(0);
  strokeWeight(0.5);
  noFill();
  drawSierpinski(width/2, rad, rad, 11);
  fill(0);
}

void drawSierpinski(float x, float y, float rad, int l) {
  float stAn=PI;
  float x1=x+sin(0+stAn)*rad;
  float y1=y+cos(0+stAn)*rad;
  float x2=x+sin(TWO_PI/3+stAn)*rad;
  float y2=y+cos(TWO_PI/3+stAn)*rad;
  float x3=x+sin(TWO_PI/1.5+stAn)*rad;
  float y3=y+cos(TWO_PI/1.5+stAn)*rad;
  triangle(x1, y1, x2, y2, x3, y3);
  if(l>1) {
    drawSierpinski((x+x1)/2,(y+y1)/2, rad/2, l-1);
    drawSierpinski((x+x2)/2,(y+y2)/2, rad/2, l-1);
    drawSierpinski((x+x3)/2,(y+y3)/2, rad/2, l-1);
  }
}
