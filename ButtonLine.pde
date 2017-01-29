class ButtonLine {
  Rectangle r;  // Button's rectangle
  String s;
  boolean clickedOn;  // Did i click on it?
  boolean rolloverOn; // Did i rollover it?
  int num_=0;
  int dir;
  PImage img;
  float w,h;
  ButtonLine(float x, float y, float w_, float h_,String s_,PImage img_) {
    r = new Rectangle(x, y, w_, h_);
    
    w=w_;
    h=h_;
    s=s_;
    img=img_;
  }

  void display() {
    // Draw rectangle and text based on whether rollover or clicked
    strokeWeight(0.9);
    
    noFill();
    //strokeWeight(0.9);
     
    smooth();
    rectMode(CENTER);
    if (rolloverOn){
      stroke(0.8);
      
    }else{ 
      stroke(1);
      
    }
    
    noFill();
    //noStroke();
    rect(r.x,r.y,w,h,10);
    fill(1);
    textAlign(CENTER);
    textSize(17*multiSize);
    text(s,r.x,r.y+5);
    imageMode(CENTER);
    image(img,r.x-w/3,r.y);
    
    //float b = 0.0;
    //if (clickedOn) b = 1;
    //else if (rolloverOn) b = 0.2;
    //else b = 0;
  }


  // Methods to check rollover, clicked, or released (must be called from appropriate
  // Places in draw, mousePressed, mouseReleased
  boolean rollover() {
    if (r.contains(mouseX,mouseY)) rolloverOn = true;
    else rolloverOn = false;
    return rolloverOn;
  }

  boolean clicked() {
    if (r.contains(mouseX, mouseY)) clickedOn = true;
    return clickedOn;
  }

  void released() {
    clickedOn = false;
    fitness2=0;
  }
}
