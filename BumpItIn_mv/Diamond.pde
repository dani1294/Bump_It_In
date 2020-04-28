class Diamond {
  void display() {
    fill(255, 153, 0);
    noStroke();
    diamond = createShape(QUAD, dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4);
    shape(diamond);
  }

  void fall() {
    if (dy2 > height + dsize) {
      restart();
    }
    dy1 = dy1 + dspeed;
    dy2 = dy2 + dspeed;
    dy3 = dy3 + dspeed;
    dy4 = dy4 + dspeed;
    dy = dy + dspeed; // include dy and dx to make sure the area readings are correct, since they are calculated with dx and dy
  }

  void move() {
    // detect when the diamond is touched. Calculate area of the diamond and area of 2 vertices and mouseX/Y. If the last are equal to area then it's touched.
    //Diamond area divided into triangles.
    Adarea = abs( (dx2-dx1)*(dy-dy1) - (dx-dx1)*(dy2-dy1) );
    Adarea1 = abs( (dx1-mouseX)*(dy2-mouseY) - (dx2-mouseX)*(dy1-mouseY) );
    Adarea2 = abs( (dx2-mouseX)*(dy-mouseY) - (dx-mouseX)*(dy2-mouseY) );
    Adarea3 = abs( (dx-mouseX)*(dy1-mouseY) - (dx1-mouseX)*(dy-mouseY) );

    Bdarea = abs( (dx2-dx)*(dy3-dy) - (dx3-dx)*(dy2-dy) );
    Bdarea1 = abs( (dx-mouseX)*(dy2-mouseY) - (dx2-mouseX)*(dy-mouseY) );
    Bdarea2 = abs( (dx2-mouseX)*(dy3-mouseY) - (dx3-mouseX)*(dy2-mouseY) );
    Bdarea3 = abs( (dx3-mouseX)*(dy-mouseY) - (dx-mouseX)*(dy3-mouseY) );

    Cdarea = abs( (dx4-dx)*(dy3-dy) - (dx3-dx)*(dy4-dy) );
    Cdarea1 = abs( (dx-mouseX)*(dy4-mouseY) - (dx4-mouseX)*(dy-mouseY) );
    Cdarea2 = abs( (dx4-mouseX)*(dy3-mouseY) - (dx3-mouseX)*(dy4-mouseY) );
    Cdarea3 = abs( (dx3-mouseX)*(dy-mouseY) - (dx-mouseX)*(dy3-mouseY) );  

    Ddarea = abs( (dx4-dx1)*(dy-dy1) - (dx-dx1)*(dy4-dy1) );
    Ddarea1 = abs( (dx1-mouseX)*(dy4-mouseY) - (dx4-mouseX)*(dy1-mouseY) );
    Ddarea2 = abs( (dx4-mouseX)*(dy-mouseY) - (dx-mouseX)*(dy4-mouseY) );
    Ddarea3 = abs( (dx-mouseX)*(dy1-mouseY) - (dx1-mouseX)*(dy-mouseY) );  

    if (!dnw && Cdarea1 + Cdarea2 + Cdarea3 == Cdarea ) {
      dnw = true;
      dne = dsw = dse = false;
    } else if (!dne && Ddarea1 + Ddarea2 + Ddarea3 == Ddarea ) {
      dne = true;
      dnw = dsw = dse = false;
    } else if (!dsw && Bdarea1 + Bdarea2 + Bdarea3 == Bdarea ) {
      dsw = true;
      dne = dnw = dse = false;
    } else if (!dse && Adarea1 + Adarea2 + Adarea3 == Adarea ) {
      dse = true;
      dne = dsw = dnw = false;
    }

    if (dse) {
      dx1 = dx1 + dspeed;
      dx2 = dx2 + dspeed;
      dx3 = dx3 + dspeed;
      dx4 = dx4 + dspeed;  
      dx = dx + dspeed;
      dy1 = dy1 + dspeed;
      dy2 = dy2 + dspeed;
      dy3 = dy3 + dspeed;
      dy4 = dy4 + dspeed;
      dy = dy + dspeed;
    } else if (dsw) {
      dx1 = dx1 - dspeed;
      dx2 = dx2 - dspeed;
      dx3 = dx3 - dspeed;
      dx4 = dx4 - dspeed; 
      dx = dx - dspeed;
      dy1 = dy1 + dspeed;
      dy2 = dy2 + dspeed;
      dy3 = dy3 + dspeed;
      dy4 = dy4 + dspeed;
      dy = dy + dspeed;
    } else if (dne) {
      dx1 = dx1 + dspeed;
      dx2 = dx2 + dspeed;
      dx3 = dx3 + dspeed;
      dx4 = dx4 + dspeed;
      dx = dx + dspeed;
      dy1 = dy1 -(dspeed*2);
      dy2 = dy2 -(dspeed*2);
      dy3 = dy3 -(dspeed*2);
      dy4 = dy4 -(dspeed*2);
      dy = dy - (dspeed*2);
    } else if (dnw) {
      dx1 = dx1 - dspeed;
      dx2 = dx2 - dspeed;
      dx3 = dx3 - dspeed;
      dx4 = dx4 - dspeed;   
      dx = dx - dspeed;
      dy1 = dy1 -(dspeed*2);
      dy2 = dy2 -(dspeed*2);
      dy3 = dy3 -(dspeed*2);
      dy4 = dy4 -(dspeed*2);
      dy = dy - (dspeed*2);
    }


    if (dx3 < -dsize || dx1 > width + dsize || dy2 > height || dnw && dy4 < -dsize && dx3 < -dsize || dne && dy4 < -dsize && dx1 > width + dsize || dnw && dy4 < -dsize || dnw && dy4 < -dsize) {
      restart();
    }
  }

  void restart() {
    dsize = int(random(80, 130));  
    dy = int(random(-200, -100));
    dx = int(random(50, width - dsize));
    dr = dsize/2;
    dx1 = dx - dr; 
    dy1 = dy;
    dx2 = dx;
    dy2 = dy - dr;
    dx3 = dx + dr;
    dy3 = dy;
    dx4 = dx;
    dy4 = dy + dr;
    dspeed = int(random(slow, fast));
    dnw = dne = dsw = dse = false;

    din = false;
    dout = true;
  }
}
