class Button {
  Rectangle r;  // Button's rectangle

  boolean clickedOn;  // Did i click on it?
  boolean rolloverOn; // Did i rollover it?
  int num_=0;
  int dir;
  PImage img;
  float w,h;
  Button(float x, float y, float w_, float h_,PImage img_) {
    r = new Rectangle(x, y, w_, h_);
    img=img_;
    w=w_;
    h=h_;
    
  }

  void display() {
    // Draw rectangle and text based on whether rollover or clicked
    imageMode(CORNER);
    stroke(0); 
    noFill();
    strokeWeight(0.9);
    
    if (rolloverOn) tint(1,0.6);
    //else if (clickedOn) tint(0.9);
    else tint(1);
    image(img,r.x,r.y,w*0.6,h*0.6);
    
 
    float b = 0.0;
    if (clickedOn) b = 1;
    else if (rolloverOn) b = 0.2;
    else b = 0;
  }


  // Methods to check rollover, clicked, or released (must be called from appropriate
  // Places in draw, mousePressed, mouseReleased
  boolean rollover() {
    if (r.contains(mouseX, mouseY)) rolloverOn = true;
    else rolloverOn = false;
    return rolloverOn;
  }

  boolean clicked() {
    if (r.contains(mouseX,mouseY)) clickedOn = true;
    return clickedOn;
  }

  void released() {
    clickedOn = false;
    fitness2=0;
  }
}
