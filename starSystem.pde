class starSystem{
  int num;
  ArrayList <Star>stars;
  float minDis;
  float maxDis;
  PVector ori;
  starSystem(int num_){
    stars=new ArrayList<Star>();
    ori=new PVector (random(100,width-100),random(100,height-100));
    num=num_;
    minDis=10;
    maxDis=70;
  }
  void addStar(){
    if(stars.size()<num){
      stars.add(new Star(ori));
    }
  }
  void run(){
    drawLine();
    for(Star s:stars){
      s.run();
    }
  }
  void drawLine(){
    
    for(int i=0;i<stars.size();i++){
      for(int j=0;j<stars.size();j++){
        Star s1=stars.get(i);
        Star s2=stars.get(j);
        float dis=dist(s1.location.x,s1.location.y,s2.location.x,s2.location.y);
        if(dis<maxDis&&dis>minDis){
          strokeWeight(0.2);
          stroke(#D6E7FF,100);
          line(s1.location.x,s1.location.y,s2.location.x,s2.location.y);
        }
      }
    }
  }
}
