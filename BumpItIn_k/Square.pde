class Square {

  void display() {
    fill(0, 204, 204);
    noStroke();
    square = createShape(RECT, sx, sy, ssize, ssize);
    shape(square); // This makes the shape actually display. Based on the PShape variable name.
  }

  void fall() {

    sy = sy+sspeed;  
    sry = sry + sspeed; // // include sry and srx to make sure the area readings are correct, since they are calculated with srx and sry
    sy2 = sy2 + sspeed;
    sy3 = sy3 + sspeed;
    sy4 = sy4 + sspeed;
    if (sy > height + ssize) {
      restart();
    }
  }

  void move() {

    if (sright == true) {
      sx = sx+sspeed;
      srx = srx+sspeed;
      sx2 = sx2+sspeed;
      sx3 = sx3+sspeed;
      sx4 = sx4+sspeed;
      sy = sy-sspeed;// sort of works to keep it horizontal
      sry = sry-sspeed;
      sy2 = sy2-sspeed;
      sy3 = sy3-sspeed;
      sy4 = sy4-sspeed;
    } else if (sleft == true) {
      sx = sx-sspeed;
      srx = srx-sspeed;
      sx2 = sx2-sspeed;
      sx3 = sx3-sspeed;
      sx4 = sx4-sspeed;
      sy = sy-sspeed;
      sry = sry-sspeed;
      sy2 = sy2-sspeed;
      sy3 = sy3-sspeed;
      sy4 = sy4-sspeed;
    } else if (sup == true) {
      sy = sy-(sspeed*2);
      sry = sry-(sspeed*2);
      sy2 = sy2-(sspeed*2);
      sy3 = sy3-(sspeed*2);
      sy4 = sy4-(sspeed*2);
    } else if (sdown == true) {
      sy = sy+sspeed;
      sry = sry+sspeed;
      sy2 = sy2+sspeed;
      sy3 = sy3+sspeed;
      sy4 = sy4+sspeed;
    }


    if (sup && sy4 < 0 && sy3 < 0 || sy > height && sy2 > height || sx2 < -ssize && sx3 < -ssize || sx > width + ssize && sx4 > width + ssize) {
      restart();
    }
  }

  void restart() {
    ssize = int (random(50, 100));
    sy = int(random(-200, -100));
    sx = int(random(50, width - ssize));
    sspeed = int(random(slow, fast));
    sright = sleft = sup = sdown = false;
    srx = sx + (ssize/2) ;
    sry = sy + (ssize/2) ;
    sx2 = sx + ssize;
    sy2 = sy;
    sx3 = sx + ssize;
    sy3 = sy + ssize;
    sx4 = sx;
    sy4 = sy + ssize;

    sin = false;
    sout = true;
  }
}
