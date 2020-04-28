class Circle {

  void display() {
    fill(185, 224, 9);
    noStroke();
    circle = createShape(ELLIPSE, cx, cy, csize, csize);
    shape(circle); // This makes the shape actually display. Based on the PShape variable name.
  }

  void fall() {
    cy = cy +cspeed;
    cy0 = cy0 +cspeed;
    cry = cry +cspeed;

    if (cy0 > height) {
      restart();
    }
  }

  void move() {
    //Circle moves in diagonals
    if (!cse && mouseX > cx0 && mouseX < cx && mouseY > cy0 && mouseY < cy) {
      cse = true;   
      csw = cne = cnw = false;
    } else if (!csw && mouseX > cx && mouseX < crx && mouseY > cy0 && mouseY < cy) {
      csw = true;
      cse = cne = cnw = false;
    } else if (!cne && mouseX > cx0 && mouseX < cx && mouseY > cy && mouseY < cry) {
      cne = true;
      cse = csw = cnw = false;
    } else if (!cnw && mouseX > cx && mouseX < crx && mouseY > cy && mouseY < cry) {
      cnw = true;
      cse = csw = cne = false;
    }

    if (cse == true) {  
      cx = cx+cspeed;
      cx0 = cx0+cspeed;
      crx = crx+cspeed;
      cy = cy+(cspeed/2);
      cy0 = cy0+(cspeed/2);
      cry = cry+(cspeed/2);
    } else if (csw == true) {
      cx = cx-cspeed;
      cx0 = cx0-cspeed;
      crx = crx-cspeed;
      cy = cy+(cspeed/2); 
      cy0 = cy0+(cspeed/2);  
      cry = cry+(cspeed/2);
    } else if (cne == true) {
      cx = cx+cspeed;
      cx0 = cx0+cspeed;
      crx = crx+cspeed;
      cy = int(cy-(cspeed*1.5));  
      cy0 = int(cy0-(cspeed*1.5));    
      cry = int(cry-(cspeed*1.5));
    } else if (cnw == true) {
      cx = cx-cspeed;
      cx0 = cx0-cspeed;
      crx = crx-cspeed;
      cy = int(cy-(cspeed*1.5));
      cy0 = int(cy0-(cspeed*1.5));
      cry = int(cry-(cspeed*1.5));
    }

    if ( cse == true || csw == true || cne == true || cnw == true) {
      if (cy0 > height || cx0 > width + cr || crx <= -csize || cry < -(csize*2)) {
        restart();
      }
    }
  }

  void restart() {
    csize = int(random(70, 100));
    cx = int(random(40 + csize, 2736 - 40 - csize));
    cy = int(random(-200, -100));
    cr = csize/2;
    cx0 = cx - cr;
    cy0 = cy - cr;
    crx = cx + cr;
    cry = cy + cr;
    cspeed = int(random(slow, fast));
    cse = csw = cne = cnw = false;

    cin = false;
    cout = true;
  }
}
