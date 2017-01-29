class Shape {
  float r, speed;
  int num;
  float a=0;
  PVector []p;
  Shape(int num_, float r_, float speed_) {
    r=r_;
    num=num_;
    speed=speed_;
    p=new PVector[num+1];
    for (int j=0; j<num+1; j++) {
      p[j]=new PVector(sin(TWO_PI/num*j)*r, cos(TWO_PI/num*j)*r);
    }
  }
  void generatePoints() {
    
  }
  void update(){
    for (int j=0; j<num+1; j++) {
      p[j]=new PVector(sin(TWO_PI/num*j+a)*r, cos(TWO_PI/num*j+a)*r);
    }
    a+=speed;
  }
  void run() {
    noFill();
    pushMatrix();
    
    stroke(1.3);
    float w=map(r,50,200,1.1,0.7);
    strokeWeight(w);
    beginShape();
    for (int k=0; k<num+1; k++) {
      vertex(p[k].x, p[k].y);
    }
    endShape();
    popMatrix();
  }
  PVector[] loc(){
    return p;
  }
}
