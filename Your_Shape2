Population population;  
Button next;              //a button to shif to next shape
Button pre, h, s, re, manue;     //buttons that present previous, heart,save,and reset
int popmax;             //popmax refers the max times in each generation
float fitness2, mutationRate, sliderX;          //fitness2 is a global varable to give a plus fitness when the heart button is pressed
PFont font, font2;               //font
int num, numDisplay, dataNum;     
ButtonLine home, info, about, start, dataAnalyse, dataAnalyse2;
float redness;             //the alpha value for heart button
PImage manueimg, save, reset, heart, left, right, red, open, filter, homeicon, infoicon, abouticon, filter2, starImg, dataicon;
boolean maxSize=false;           //a boolean to check if the shape is bigger than screen        
boolean openingPage=true;            //wether is in the opening page
boolean pr=false;
boolean infoOpen=false;
boolean manueOpen=false;
boolean dataOpen=false;
float [][]data;
Rectangle enterButton;
int num00=250;
Shape s0, s1, s2, s3;
Particle[] ps=new Particle[num00];

float showInsideColor=-1;
float showOutsideColor=-1;
float showShapeNum=1;
//starSystem star;     //star system
//starSystem star2;     //star system
//starSystem star3;     //star system
float multiSize;   //this help every element to change its size to fit the different screen size
float sinTime;
void setup() {
  size(480, 853);//1080,1920   480,853  422,750
  multiSize=width/480;
  sliderX=width/2;
  //load font
  font = loadFont("ShreeDev0714-48.vlw");
  font2 = loadFont("KozGoPr6N-ExtraLight-48.vlw");
  //star=new starSystem(5);  //creat a star system with 10 stars
  //star2=new starSystem(5);  //creat a star system with 10 stars
  //star3=new starSystem(8);  //creat a star system with 10 stars
  colorMode(RGB, 1.0);
  popmax = 13;   //the number of first generation
  num=0;
  numDisplay=1;
  mutationRate = 0.06;  // A pretty high mutation rate here, our population is rather small we need to enforce variety
  // Create a population with a target phrase, mutation rate, and population max
  population = new Population(mutationRate, popmax);
  //load every image 
  starImg=loadImage("star.png");
  manueimg=loadImage("manue.png");
  heart=loadImage("heart.png");
  save=loadImage("save.png");
  reset=loadImage("reset.png");
  left=loadImage("left.png");
  right=loadImage("right.png");
  red=loadImage("red.png");
  open=loadImage("open.png");
  filter=loadImage("filter.png");
  homeicon=loadImage("home.png");
  infoicon=loadImage("info.png");
  abouticon=loadImage("about.png");
  filter2=loadImage("filter2.png");
  dataicon=loadImage("data.png");
  s1=new Shape(7, 170, 0.015);
  s0=new Shape(9, 200, -0.02);
  s3=new Shape(3, 70, 0.01);
  s2=new Shape(5, 130, -0.01);
  for (int i=0; i<num00; i++) {
    ps[i]=new Particle(width/2, height/2);
  }

  // create every button
  next=new Button(width-60*multiSize, height/2-70*multiSize, 50*multiSize, 50*multiSize, right);
  pre=new Button(30*multiSize, height/2-70*multiSize, 50*multiSize, 50*multiSize, left);
  re=new Button(65*multiSize, 0.88*height, 50*multiSize, 50*multiSize, reset);
  s=new Button(width-95*multiSize, 0.88*height, 50*multiSize, 50*multiSize, save);
  h=new Button(width/2-13*multiSize, 0.88*height, 50*multiSize, 50*multiSize, heart);
  manue=new Button(25, 5, 68*multiSize, 68*multiSize, manueimg);
  home=new ButtonLine(width/2, 260, 305, 58, "Home", homeicon);
  info=new ButtonLine(width/2, 345, 305, 58, "Shape info", infoicon);
  about=new ButtonLine(width/2, 515, 305, 58, "About", abouticon);
  start=new ButtonLine(width/2, 685, 305, 58, "create your shape", abouticon);
  dataAnalyse=new ButtonLine(width/2, 430, 305, 58, "Data analyse", dataicon);
  dataAnalyse2=new ButtonLine(width/2, 665, 305, 58, "Data analyse", dataicon);


  data=new float [500][12];
}

