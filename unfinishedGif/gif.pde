Circle[] cs;
float linelen;
void settings() {
  size(displayHeight,displayHeight);
}
void setup() {
  cs=new Circle[20];
  linelen=width/3.5;
  for(int i=0;i<cs.length;i++) {
    cs[i]=new Circle(random(width*0.1, width*0.9),random(height*0.1, height*0.9),width/160,random(height/15,height/8),random(0.03,random(0.03,0.15)));
  }
  noFill();
}
void draw() {
  background(0);
  for(int i=0;i<cs.length;i++) {
    strokeWeight(2);
    cs[i].update();
    cs[i].show();
    for(int j=0;j<cs.length;j++) {
      if(j!=i) {
        float d=dist(cs[i].x,cs[i].y,cs[j].x,cs[j].y);
        if(d<=linelen) {
          strokeWeight(map(d,0,linelen,2,0.5));
          stroke(255,255,255,map(d,0,linelen,255,150));
          line(cs[i].x+(cs[j].x-cs[i].x)/d*cs[i].size,cs[i].y+(cs[j].y-cs[i].y)/d*cs[i].size,cs[j].x+(cs[i].x-cs[j].x)/d*cs[j].size,cs[j].y+(cs[i].y-cs[j].y)/d*cs[j].size);
        }
      }
    }
  }
}