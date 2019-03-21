float totalframes=200;
float current=-1;
float campos=0;
float camstartsize=200;
float camsize=camstartsize;
Rect[] rects;

void settings() {
  size(floor(displayHeight*0.8), floor(displayHeight*0.8));
}
void setup() {
  noStroke();
  rects=new Rect[2];
  rects[0]=new Rect(camstartsize/5*2,camstartsize/10*3,camstartsize/5,camstartsize/10);
  rects[1]=new Rect(camstartsize/5*2,camstartsize/10*6,camstartsize/5,camstartsize/10);
}
void draw() {
  current++;
  if(current>=totalframes) {
    current=0;
    rects[0]=new Rect(camstartsize/5*2,camstartsize/10*3,camstartsize/5,camstartsize/10);
    rects[1]=new Rect(camstartsize/5*2,camstartsize/10*6,camstartsize/5,camstartsize/10);
  }
  float percent=current/totalframes;
  render(percent);
}

float pTCp(float p) {
  p=map(p,campos,campos+camsize,0,width);
  return p;
}
float sTCs(float p) {
  p=map(p,0,camsize,0,width);
  return p;
}
float smoothstep(float i) {
  i=min(i,1);
  i=max(i,0);
  return i*i*(3-2*i);
}

void render(float percent) {
  camsize=camstartsize-percent*100;
  campos=(camstartsize-camsize)/2;
  if(percent<0.25) {
    rects[0].w=rects[0].startW-smoothstep(percent*4)*rects[0].startW/2;
    rects[0].x=rects[0].startX+(rects[0].startW-rects[0].w)/2;
  }
  if(percent>=0.25 && percent<0.5) {
    rects[0].y=rects[0].startY+smoothstep((percent-0.25)*4)*(camstartsize/2-rects[0].h/2-rects[0].startY);
    rects[1].y=rects[1].startY+smoothstep((percent-0.25)*4)*(camstartsize/2-rects[1].h/2-rects[1].startY);
  }
  background(0);
  fill(255);
  for(int i=0;i<2;i++) {
    rect(pTCp(rects[i].x),pTCp(rects[i].y),sTCs(rects[i].w),sTCs(rects[i].h));
  }
}