void draw() {
  data();
  println(mouseX, mouseY);
  textFont(font);
  openingPage();
  if (openingPage) {
    openingPage();
  } else {

    if (manueOpen==false) {
      shapeGenerate();
    } else { 
      if (infoOpen==true) {
        info();
      } else if (dataOpen==true) {
        dataAnalyse();
      } else {
        manue();
      }
    }
  }
  // println("info"+infoOpen, "data"+dataOpen);
}

void mousePressed() {

  // If the button is clicked, evolve next generation
  if (next.clicked()) {
    num++;
    pr=false;
    numDisplay++;

    if (num % popmax==0) {
      population.selection();
      population.reproduction();
      popmax--;
      popmax=constrain(popmax, 5, 100);
    }
  }
  //if previous button clicked, num decrease to previous shape
  if (pre.clicked()) {
    pr=true;
    if (num % popmax==0) {
    } else {
      num--;
      num=constrain(num, 1, 100000); //make sure num is always positive
      numDisplay--;
      numDisplay=constrain(numDisplay, 1, 100000);
    }
  }
  //if save button is clicked, save the shape image
  if (s.clicked()) {
    saveFrame("AnyShape"+frameCount+".png");
    background(1);
  }
  //if heart button is clicked, give another 50 value to the fitness
  if (h.clicked()) {
    fitness2=50;
  }
  if (re.clicked()) {
    popmax=13;
    population = new Population(mutationRate, popmax);
    num=0;
    numDisplay=1;
    data=new float [500][12];
  }
  if (manue.clicked()) {
    if (manueOpen==false) {
      manueOpen=true;
      infoOpen=false;
      dataOpen=false;
    } else {
      manueOpen=false;
    }
    //population = new Population(mutationRate, popmax);
  }
  if (start.clicked()) {
    openingPage=false;
  }
  if (home.clicked()&&dataOpen!=true) {
    openingPage=true;
    manueOpen=false;
  }
  if (info.clicked() && manueOpen==true) {
    //dataOpen=false;
    infoOpen=true;
  }
  if (dataAnalyse.clicked() && manueOpen==true) {
    infoOpen=false;
    dataOpen=true;
  }
  if (dataAnalyse2.clicked()&& manueOpen==true ) {
    infoOpen=false;
    dataOpen=true;
  }

  if (mouseX>400&&mouseX<420&&mouseY>300&&mouseY<320&&dataOpen==true) {
    showShapeNum*=-1;
    showInsideColor=-1;
    showOutsideColor=-1;
  }
  if (mouseX>60&&mouseX<80&&mouseY>300&&mouseY<320&&dataOpen==true) {
    showShapeNum=-1;
    showInsideColor*=-1;
    showOutsideColor=-1;
  }
  if (mouseX>230&&mouseX<245&&mouseY>300&&mouseY<320&&dataOpen==true) {
    showShapeNum=-1;
    showInsideColor=-1;
    showOutsideColor*=-1;
  }
}




// if mouse is released, every button releases
void mouseReleased() { 
  next.released();
  pre.released();
  s.released();
  re.released();
  h.released();
  manue.released();
  start.released();
  info.released();
  home.released();
  dataAnalyse.released();
  dataAnalyse2.released();
}




