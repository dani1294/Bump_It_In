/* //<>//
Bump it in 
by Daniela Morales

Original Kinect Version
*/

import org.openkinect.processing.*;

// Kinect Library object
Kinect2 kinect2;

float minThresh = 1200;
float maxThresh = 2000;
//Test distance 
//float minThresh = mouseX;
//float maxThresh = mouseY;

PImage img;
PImage img2;

color body = color(250, 0, 250);

int d;

int slow = 30;
int fast = 40;

//Square variables
int ssize = int (random(50, 100));
int sx = int(random(40, 2736 - 40 - ssize)); // We use 2736 instead of width since we are mapping the kinect to this size
int sy = int(random(-200, -100));
//variables used for area division into triangles (x and y for the center and each vertix)
int srx = sx + (ssize/2) ;
int sry = sy + (ssize/2) ;
int sx2 = sx + ssize;
int sy2 = sy;
int sx3 = sx + ssize;
int sy3 = sy + ssize;
int sx4 = sx;
int sy4 = sy + ssize;
PShape square;
int sspeed = int(random(slow, fast));
boolean sright = false;
boolean sleft = false;
boolean sup = false;
boolean sdown = false;

//Circle Variables
int csize = int(random(70, 100));
int cx = int(random(40 + csize, 2736 - 40 - csize));
int cy = int(random(-200, -100));
int cr = csize/2;
int cx0 = cx - cr;
int cy0 = cy - cr;
int crx = cx + cr;
int cry = cy + cr;
PShape circle;
int cspeed = int(random(slow, fast));
boolean cse = false;
boolean csw = false;
boolean cne = false;
boolean cnw = false;

//Diamond Variables
int dsize = int(random(80, 130));
int dx = int(random(40 + dsize, 2736 - 40 - dsize));
int dy = int(random(-200, -100));
int dr = dsize/2;
int dx1 = dx - dr; 
int dy1 = dy;
int dx2 = dx;
int dy2 = dy - dr;
int dx3 = dx + dr;
int dy3 = dy;
int dx4 = dx;
int dy4 = dy + dr;
PShape diamond;
int dspeed = int(random(slow, fast));
boolean dse = false;
boolean dsw = false;
boolean dne = false;
boolean dnw = false;

//Triangle variables
int tsize = int(random(80, 120));
int tx = int(random(40 + tsize, 2736 - 40 -tsize)); //(40 is obstacle)
int ty = int(random(-200, -100));
int tr = tsize/2;
int tx1 = tx - tr; 
int ty1 = ty + tr;
int tx2 = tx;
int ty2 = ty - tr;
int tx3 = tx + tr;
int ty3 = ty + tr;
PShape triangle;
int tspeed = int(random(slow, fast));
boolean tne = false;
boolean tnw = false;
boolean ts = false;


Square[] manySquares = new Square[1];
Circle[] manyCircles = new Circle[1];
Triangle[] manyTriangles = new Triangle[1];
Diamond[] manyDiamonds = new Diamond[1];

//points
int point = 0;
boolean sin = false;
boolean sout = true;
boolean cin = false;
boolean cout = true;
boolean din = false;
boolean dout = true;
boolean tin = false;
boolean tout = true;

int savedPoints;
int totalPoints = 10;
int addedPoints;
int addedSpeedPoints;
int savedSpeedPoints;
int totalSpeedPoints = 10;

//Obstacles
int obsColor = (255);
int gap = 500;
int obsY1 = int(random(50, height-gap-50));
int obsY2 = (obsY1+gap);
int obsY3 = int(random(50, height-gap-50));
int obsY4 = (obsY3+gap);


//Timer
int savedTime;
int totalTime = 60000; // 1 minute
int passedTime;

//Square area divided into triangles.
float Asarea;
float Asarea1;
float Asarea2;
float Asarea3;

float Bsarea;
float Bsarea1;
float Bsarea2;
float Bsarea3;

float Csarea;
float Csarea1;
float Csarea2;
float Csarea3;  

float Dsarea;
float Dsarea1;
float Dsarea2;
float Dsarea3;  

// detect when the triangle is touched. Calculate area of triangle and area of 2 vertices and MouseX/Y. If the last are equal to area then  it's touched.
float Atarea;
float Atarea1;
float Atarea2;
float Atarea3;

float Btarea;
float Btarea1;
float Btarea2;
float Btarea3;

float Ctarea;
float Ctarea1;
float Ctarea2;
float Ctarea3;  

//Diamond area divided into triangles.
float Adarea;
float Adarea1;
float Adarea2;
float Adarea3;

float Bdarea;
float Bdarea1;
float Bdarea2;
float Bdarea3;

float Cdarea;
float Cdarea1;
float Cdarea2;
float Cdarea3;  

float Ddarea;
float Ddarea1;
float Ddarea2;
float Ddarea3; 

//Areas for shape collission
float sx4tb1;
float sx4tb2;
float sx4tb3;

float sx3ta1;
float sx3ta2;
float sx3ta3;

float sx3da1;
float sx3da2;
float sx3da3;

float sx4db1;
float sx4db2;
float sx4db3;

float sxdc1;
float sxdc2;
float sxdc3;

float sx2dd1;
float sx2dd2;
float sx2dd3;

float tx3da1;
float tx3da2;
float tx3da3;

float tx1db1;
float tx1db2;
float tx1db3;

float tx2dc1;
float tx2dc2;
float tx2dc3;

float tx2dd1;
float tx2dd2;
float tx2dd3;

float dx3ta1;
float dx3ta2;
float dx3ta3;

float dx1tb1;
float dx1tb2;
float dx1tb3;


