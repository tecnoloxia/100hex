// Hexágono con curvas de Lissajous
// 100hex https://www.thingiverse.com/thing:2477471
// By @tecnoloxia CC By SA


pi = 3.1416;
hex=60;      // radio do hexágono
marco=2;    //  ancho do marco


// xerador de curvas de Lissajous

module math() {
    
    for (i = [0 : abs(0.2) : 360 - 0.2]) {
        hull() {
            translate([(24 * sin(((7 * pi) * i))), (24 * cos(((5 * pi) * i))), 0]) cylinder(r=0.4, h=2, center=false);
            translate([(24 * sin(((7 * pi) * (i + 0.2)))), (24 * cos(((5 * pi) * (i + 0.2)))), 0]) cylinder(r=0.4, h=2, center=false);
        }
     }

}


// A curva de Lissajous dentro dun hexágono

union(){
    
    intersection() {
        cylinder(r=hex, h=2, center=false, $fn=6); 
        scale([2.4, 2.4, 1]) math();
    }
    
    difference() {
        cylinder(r=hex, h=2, center=false, $fn=6);
        cylinder(r=hex-marco, h=2, center=false, $fn=6);
    }
  
}