//all the text element in the screen, including generation, times 
void drawText() {
  fill(#c688ae);
  textAlign(RIGHT);

  textSize(35*multiSize); 
  text(population.getGenerations(), width-55*multiSize, 43*multiSize);

  textAlign(LEFT);
  textSize(18*multiSize);
  if (population.getGenerations()%10==1) {
    text("st", width-53*multiSize, 30*multiSize);
  } else if (population.getGenerations()%10==2) {
    text("nd", width-53*multiSize, 30*multiSize);
  } else if (population.getGenerations()%10==3) {
    text("rd", width-53*multiSize, 30*multiSize);
  } else {
    text("th", width-53*multiSize, 30*multiSize);
  }
  textAlign(CENTER);
  textSize(55*multiSize);
  text(numDisplay, width/2, height/2+230*multiSize);
  textSize(18*multiSize);
  text("   times", width/2, height/2+260*multiSize);
  //println(redness);
}




void shapeGenerate() {
  pushMatrix();
  translate(0, 18*multiSize);
  background(#edeef7);
  // Display the faces
  if (maxSize==false) {
    population.display();
  } else {
    if (pr) {
      maxSize=false;
      num--;
    } else {
      maxSize=false;
      num++;
      if (num % popmax==0) {
        population.selection();                
        //when the maxSize is ture which means the num will increase, 
        //ocassionly, if num%popmax ==0; and num increase, we should also make sure the generation will increase as well
        population.reproduction();
        popmax--;
        popmax=constrain(popmax, 5, 100);
      }
    }
  }
  imageMode(CORNER);
  tint(1, constrain(redness-20, 0, 100)/150);
  image(red, width/2-13*multiSize-25*multiSize, 0.88*height-25*multiSize, 80*multiSize, 80*multiSize);

  drawText();//draw every text 

  // Display the button
  next.display();
  next.rollover();
  pre.display();
  pre.rollover();
  re.display();
  re.rollover();
  s.display();
  s.rollover();
  h.display();
  h.rollover();
  manue.display();
  manue.rollover();

  popMatrix();
}


void openingPage() {
  imageMode(CORNER);
  tint(1);
  image(open, 0, 0, width, height);

  start.display();
  start.rollover();
  pushMatrix();
  translate(100, -10);
  drawLogo();
  popMatrix();
}


void manue() {
  shapeGenerate();
  filter(BLUR, 3);
  tint(1);
  image(filter, 0, 0, width, height);
  home.display();
  info.display();
  dataAnalyse.display();
  about.display();

  home.rollover();
  info.rollover();
  about.rollover();
  dataAnalyse.rollover();
}
void info() {
  shapeGenerate();

  filter(BLUR, 3);
  tint(1);
  image(filter, 0, 0, width, height);
  textAlign(CENTER);
  textSize(18);
  fill(1);
  text("color inside", width/2, 100);
  text("color inside", width/2, 255);
  text("values in the fomula", width/2, 410);
  textSize(38);
  float r1=population.population[num%popmax].dna.genes[6];
  float g1=population.population[num%popmax].dna.genes[7];
  float b1=population.population[num%popmax].dna.genes[8];
  float r2=population.population[num%popmax].dna.genes[9];
  float g2=population.population[num%popmax].dna.genes[10];
  float b2=population.population[num%popmax].dna.genes[11];
  text(int((r1)*225), 135, 150);
  text(int((g1)*225), width/2, 150);
  text(int((b1)*225), width-135, 150);

  text(int((r2)*255), 135, 310);
  text(int((b2)*225), width/2, 310);
  text(int((g2)*225), width-135, 310);
  color fColor = color(r1, g1, b1);
  color from = color(r2, g2, b2);

  float y=20;

  textSize(14);
  text("red", 135, 150+y);
  text("green", width/2, 150+y);
  text("blue", width-135, 150+y);

  text("red", 135, 310+y);
  text("green", width/2, 310+y);
  text("blue", width-135, 310+y);



  y=50;
  fill(1, 0.3);
  noStroke();
  float r=25;
  ellipse(135, 150+y, r, r);
  ellipse(width/2, 150+y, r, r);
  ellipse(width-135, 150+y, r, r);
  ellipse(135, 310+y, r, r);
  ellipse(width/2, 310+y, r, r);
  ellipse(width-135, 310+y, r, r);
  r=8;
  fill(#f15aa8);
  ellipse(135, 150+y, r, r);
  ellipse(135, 310+y, r, r);
  fill(#46df8f);
  ellipse(width/2, 150+y, r, r);
  ellipse(width/2, 310+y, r, r);
  fill(#5a9af1);
  ellipse(width-135, 310+y, r, r);
  ellipse(width-135, 150+y, r, r);


  float a      = map(population.population[num%popmax].dna.genes[0], 0, 1, 1, 5);
  float b      = map(population.population[num%popmax].dna.genes[1], 0, 1, 1, 5);
  float m   = (int)map(population.population[num%popmax].dna.genes[2], 0, 1, 2, 20);
  float n1    = map(population.population[num%popmax].dna.genes[3], 0, 1, 0.3, 15);
  float n2    = map(population.population[num%popmax].dna.genes[4], 0, 1, 0.5, 4);
  float n3     = map(population.population[num%popmax].dna.genes[5], 0, 1, 0.5, 4);

  pushMatrix();
  translate(0, 15);
  textSize(38);
  fill(1);



  //float b=(float)(round(a*10))/10;
  text(nf(n1, 1, 1), 135, 450);
  text(nf(n2, 1, 1), width/2, 450);
  text(nf(n3, 1, 1), width-135, 450);
  //println(int(map(population.population[num%popmax].dna.genes[3], 0, 1, 0.3, 15)));
  text(nf(a, 1, 1), 135, 548);
  text(nf(b, 1, 1), width/2, 548);
  text(nf(m, 1, 1), width-135, 548);

  y=20;
  textSize(14);
  text("n1", 135, 450+y);
  text("n2", width/2, 450+y);
  text("n3", width-135, 450+y);

  text("a", 135, 548+y);
  text("b", width/2, 548+y);
  text("m", width-135, 548+y);

  popMatrix();

  pushMatrix();
  translate(0, height-150);
  noFill();
  stroke(from);
  smooth();

  beginShape();
  for (int i=0; i<width; i++) {

    float theta2=map(i, 0, width, TWO_PI, 0);
    float rr2=pow(pow(abs(cos(m*theta2/4.0)/a), n2)+
      pow(abs(sin(m*theta2/4.0)/b), n3), -1.0/n1);
    //print(rr2);
    // float x2=rr2*cos(theta2)*80*multiSize;
    float y2=rr2*sin(theta2)*80*multiSize;
    vertex(i, y2/1.6);
  }
  endShape();

  stroke(fColor);
  beginShape();
  for (int i=0; i<width; i++) {

    float theta2=map(i, 0, width, TWO_PI, 0);
    float rr2=pow(pow(abs(cos(m*theta2/4.0)/a), n2)+
      pow(abs(sin(m*theta2/4.0)/b), n3), -1.0/n1);
    //print(rr2);
    float x2=rr2*cos(theta2)*80*multiSize;
    //float y2=rr2*sin(theta2)*80*multiSize;
    vertex(i, x2/3.5);
  }
  endShape();
  popMatrix();
  //translate(0, 150);

  dataAnalyse2.display();
  dataAnalyse2.clicked();
}
void dataAnalyse() {
  shapeGenerate();
  //background(0);
  filter(BLUR, 5);
  image(filter2, 0, 0, width, height);
  //dataNum=mouseX;
  noStroke();

  pushMatrix();
  translate(width/2+-11, height/2+133);
  beginShape();
  float theta=TWO_PI/6;
  fill(#F59F5E, 0.4);
  stroke(#FC36A3);
  float xx=0;
  float yy=0;
  for (int j=0; j<6; j++) {

    float rrr=constrain(data[dataNum][j]*140, 50, 130);
    float x=sin(theta*j)*rrr;
    float y=cos(theta*j)*rrr;
    vertex(x, y);
    if (j==0) {
      xx=x;
      yy=y;
    }
  }
  vertex(xx, yy);
  endShape();
  popMatrix();
  println(num, numDisplay);
  slider();
  fill(1);
  textSize(25);
  text(dataNum, width/2+-11, height/2+133);

  if (showInsideColor>0) {
    fill(1, 0.7);
    rectMode(CENTER);
    rect(69, 307, 15, 15, 2);
    noFill();
    showShapeNum=-1;
    showOutsideColor=-1;


    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][6], 0, 1, 95, 250);
      stroke(#FFB9B9);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();

    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][7], 0, 1, 95, 250);
      stroke(#B9FFBC);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();

    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][8], 0, 1, 95, 250);
      stroke(#B9D1FF);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();
  }

  if (showOutsideColor>0) {
    fill(1, 0.7);
    rectMode(CENTER);
    rect(239, 306, 15, 15, 2);
    noFill();
    showShapeNum=-1;
    showInsideColor=-1;


    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][9], 0, 1, 95, 250);
      stroke(#FFB9B9);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();

    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][10], 0, 1, 95, 250);
      stroke(#B9FFBC);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();

    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][11], 0, 1, 95, 250);
      stroke(#B9D1FF);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();
  }

  if (showShapeNum>0) {
    fill(1, 0.7);
    rectMode(CENTER);
    rect(408, 306, 15, 15, 2);
    noFill();
    showInsideColor=-1;
    showOutsideColor=-1;


    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][0], 0, 1, 95, 250);
      stroke(#FFCEE3);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();
    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][1], 0, 1, 95, 250);
      stroke(#CEF8FF);
      strokeWeight(1);
      curveVertex(pointX, pointY);
    }
    endShape();
    beginShape();
    for (int i=0; i<numDisplay; i++) {
      float pointX=map(i, 0, numDisplay, 44, 445);
      float pointY=map(data[i][2], 0, 1, 95, 250);
      stroke(#B9FFDE);

      curveVertex(pointX, pointY);
    }
    endShape();
  }
  //beginShape();
  //for(int i=0;i<numDisplay;i++){
  //  float pointX=map(i,0,numDisplay,44,445);
  //  float pointY=map(data[i][3],0,1,95,250);
  //  stroke(#E6FFB9);
  //  curveVertex(pointX,pointY);

  //}
  //endShape();
  //beginShape();
  //for(int i=0;i<numDisplay;i++){
  //  float pointX=map(i,0,numDisplay,44,445);
  //  float pointY=map(data[i][4],0,1,95,250);
  //  stroke(#FFEFB9);
  // // strokeWeight(1);
  //  curveVertex(pointX,pointY);

  //}
  //endShape();
  //beginShape();
  //for(int i=0;i<numDisplay;i++){
  //  float pointX=map(i,0,numDisplay,44,445);
  //  float pointY=map(data[i][5],0,1,95,250);
  //  stroke(#FFB9FF);
  //  //strokeWeight(1);
  //  curveVertex(pointX,pointY);
  //}
  //endShape();
  //beginShape();
  //for(int i=0;i<numDisplay;i++){
  //  float pointX=map(i,0,numDisplay,44,445);
  //  float pointY=map(data[i][6],0,1,95,250);
  //  stroke(#FFB9B9);
  //  //strokeWeight(1);
  //  curveVertex(pointX,pointY);
  //}
  //endShape();
}
void data() {
  for (int i=0; i<12; i++) {
    data[numDisplay][i]=population.population[num%popmax].dna.genes[i];
  }
}
void slider() {
  float y=height/2+311;
  float w=37;
  float h=16;
  fill(#C9C9C9);
  noStroke();
  if (mouseX>sliderX-60 && mouseX<sliderX+w+60 && mouseY>y-10 && mouseY<y+h+10 && mousePressed) {
    sliderX=mouseX;
    fill(1);
  }
  sliderX=constrain(sliderX, 100, width-100);
  dataNum=int(map(sliderX, 100, width-100, 1, numDisplay));
  //rectMode(CORNER);

  rect(sliderX-w/2, y, w, h, 3);
}

void drawLoading() {

  noFill();
  stroke(1);
  strokeWeight(0.5);
  float n2=sin(sinTime)+1;
  float n3=cos(sinTime)+1;
  pushMatrix();
  rotate(sinTime/10);
  beginShape();
  for (float theta2=0; theta2<=TWO_PI; theta2+=0.04) {
    float r=rr(
      theta2, 
      1, //a
      1, //b
      8, //m
      0.6, //n1
      n2, //n2
      n3    //n3
      );
    float x=r*(cos(theta2))*120;
    float y=r*(sin(theta2))*120;
    vertex(x, y);
  }
  endShape();
  popMatrix();
  pushMatrix();
  rotate(TWO_PI-sinTime/12);
  strokeWeight(0.5);
  //beginShape();
  int m=12;
  for (float theta2=0; theta2<=TWO_PI; theta2+=PI/m) {
    float r=rr(
      theta2, 
      1.1, //a
      1.1, //b
      m, //m
      0.6, //n1
      map(n2, 0, 2, 2, 1.5), //n2
      map(n3, 0, 2, 2, 1.5)    //n3
      );
    float r2=rr(
      theta2-PI/m, 
      1.1, //a
      1.1, //b
      m, //m
      0.6, //n1
      map(n2, 0, 2, 2, 1.5), //n2
      map(n3, 0, 2, 2, 1.5)    //n3
      );
    float x=r*cos(theta2)*65;
    float y=r*sin(theta2)*65;
    float x2=r2*cos(theta2-PI/m)*65;
    float y2=r2*sin(theta2-PI/m)*65;
    //point(x,y);
    line(x, y, x2, y2);
  }
  popMatrix();
  pushMatrix();
  rotate(sinTime/15);
  beginShape();
  strokeWeight(1+sin(sinTime)*0.3);
  for (float theta2=0; theta2<=TWO_PI; theta2+=0.04) {
    float r=rr(
      theta2, 
      1, //a
      1, //b
      8, //m
      0.6, //n1
      n2, //n2
      n3    //n3
      );
    float x=r*(cos(theta2))*80;
    float y=r*(sin(theta2))*80;
    vertex(x, y);
  }
  endShape();
  popMatrix();
  sinTime+=0.06;
}
float rr(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m*theta/4.0)/a), n2)+
    pow(abs(sin(m*theta/4.0)/b), n3), -1.0/n1);
}



