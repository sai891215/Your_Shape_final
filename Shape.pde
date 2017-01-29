class Face {

  DNA dna;          // Face's DNA
  float fitness;    // How good is this face?
  float x, y, rr2;       // Position on screen
  int wh = 70;      // Size of square enclosing face
  boolean rolloverOn; // Are we rolling over this face?
  float maxLength;    //the record of the max length of the shape, 
  //in case the shape is too big
  Rectangle r;

  // Create a new face
  Face(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_; 
    y = y_;
    fitness = 1;
    maxSize=false;

    // Using java.awt.Rectangle (see: http://java.sun.com/j2se/1.4.2/docs/api/java/awt/Rectangle.html)
    r = new Rectangle(int(x-wh/2), int(y-wh/2), int(wh), int(wh));
  }

  // Display the face
  void display() {

    //float theta = map(dna.genes[0], 0, 1, 0, 5);
    float a      = map(dna.genes[0], 0, 1, 1, 5);
    float b      = map(dna.genes[1], 0, 1, 1, 5);
    float m   = (int)map(dna.genes[2], 0, 1, 2, 20);
    float n1    = map(dna.genes[3], 0, 1, 0.3, 15);
    float n2    = map(dna.genes[4], 0, 1, 0.5, 4);
    float n3     = map(dna.genes[5], 0, 1, 0.5, 4);
    color fColor = color(dna.genes[6], dna.genes[7], dna.genes[8]);
    color from = color(dna.genes[9], dna.genes[10], dna.genes[11]);
    // Once we calculate all the above properties, we use those variables to draw rects, ellipses, etc.
    pushMatrix();
    translate(width/2, height/2-70*multiSize);

    int lineNum=150;//the density 


    for (float theta2=0; theta2<=TWO_PI; theta2+=0.01) {
      rr2=rr(theta2, a, b, m, n1, n2, n3);
      float x=rr2*cos(theta2)*87*multiSize;
      float y=rr2*sin(theta2)*87*multiSize;

      if (abs(x)>maxLength) {
        maxLength=x;
      }
      if(abs(y)>maxLength){
        maxLength=y;
      }
    }

    if (maxLength>width/2-15) {
      maxSize=true;   
      maxLength=0;
    } else {
      maxSize=false;
    }
    println(maxSize);

    

      //draw the shadow of the shape
      fill(0.8);
      noStroke();
      beginShape();
      for (float theta2=0; theta2<=TWO_PI; theta2+=0.01) {
        rr2=rr(theta2, a, b, m, n1, n2, n3);
        float x=rr2*cos(theta2)*87*multiSize;
        float y=rr2*sin(theta2)*87*multiSize;
        vertex(x, y+22*multiSize);
      }
      endShape();
      filter(BLUR, 6);



      noFill();
      strokeWeight(2.5*multiSize);
      for (int i=0; i<lineNum; i++) {

        float ler=map(i, 0, lineNum, 0, 1);
        color fin=lerpColor(from, fColor, ler);
        stroke(fin);

        beginShape();
        for (float theta2=0; theta2<=TWO_PI; theta2+=0.01) {
          rr2=rr(theta2, a, b, m, n1, n2, n3);
          float x=rr2*cos(theta2)*ler*80*multiSize;
          float y=rr2*sin(theta2)*ler*80*multiSize;
          vertex(x, y);
        }
        endShape();
      }


      noFill();
      stroke(fColor);
      strokeWeight(multiSize);
      beginShape();
      for (float theta2=0; theta2<=TWO_PI; theta2+=0.01) {
        rr2=rr(theta2, a, b, m, n1, n2, n3);
        float x=rr2*cos(theta2)*87*multiSize;
        float y=rr2*sin(theta2)*87*multiSize;
        vertex(x, y);
      }
      endShape();




      stroke(0.25);
      if (rolloverOn) fill(0, 0.25);
      else noFill();

      popMatrix();

      fitness +=2;
    
  }

  float getFitness() {
    if (fitness>20) {
      fitness=fitness+fitness2;
      return fitness;
    } else {
      if (fitness2<1) {
        return 1;
      } else {
        return fitness=fitness+fitness2;
      }
    }
  }
  boolean maxSize() {
    if (maxSize=true)return true;
    else return false;
  }

  DNA getDNA() {
    return dna;
  }
  float rr(float theta, float a, float b, float m, float n1, float n2, float n3) {
    return pow(pow(abs(cos(m*theta/4.0)/a), n2)+
      pow(abs(sin(m*theta/4.0)/b), n3), -1.0/n1);
  }
}
