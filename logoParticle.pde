class Particle {
  PVector loc, acceleration, velocity;
  float x, y, r,t;
 
  Particle(float x_, float y_) {
    x=x_;
    r=80;
    y=y_;
    t=0;
    acceleration=new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    velocity=new PVector(random(-0.1, -.1), random(-0.1, 0.1));
    loc=new PVector(random(-r/2, r/2)+x, random(-r/2, r/2)+y);
  }
  void update() {
    float d=dist(x, y, loc.x, loc.y);
    
    if (frameCount-t>30) {
      if (d>r) {
        //loc.sub(x,y);
        velocity.mult(-1);
        acceleration.mult(-1);
        t=frameCount;
      }
    }
    //acceleration.sub(new PVector(x,y));
    //acceleration.mult(0.1);

    PVector ace=acceleration.copy();
    ace.mult((r-d)/5+1);
    velocity.add(ace);

    loc.add(velocity);
    velocity.mult(0);
    //acceleration.mult(0);
  }
  void display() {
    stroke(1);
    strokeWeight(2.6);
    point(loc.x, loc.y);
  }
}
