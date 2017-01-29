class Star {
  int starNum;
  PVector location;
  PVector velocity;
  float r;
  PVector ori;
  float breath;
  Star(PVector ori_) {
    r=70;
    float x=r*cos(random(0,TWO_PI));
    float y=r*sin(random(0,TWO_PI));
    ori=ori_.get();
    location=new PVector(x+ori.x,y+ori.y);
    breath=random(50);
    velocity=new PVector(random(-.7,0.7),random(-.7,0.7));
    
    
  }
 
  void run() {
      
      move();
      float apha=sin(breath);
      tint(1);
      image(starImg,location.x,location.y, 2*apha+10,2*apha+10);
      breath+=0.05;
    
  }
  void move(){
    location.add(velocity);
    if(dist(location.x,location.y,ori.x,ori.y)>2*r){
      PVector ll=location.get();
      ll.sub(ori);
      ll.normalize();
      location.sub(ll);
      velocity.mult(-1);
      
    }
  }
}