void setup() {
  //size(512, 424, P2D); //Kinect Original size 
  size(2736, 1824, P2D);
  //size(2736,1824,FX2D); ///FX2D makes rendering faster and less heavy for the computer
  background(50);

  
  //Call Kinect
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  img2 = createImage(width, height, RGB);

  //Shapes  
  for (int i = 0; i <manySquares.length; i ++) {
    manySquares[i] = new Square();
  }
  for (int i = 0; i <manyCircles.length; i ++) {
    manyCircles[i] = new Circle();
  }
  for (int i = 0; i <manyTriangles.length; i ++) {
    manyTriangles[i] = new Triangle();
  }
  for (int i = 0; i <manyDiamonds.length; i ++) {
    manyDiamonds[i] = new Diamond();
  } 

  savedTime = millis();
  savedPoints = 0;
  savedSpeedPoints = 0;
}

void draw() {
  //Kinect    
  img.loadPixels();
  img2.loadPixels();

  // Get the raw depth as array of integers
  int[] depth = kinect2.getRawDepth(); 

  for (int x = 0; x < kinect2.depthWidth; x++) {
    for (int y = 0; y < kinect2.depthHeight; y++) {
      int offsetImg1 = x + y * kinect2.depthWidth ;
      int xo = int(map(x, 0, kinect2.depthWidth, 0, width));
      int yo = int(map(y, 0, kinect2.depthHeight, 0, height));
      int offsetImg2 = xo + yo * width;
      int d = depth[offsetImg1];

      if (d > minThresh && d < maxThresh) {      
        img2.pixels[offsetImg2] = body;
      } else {
        img2.pixels[offsetImg2] = color(0, 0, 0);
      }
    }
  }

  bodyColl(); // Kinect collision detection

  points();

  //Kinect Update image
  img2.updatePixels();
  image(img2, 0, 0);

  //To test kinect distance (need to make var minThresh and maxThres mouseX and mouseY at the beginning)
  //test threshold
  //minThresh = map(mouseX, 0, width, 0, 4500);
  //maxThresh = map(mouseY, 0, height, 0, 4500); 
  //fill(255);
  //textSize(50);
  //text(minThresh + " " + maxThresh, 100, 64);

  //Place all assets of the screen after the kinect pixel update
  fill(255);
  textSize(50);
  text(point, width/2, 55);

  obstacles();

  squ();

  if (point >= 1 || millis() > 30000) {
    cir();
  }
  if (point >= 4 || millis() > 60000) {
    dia();
  }
  if (point >= 8 || millis() > 90000) {
    tri();
  }
  Collision();
}

void squ() {
  // display many squares
  for (int i=0; i < manySquares.length; i++) {
    manySquares[i].display();  
    manySquares[i].fall();
    manySquares[i].move();
  }
}

void cir() { 
  for (int i=0; i < manyCircles.length; i++) {
    manyCircles[i].display();  
    manyCircles[i].fall();
    manyCircles[i].move();
  }
}

void tri() {
  for (int i=0; i < manyTriangles.length; i++) {
    manyTriangles[i].display();  
    manyTriangles[i].fall();
    manyTriangles[i].move();
  }
}

void dia() {
  for (int i=0; i < manyDiamonds.length; i++) {
    manyDiamonds[i].display();  
    manyDiamonds[i].move();
    manyDiamonds[i].fall();
  }
}

void obstacles() {
  fill(obsColor);
  //rect options:
  //rect(a, b, c, d, tl, tr, br, bl)
  noStroke();
  rect(0, 0, 40, obsY1);
  rect(0, obsY2, 40, 1824);
  rect(width-40, 0, 40, obsY3);
  rect(width-40, obsY4, 40, 1824);
}

void points() {
  //Check if each shape is in or out of the barriers
  if (sout && sx >= width && sy > obsY3 && sy4 < obsY4 || sout && sx2 <= 0 && sy2 > obsY1 && sy3 < obsY2 ) {
    sin = true;
    sout = false;
  }
  if (cout && cx0 >= width-10 && cy > obsY3 && cy < obsY4 || cout && crx <= 10 && cy > obsY1 && cy < obsY4  ) {
    cin = true;
    cout = false;
  }
  if (dout && dx1 >= width-10 && dy > obsY3 && dy < obsY4 || dout && dx3 <= 10 && dy > obsY1 && dy < obsY2  ) {
    din = true;
    dout = false;
  } 
  if (tout && tx1 >= width-10 && ty2 > obsY3 && ty1 < obsY4 || tout && tx3 <= 10 && ty2 > obsY1 && ty3 < obsY2  ) {
    tin = true;
    tout = false;
  } 
  //Add points for each shape in
  if (sin && !sout) {
    point++;
    sin = false;
  }
  if (cin && !cout) {
    point = point + 2;
    cin = false;
  }
  if (din && !dout) {
    point = point + 3;
    din = false;
  }
  if (tin && !tout) {
    point = point + 4;
    tin = false;
  }

  addedPoints = point - savedPoints;
  passedTime = millis() - savedTime;
  if (addedPoints >= totalPoints || passedTime > totalTime) {
    obsY1 = int(random(50, height-gap-50));
    obsY2 = (obsY1+gap);
    obsY3 = int(random(50, height-gap-50));
    obsY4 = (obsY3+gap);  

    savedPoints = point;
    savedTime = millis();
    gap = gap - 25;

    if (gap <=100) {
      gap = 100;
    }
  }
    //Make faster with points
  addedSpeedPoints = point - savedSpeedPoints;
  if (addedSpeedPoints >= totalSpeedPoints) {   
    
    slow = int(slow + (slow * .2));
    fast = int(fast + (fast * .2));
    
    savedSpeedPoints = point;
  }
}
