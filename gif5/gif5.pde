float current=0;
float totalframes=300;
float lw=4;
float i=0;
void settings() {
  size(displayHeight, displayHeight);
}
void setup() {                
  noStroke();
  rectMode(CENTER);
  frameRate(10);
}
void draw() {
  float percent=current/totalframes;
  render(percent);
  current++;
  if(current>=totalframes) {
    current=0;
  }
}
float smoothstep(float n) {
  return n*n*(3-2*n);
}

void render(float percent) {
  if(percent<0.2) {
    background(0);
    fill(255);
    i=smoothstep(percent*5)*width;
    rect(i/2,height/2-lw/2,i,lw);
    rect(width/2-lw/2,height-i/2,lw,i);
  }
  if(percent>=0.2 && percent<0.5) {
    background(255);
    fill(0);
    i=(-1*smoothstep(map(percent,0.2,0.5,0,1))+1)*(width-lw);
    for(float n=0;n<4;n++) {
      rect((n%2)*width,floor(n/2)*height,i,i);
    }
  }
  if(percent>=0.5 && percent<0.7) {
    background(255);
    fill(0);
    i=smoothstep((percent-0.5)*5)*width;
    rect(i/2,height/2-lw/2,i,lw);
    rect(width/2-lw/2,height-i/2,lw,i);
  }
  if(percent>=0.7) {
    background(0);
    fill(255);
    i=(-1*smoothstep(map(percent,0.7,1,0,1))+1)*(width-lw);
    for(float n=0;n<4;n++) {
      rect((n%2)*width,floor(n/2)*height,i,i);
    }
  }
}
