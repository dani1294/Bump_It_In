void Collision() {
  //Shape Collisions  

  //SQUARE and TRIANGLE  
  //Top of square and bottom of triangle
  if (sy == ty1) {
    if (sx >= tx1 && sx <=tx3 ||sx3 >= tx1 && sx <=tx3 || tx1 >= sx4 && tx1 <=sx3 || tx3 >= sx4 && tx3 <=sx3) {
      sdown = true;
      sright = sup = sleft = false;
      ts = true;
      tnw = tne = false;
    }
  }

  //Bottom of square and top of triangle  
  if (ty2 > sry && ty2 <= sy4 && tx2 > sx4 && tx2 < sx3) {
    sup = true;
    sright = sleft = sdown = false;

    if (tx2 < srx) {
      tne = true;
      tnw = ts = false;
    } else {
      tnw = true;
      tne = ts = false;
    }
  }

  // Right of square and left of triangle
  if (tx1 <= sx2 && tx1 > srx && ty1 > sy2 && ty1 < sy3) {
    sleft = true;
    sright = sup = sdown = false;
    tnw = true;
    tne = ts = false;
  }
  //Left of square and right of triangle  
  if (tx3 >= sx && tx3 < srx && ty3 > sy && ty3 < sy4) {
    sright = true;
    sleft = sup = sdown = false;
    tne = true;
    tnw = ts = false;
  } 
  //Sx4 and TB
  sx4tb1 = abs( (tx-sx4)*(ty2-sy4) - (tx2-sx4)*(ty-sy4) );
  sx4tb2 = abs( (tx2-sx4)*(ty3-sy4) - (tx3-sx4)*(ty2-sy4) );
  sx4tb3 = abs( (tx3-sx4)*(ty-sy4) - (tx-sx4)*(ty3-sy4) );

  if (sx4tb1 + sx4tb2 + sx4tb3 == Btarea) {
    tne = true;
    tnw = ts = false;
    if (sy4 < ty) {
      sup = true;
      sright = sleft = sdown = false;
    } else {
      sright = true;
      sup = sleft = sdown = false;
    }
  }
  //Sx3 and TA
  sx3ta1 = abs( (tx-sx3)*(ty2-sy3) - (tx2-sx3)*(ty-sy3) );
  sx3ta2 = abs( (tx2-sx3)*(ty1-sy3) - (tx1-sx3)*(ty2-sy3) );
  sx3ta3 = abs( (tx1-sx3)*(ty-sy3) - (tx-sx3)*(ty1-sy3) );

  if (sx3ta1 + sx3ta2 + sx3ta3 == Atarea) {
    tnw = true;
    tne = ts = false;
    if (sy3 < ty) {
      sup = true;
      sright = sleft = sdown = false;
    } else {
      sleft = true;
      sup = sright = sdown = false;
    }
  }
  //SQUARE and DIAMOND  
  //Top of square and bottom of Diamond  
  if (dy4 >= sy && dy4 < sry && dx4 > sx && dx4 < sx2) {
    sdown = true;
    sup = sright = sleft = false;

    if (dx4 < srx) {
      dnw = true;
      dne = dsw = dse = false;
    } else {
      dne = true;
      dnw = dse = dsw = false;
    }
  }
  //bottom of square and top of Diamond  
  if (dy2 <= sy4 && dy2 > sry && dx2 > sx4 && dx2 < sx3) {
    sup = true;
    sdown = sright = sleft = false;

    if (dx2 < srx) {
      dsw = true;
      dne = dnw = dse = false;
    } else {
      dse = true;
      dnw = dne = dsw = false;
    }
  }   
  //right of square and left of Diamond  
  if (dx1 <= sx2 && dx1 > srx && dy1 > sy2 && dy1 < sy3) {
    sleft = true;
    sup = sright = sdown = false;

    if (dy1 > sry) {
      dse = true;
      dnw = dsw = dne = false;
    } else {
      dne = true;
      dnw = dse = dsw = false;
    }
  }  

  //left of square and right of Diamond  
  if (dx3 >= sx && dx3 < srx && dy3 > sy && dy3 < sy4) {
    sright = true;
    sup = sleft = sdown = false;

    if (dy3 > sry) {
      dsw = true;
      dnw = dse = dne = false;
    } else {
      dnw = true;
      dne = dse = dsw = false;
    }
  } 
  //Sx3 and DA
  sx3da1 = abs( (dx-sx3)*(dy2-sy3) - (dx2-sx3)*(dy-sy3) );
  sx3da2 = abs( (dx2-sx3)*(dy1-sy3) - (dx1-sx3)*(dy2-sy3) );
  sx3da3 = abs( (dx1-sx3)*(dy-sy3) - (dx-sx3)*(dy1-sy3) );

  if (sx3da1 + sx3da2 + sx3da3 == Adarea) {
    dse = true;
    dne = dnw = dsw = false;
    if (sy3 < dy1 + (dr/2)) {
      sup = true;
      sright = sleft = sdown = false;
    } else {
      sleft = true;
      sup = sright = sdown = false;
    }
  }  
  //Sx4 and DB
  sx4db1 = abs( (dx-sx4)*(dy2-sy4) - (dx2-sx4)*(dy-sy4) );
  sx4db2 = abs( (dx2-sx4)*(dy3-sy4) - (dx3-sx4)*(dy2-sy4) );
  sx4db3 = abs( (dx3-sx4)*(dy-sy4) - (dx-sx4)*(dy3-sy4) );

  if (sx4db1 + sx4db2 + sx4db3 == Bdarea) {
    dne = true;
    dse = dnw = dsw = false;

    if (sy4 < dy3 - (dr/2)) {
      sup = true;
      sright = sleft = sdown = false;
    } else {
      sright = true;
      sup = sleft = sdown = false;
    }
  }   
  //Sx and DC
  sxdc1 = abs( (dx-sx)*(dy4-sy) - (dx4-sx)*(dy-sy) );
  sxdc2 = abs( (dx4-sx)*(dy3-sy) - (dx3-sx)*(dy4-sy) );
  sxdc3 = abs( (dx3-sx)*(dy-sy) - (dx-sx)*(dy3-sy) );

  if (sxdc1 + sxdc2 + sxdc3 == Cdarea) {
    dnw = true;
    dse = dne = dsw = false;
    if (sy < dy3 - (dr/2)) {
      sdown = true;
      sright = sleft = sup = false;
    } else {
      sright = true;
      sup = sleft = sdown = false;
    }
  } 
  //Sx2 and DD
  sx2dd1 = abs( (dx-sx2)*(dy4-sy2) - (dx4-sx2)*(dy-sy2) );
  sx2dd2 = abs( (dx4-sx2)*(dy1-sy2) - (dx1-sx2)*(dy4-sy2) );
  sx2dd3 = abs( (dx1-sx2)*(dy-sy2) - (dx-sx2)*(dy1-sy2) );

  if (sx2dd1 + sx2dd2 + sx2dd3 == Ddarea) {
    dne = true;
    dse = dnw = dsw = false;
    if (sy2 < dy1 + (dr/2)) {
      sdown = true;
      sright = sleft = sup = false;
    } else {
      sleft = true;
      sup = sright = sdown = false;
    }
  }  
  //SQUARE and CIRCLE
  //sx and cse
  if (sx > cx && sx < crx && sy > cy && sy < cry) {
    cnw = true;
    cse = csw = cne = false;

    if (sy < cy + (cr/2)) {
      sright = true;
      sup = sleft = sdown = false;
    } else {
      sdown = true;
      sright = sleft = sup = false;
    }
  }
  //sx2 and csw
  if (sx2 > cx0 && sx2 < cx && sy2 > cy && sy2 < cry) {
    cne = true;
    cse = csw = cnw = false;

    if (sy2 < cy + (cr/2)) {
      sleft = true;
      sup = sright = sdown = false;
    } else {
      sdown = true;
      sright = sleft = sup = false;
    }
  }
  //sx3 and cnw
  if (sx3 > cx0 && sx3 < cx && sy3 > cy0 && sy3 < cy) {
    cse = true;   
    csw = cne = cnw = false; 

    if (sy3 > cy0 + (cr/2)) {
      sleft = true;
      sup = sright = sdown = false;
    } else {
      sup = true;
      sright = sleft = sdown = false;
    }
  }

  //sx4 and cne    
  if (sx4 > cx && sx4 < crx && sy4 > cy0 && sy4 < cy) {
    csw = true;
    cse = cne = cnw = false;

    if (sy4 > cy0 + (cr/2)) {
      sright = true;
      sup = sleft = sdown = false;
    } else {
      sup = true;
      sright = sleft = sdown = false;
    }
  }
  //Square top and circle bottom
  if (cry >= sy && cry < sry && cx > sx && cx < sx2) {
    sdown = true;
    sright = sleft = sup = false;

    if (cx < srx) {
      cnw = true;
      cse = csw = cne = false;
    } else {
      cne = true;
      cse = csw = cnw = false;
    }
  }
  //Square bottom and circle top
  if (cy0 <= sy4 && cy0 > sry && cx > sx4 && cx < sx3) {
    sup = true;
    sright = sleft = sdown = false;

    if (cx < srx) {
      csw = true;
      cse = cnw = cne = false;
    } else {
      cse = true;
      cne = csw = cnw = false;
    }
  }
  //Square left and circle right
  if (crx >= sx && crx < srx && cy > sy && cy < sy4) {
    sright = true;
    sup = sleft = sdown = false;

    if (cy < sry) {
      csw = true;
      cse = cnw = cne = false;
    } else {
      cnw = true;
      cne = cse = csw = false;
    }
  }
  //Square right and circle left
  if (cx0 <= sx2 && cx0 > srx && cy > sy2 && cy < sy3) {
    sleft = true;
    sup = sright = sdown = false;

    if (cy < sry) {
      cse = true;
      cnw = csw = cne = false;
    } else {
      cne = true;
      csw = cse = cnw = false;
    }
  }

  //TRIANGLE and DIAMOND
  //triangle bottom and diamond top
  if (dy2 <= ty1 && dy2 > ty && dx2 > tx1 && dx2 < tx3) {
    ts = true;
    tnw = tne = false;

    if (dx2 < tx) {
      dsw = true;
      dse = dnw = dne = false;
    } else {
      dse = true;
      dne = dsw = dnw = false;
    }
  }
  //tx3 and DA
  tx3da1 = abs( (dx-tx3)*(dy2-ty3) - (dx2-tx3)*(dy-ty3) );
  tx3da2 = abs( (dx2-tx3)*(dy1-ty3) - (dx1-tx3)*(dy2-ty3) );
  tx3da3 = abs( (dx1-tx3)*(dy-ty3) - (dx-tx3)*(dy1-ty3) );

  if (tx3da1 + tx3da2 + tx3da3 == Adarea) {
    dse = true;
    dne = dnw = dsw = false;
    ts = true;
    tnw = tne = false;
  }  
  //tx1 and DB
  tx1db1 = abs( (dx-tx1)*(dy2-ty1) - (dx2-tx1)*(dy-ty1) );
  tx1db2 = abs( (dx2-tx1)*(dy3-ty1) - (dx3-tx1)*(dy2-ty1) );
  tx1db3 = abs( (dx3-tx1)*(dy-ty1) - (dx-tx1)*(dy3-ty1) );

  if (tx1db1 + tx1db2 + tx1db3 == Bdarea) {
    dne = true;
    dse = dnw = dsw = false;
    ts = true;
    tnw = tne = false;
  } 
  //tx2 and DC  
  tx2dc1 = abs( (dx-tx2)*(dy4-ty2) - (dx4-tx2)*(dy-ty2) );
  tx2dc2 = abs( (dx4-tx2)*(dy3-ty2) - (dx3-tx2)*(dy4-ty2) );
  tx2dc3 = abs( (dx3-tx2)*(dy-ty2) - (dx-tx2)*(dy3-ty2) );

  if (tx2dc1 + tx2dc2 + tx2dc3 == Cdarea) {
    dnw = true;
    dse = dne = dsw = false;
    tnw = true;
    tne = ts = false;
  } 
  //tx2 and DD
  tx2dd1 = abs( (dx-tx2)*(dy4-ty2) - (dx4-tx2)*(dy-ty2) );
  tx2dd2 = abs( (dx4-tx2)*(dy1-ty2) - (dx1-tx2)*(dy4-ty2) );
  tx2dd3 = abs( (dx1-tx2)*(dy-ty2) - (dx-tx2)*(dy1-ty2) );

  if (tx2dd1 + tx2dd2 + tx2dd3 == Ddarea) {
    dne = true;
    dse = dnw = dsw = false;
    tne = true;
    tnw = ts = false;
  }  
  //TA and dx3
  dx3ta1 = abs( (tx-dx3)*(ty2-dy3) - (tx2-dx3)*(ty-dy3) );
  dx3ta2 = abs( (tx2-dx3)*(ty1-dy3) - (tx1-dx3)*(ty2-dy3) );
  dx3ta3 = abs( (tx1-dx3)*(ty-dy3) - (tx-dx3)*(ty1-dy3) );

  if (dx3ta1 + dx3ta2 + dx3ta3 == Atarea) {
    tnw = true;
    tne = ts = false;
    dnw = true;
    dne = dsw = dse = false;
  } 
  //TB and dx1  
  dx1tb1 = abs( (tx-dx1)*(ty2-dy1) - (tx2-dx1)*(ty-dy1) );
  dx1tb2 = abs( (tx2-dx1)*(ty3-dy1) - (tx3-dx1)*(ty2-dy1) );
  dx1tb3 = abs( (tx3-dx1)*(ty-dy1) - (tx-dx1)*(ty3-dy1) );

  if (dx1tb1 + dx1tb2 + dx1tb3 == Btarea) {
    tne = true;
    tnw = ts = false;
    dne = true;
    dnw = dsw = dse = false;
  }

  //TRIANGLE and CIRCLE
  //triangle bottom and circle top
  if (cy0 <= ty1 && cy0 > ty && cx > tx1 && cx < tx3) {
    ts = true;
    tnw = tne = false;

    if (cx < tx) {
      csw = true;
      cse = cnw = cne = false;
    } else {
      cse = true;
      cne = csw = cnw = false;
    }
  }
  //tx2 and cse
  if (tx2 > cx && tx2 < crx && ty2 > cy && ty2 < cry) {
    cnw = true;
    cse = csw = cne = false;
    tnw = true;
    tne = ts = false;
  }
  //tx2 and csw
  if (tx2 > cx0 && tx2 < cx && ty2 > cy && ty2 < cry) {
    cne = true;
    cse = csw = cnw = false;
    tnw = true;
    tne = ts = false;
  }   
  //tx1 and cne 
  if (tx1 > cx && tx1 < crx && ty1 > cy0 && ty1 < cy) {
    csw = true;
    cse = cne = cnw = false;
    ts = true;
    tnw = tne = false;
  }
  //tx1 and cse 
  if (tx1 > cx && tx1 < crx && ty1 > cy && ty1 < cry) {
    csw = true;
    cse = cne = cnw = false;
    tnw = true;
    tne = ts = false;
  }          
  //tx3 and cnw  
  if (tx3 > cx0 && tx3 < cx && ty3 > cy0 && ty3 < cy) {
    cse = true;   
    csw = cne = cnw = false; 
    ts = true;
    tnw = tne = false;
  }

  //tx3 and csw
  if (tx3 > cx0 && tx3 < cx && ty3 > cy && ty3 < cry) {
    cne = true;
    cse = csw = cnw = false;
    tne = true;
    tnw = ts = false;
  }
  //TA and cse
  //TB and csw

  //DIAMOND and CIRCLE
  // dx1 and cne
  if (dx1 > cx && dx1 < crx && dy1 > cy0 && dy1 < cy) {
    csw = true;
    cse = cne = cnw = false;
    dne = true;
    dnw = dsw = dse = false;
  }     
  // dx4 and cne
  if (dx4 > cx && dx4 < crx && dy4 > cy0 && dy4 < cy) {
    csw = true;
    cse = cne = cnw = false;
    dne = true;
    dnw = dsw = dse = false;
  }   
  //dx1 and cse
  if (dx1 > cx && dx1 < crx && dy1 > cy && dy1 < cry) {
    cnw = true;
    cse = csw = cne = false;
    dse = true;
    dsw = dne = dnw = false;
  }
  //dx2 and cse
  if (dx2 > cx && dx2 < crx && dy2 > cy && dy2 < cry) {
    cnw = true;
    cse = csw = cne = false;
    dse = true;
    dsw = dne = dnw = false;
  }    
  //dx2 and csw
  if (dx2 > cx0 && dx2 < cx && dy2 > cy && dy2 < cry) {
    cne = true;
    cse = csw = cnw = false;
    dsw = true;
    dse = dne = dnw = false;
  }
  //dx3 and csw
  if (dx3 > cx0 && dx3 < cx && dy3 > cy && dy3 < cry) {
    cne = true;
    cse = csw = cnw = false;
    dsw = true;
    dse = dne = dnw = false;
  }
  //dx3 and cnw
  if (dx3 > cx0 && dx3 < cx && dy3 > cy0 && dy3 < cy) {
    cse = true;   
    csw = cne = cnw = false; 
    dnw = true;
    dne = dse = dsw = false;
  }
  //dx4 and cnw
  if (dx4 > cx0 && dx4 < cx && dy4 > cy0 && dy4 < cy) {
    cse = true;   
    csw = cne = cnw = false; 
    dnw = true;
    dne = dse = dsw = false;
  }
  //DA and cse
  //DB and csw
  //DC and cnw
  //DD and cne
}