void drawLogo() {
  pushMatrix();
  scale(0.6);
  for (int i=0; i<ps.length; i++) {
    ps[i].update();
    ps[i].display();
  }
  pushMatrix();
  translate(width/2, height/2);
  s0.update();
  s1.update();
  s2.update();
  s3.update();
  s0.run();
  s1.run();
  s2.run();
  s3.run();

  PVector p[]=s0.loc();
  PVector p1[]=s1.loc();
  PVector p2[]=s2.loc();
  PVector p3[]=s3.loc();
  for (int j=0; j<p.length; j++) {
    for (int k=0; k<p1.length; k++) {
      float d=dist(p[j].x, p[j].y, p1[k].x, p1[k].y);
      if (d<130) {
        strokeWeight(0.7);
        line(p[j].x, p[j].y, p1[k].x, p1[k].y);
      }
    }
  }
  for (int j=0; j<p2.length; j++) {
    for (int k=0; k<p1.length; k++) {
      float d=dist(p2[j].x, p2[j].y, p1[k].x, p1[k].y);
      if (d<130) {
        strokeWeight(0.9);
        line(p2[j].x, p2[j].y, p1[k].x, p1[k].y);
      }
    }
  }  
  for (int j=0; j<p2.length; j++) {
    for (int k=0; k<p3.length; k++) {
      float d=dist(p2[j].x, p2[j].y, p3[k].x, p3[k].y);
      if (d<120) {
        strokeWeight(1.3);
        line(p2[j].x, p2[j].y, p3[k].x, p3[k].y);
      }
    }
  } 
  for (int j=0; j<p2.length; j++) {
    for (int k=0; k<p.length; k++) {
      float d=dist(p2[j].x, p2[j].y, p[k].x, p[k].y);
      if (d<120) {
        strokeWeight(0.7);
        line(p2[j].x, p2[j].y, p[k].x, p[k].y);
      }
    }
  } 
  popMatrix();
  popMatrix();
}
