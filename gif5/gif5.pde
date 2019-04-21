float totalframes=300;
float current=0;
float cRad;
float startCRad;
float triLength;
void settings() {
  size(displayHeight, displayHeight);
}
void setup() {
  frameRate(60);
  noStroke();
  startCRad=sqrt(pow(width/2,2)*2)*1.3;
  triLength=height/3;
}
void draw() {
  render(current/totalframes);
  current++;
  if(current>=totalframes) {
    current=0;
  }
}
void dodecagon(float x, float y, float rad) {
  beginShape();
  for(float i=0;i<12;i++) {
    float angle=i/12*TWO_PI;
    vertex(sin(angle)*rad+x,cos(angle)*rad+y);
  }
  endShape(CLOSE);
}
void render(float percent) {
  background(percent<0.5?0:255);
  cRad=map(percent,percent<0.5?0:0.5,percent<0.5?0.5:1,startCRad,triLength);
  fill(percent<0.5?255:0);
  dodecagon(width/2,height/2,cRad);
  pushMatrix();
  translate(width/2,height/2);
  rotate(map(percent,percent<0.5?0:0.5,percent<0.5?0.5:1,0,PI+TWO_PI/12));
  fill(percent<0.5?0:255);
  for(float i=0;i<6;i++) {
    triangle(0,0,sin(i/6*TWO_PI)*triLength,cos(i/6*TWO_PI)*triLength,sin((i*2+1)/12*TWO_PI)*triLength,cos((i*2+1)/12*TWO_PI)*triLength);
  }
  popMatrix();
}