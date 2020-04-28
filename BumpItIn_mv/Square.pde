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

    //Sqaure area divided into triangles.
    Asarea = abs( (sx2-sx)*(sry-sy) - (srx-sx)*(sy2-sy) );
    Asarea1 = abs( (sx-mouseX)*(sy2-mouseY) - (sx2-mouseX)*(sy-mouseY) );
    Asarea2 = abs( (sx2-mouseX)*(sry-mouseY) - (srx-mouseX)*(sy2-mouseY) );
    Asarea3 = abs( (srx-mouseX)*(sy-mouseY) - (sx-mouseX)*(sry-mouseY) );

    Bsarea = abs( (sx2-srx)*(sy3-sry) - (sx3-srx)*(sy2-sry) );
    Bsarea1 = abs( (srx-mouseX)*(sy2-mouseY) - (sx2-mouseX)*(sry-mouseY) );
    Bsarea2 = abs( (sx2-mouseX)*(sy3-mouseY) - (sx3-mouseX)*(sy2-mouseY) );
    Bsarea3 = abs( (sx3-mouseX)*(sry-mouseY) - (srx-mouseX)*(sy3-mouseY) );

    Csarea = abs( (sx4-srx)*(sy3-sry) - (sx3-srx)*(sy4-sry) );
    Csarea1 = abs( (srx-mouseX)*(sy4-mouseY) - (sx4-mouseX)*(sry-mouseY) );
    Csarea2 = abs( (sx4-mouseX)*(sy3-mouseY) - (sx3-mouseX)*(sy4-mouseY) );
    Csarea3 = abs( (sx3-mouseX)*(sry-mouseY) - (srx-mouseX)*(sy3-mouseY) );  

    Dsarea = abs( (sx4-sx)*(sry-sy) - (srx-sx)*(sy4-sy) );
    Dsarea1 = abs( (sx-mouseX)*(sy4-mouseY) - (sx4-mouseX)*(sy-mouseY) );
    Dsarea2 = abs( (sx4-mouseX)*(sry-mouseY) - (srx-mouseX)*(sy4-mouseY) );
    Dsarea3 = abs( (srx-mouseX)*(sy-mouseY) - (sx-mouseX)*(sry-mouseY) );  

    //Mouse collision

    if (!sup && Csarea1 + Csarea2 + Csarea3 == Csarea ) {
      sup = true;
      sright = sleft = sdown = false;
    } else if (!sright && Dsarea1 + Dsarea2 + Dsarea3 == Dsarea ) {
      sright = true;
      sleft = sup = sdown = false;
    } else if (!sleft && Bsarea1 + Bsarea2 + Bsarea3 == Bsarea ) {
      sleft = true;
      sright = sup = sdown = false;
    } else if (!sdown && Asarea1 + Asarea2 + Asarea3 == Asarea ) {
      sdown = true;
      sright = sup = sleft = false;
    }




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
