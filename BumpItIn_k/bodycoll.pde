void bodyColl() {
  //Start body detection 
  for (int x = 0; x < width; x++) {
    for ( int y = 0; y < height; y++) {  
      color c = get(x, y);
      // if c is body color, collision
      if (c == body) {   

        //Sqaure area divided into triangles.
        Asarea = abs( (sx2-sx)*(sry-sy) - (srx-sx)*(sy2-sy) );
        Asarea1 = abs( (sx-x)*(sy2-y) - (sx2-x)*(sy-y) );
        Asarea2 = abs( (sx2-x)*(sry-y) - (srx-x)*(sy2-y) );
        Asarea3 = abs( (srx-x)*(sy-y) - (sx-x)*(sry-y) );

        Bsarea = abs( (sx2-srx)*(sy3-sry) - (sx3-srx)*(sy2-sry) );
        Bsarea1 = abs( (srx-x)*(sy2-y) - (sx2-x)*(sry-y) );
        Bsarea2 = abs( (sx2-x)*(sy3-y) - (sx3-x)*(sy2-y) );
        Bsarea3 = abs( (sx3-x)*(sry-y) - (srx-x)*(sy3-y) );

        Csarea = abs( (sx4-srx)*(sy3-sry) - (sx3-srx)*(sy4-sry) );
        Csarea1 = abs( (srx-x)*(sy4-y) - (sx4-x)*(sry-y) );
        Csarea2 = abs( (sx4-x)*(sy3-y) - (sx3-x)*(sy4-y) );
        Csarea3 = abs( (sx3-x)*(sry-y) - (srx-x)*(sy3-y) );  

        Dsarea = abs( (sx4-sx)*(sry-sy) - (srx-sx)*(sy4-sy) );
        Dsarea1 = abs( (sx-x)*(sy4-y) - (sx4-x)*(sy-y) );
        Dsarea2 = abs( (sx4-x)*(sry-y) - (srx-x)*(sy4-y) );
        Dsarea3 = abs( (srx-x)*(sy-y) - (sx-x)*(sry-y) );  

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

        //Circle moves in diagonals
        if (!cse && x > cx0 && x < cx && y > cy0 && y < cy) {
          cse = true;   
          csw = cne = cnw = false;
        } else if (!csw && x > cx && x < crx && y > cy0 && y < cy) {
          csw = true;
          cse = cne = cnw = false;
        } else if (!cne && x > cx0 && x < cx && y > cy && y < cry) {
          cne = true;
          cse = csw = cnw = false;
        } else if (!cnw && x > cx && x < crx && y > cy && y < cry) {
          cnw = true;
          cse = csw = cne = false;
        }

        // detect when the diamond is touched. Calculate area of the diamond and area of 2 vertices and x/Y. If the last are equal to area then it's touched.
        //Diamond area divided into triangles.
        Adarea = abs( (dx2-dx1)*(dy-dy1) - (dx-dx1)*(dy2-dy1) );
        Adarea1 = abs( (dx1-x)*(dy2-y) - (dx2-x)*(dy1-y) );
        Adarea2 = abs( (dx2-x)*(dy-y) - (dx-x)*(dy2-y) );
        Adarea3 = abs( (dx-x)*(dy1-y) - (dx1-x)*(dy-y) );

        Bdarea = abs( (dx2-dx)*(dy3-dy) - (dx3-dx)*(dy2-dy) );
        Bdarea1 = abs( (dx-x)*(dy2-y) - (dx2-x)*(dy-y) );
        Bdarea2 = abs( (dx2-x)*(dy3-y) - (dx3-x)*(dy2-y) );
        Bdarea3 = abs( (dx3-x)*(dy-y) - (dx-x)*(dy3-y) );

        Cdarea = abs( (dx4-dx)*(dy3-dy) - (dx3-dx)*(dy4-dy) );
        Cdarea1 = abs( (dx-x)*(dy4-y) - (dx4-x)*(dy-y) );
        Cdarea2 = abs( (dx4-x)*(dy3-y) - (dx3-x)*(dy4-y) );
        Cdarea3 = abs( (dx3-x)*(dy-y) - (dx-x)*(dy3-y) );  

        Ddarea = abs( (dx4-dx1)*(dy-dy1) - (dx-dx1)*(dy4-dy1) );
        Ddarea1 = abs( (dx1-x)*(dy4-y) - (dx4-x)*(dy1-y) );
        Ddarea2 = abs( (dx4-x)*(dy-y) - (dx-x)*(dy4-y) );
        Ddarea3 = abs( (dx-x)*(dy1-y) - (dx1-x)*(dy-y) );  

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


        //Triangle
        Atarea = abs( (tx2-tx1)*(ty-ty1) - (tx-tx1)*(ty2-ty1) );
        Atarea1 = abs( (tx1-x)*(ty2-y) - (tx2-x)*(ty1-y) );
        Atarea2 = abs( (tx2-x)*(ty-y) - (tx-x)*(ty2-y) );
        Atarea3 = abs( (tx-x)*(ty1-y) - (tx1-x)*(ty-y) );

        Btarea = abs( (tx2-tx)*(ty3-ty) - (tx3-tx)*(ty2-ty) );
        Btarea1 = abs( (tx-x)*(ty2-y) - (tx2-x)*(ty-y) );
        Btarea2 = abs( (tx2-x)*(ty3-y) - (tx3-x)*(ty2-y) );
        Btarea3 = abs( (tx3-x)*(ty-y) - (tx-x)*(ty3-y) ); 

        Ctarea = abs( (tx-tx1)*(ty3-ty1) - (tx3-tx1)*(ty-ty1) );
        Ctarea1 = abs( (tx1-x)*(ty-y) - (tx-x)*(ty1-y) );
        Ctarea2 = abs( (tx-x)*(ty3-y) - (tx3-x)*(ty-y) );
        Ctarea3 = abs( (tx3-x)*(ty1-y) - (tx1-x)*(ty3-y) );

        //Triangle A/B/C area touched
        if (!tnw && Atarea1 + Atarea2 + Atarea3 == Atarea) {
          tnw = true;
          tne = ts = false;
        } else if (!tne && Btarea1 + Btarea2 + Btarea3 == Btarea) {
          tne = true;
          tnw = ts = false;
        } else if (!ts && Ctarea1 + Ctarea2 + Ctarea3 == Ctarea) {
          ts = true;
          tnw = tne = false;
        }
      } //Put all shape collission var before this
    }
  }
}
