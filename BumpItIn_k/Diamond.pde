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
