class Triangle {
  void display() {
    fill(102, 0, 153);
    noStroke();
    triangle = createShape(TRIANGLE, tx1, ty1, tx2, ty2, tx3, ty3);
    shape(triangle);
  }

  void fall() {
    if (ty2 > height + tsize) {
      restart();
    }
    ty1 = ty1 + tspeed; 
    ty2 = ty2 + tspeed; 
    ty3 = ty3 + tspeed; 
    ty = ty + tspeed; // include ty and tx to make sure the area readings are correct, since they are calculated with tx and ty
  }

  void move() {
    

    if (ts) {
      ty1 = ty1 - (tspeed*2);
      ty2 = ty2 - (tspeed*2);
      ty3 = ty3 - (tspeed*2);
      ty = ty - (tspeed*2);
    } else if (tnw) {
      tx1 = tx1 + tspeed;
      tx2 = tx2 + tspeed;
      tx3 = tx3 + tspeed;
      tx = tx + tspeed;
      ty1 = ty1 + (tspeed/2);
      ty2 = ty2 + (tspeed/2);
      ty3 = ty3 + (tspeed/2);
      ty = ty + (tspeed/2);
    } else if (tne) {
      tx1 = tx1 - tspeed;
      tx2 = tx2 - tspeed;
      tx3 = tx3 - tspeed;
      tx = tx - tspeed;
      ty1 = ty1 + (tspeed/2);
      ty2 = ty2 + (tspeed/2);
      ty3 = ty3 + (tspeed/2);
      ty = ty + (tspeed/2);
    }

    if (ty2 > height || tx1 > width || tx3 < 0 || ts && ty1 < 0 && ty3 < 0 || tnw && tx1 > width && ty2 > height || tne && tx3 < 0 && ty2 > height) {
      restart();
    }
  }

  void restart() {
    tsize = int(random(80, 120));
    ty = int(random(-200, -100));
    tx = int(random(50, width - tsize));
    tx1 = tx - tr; 
    ty1 = ty + tr;
    tx2 = tx;
    ty2 = ty - tr;
    tx3 = tx + tr;
    ty3 = ty + tr;
    tspeed = int(random(slow, fast));
    tnw = tne = ts = false;

    tin = false;
    tout = true;
  }
}
