/* Espiral de Arquímedes
100hex https://tecnoloxia.org/100hex/
*/

// Parámetros espiral

n = 3;          // nº de espirais
a = 0.06;       // amplitude espiral
pasos = 5;      // resolución
voltas= 8;     // número de voltas
ancho = 2;    // ancho da liña
res=20;         // resolución

// Parámetros hexágono

hexagono=true;  // se queremos inserilo dentro dun hexágono
h=2;        // altura
hex=60;     // lado do hexágono
bordo=2;    // ancho do bordo

// Espiral

module espiral(){
    
    for(i=[0:360/n:360]){
        rotate([0,0,i]) for(p=[0:pasos:360*voltas]) {
            hull(){
                translate([a*p*cos(p),a*p*sin(p),0]) circle(r=ancho/2, $fn=res);
                translate([a*(p+pasos)*cos(p+pasos),a*(p+pasos)*sin(p+pasos),0]) circle(r=ancho/2, $fn=res);
            }
        }
    }
}

// Dentro dun hexágono

if(hexagono==true){
    linear_extrude(h) union(){
      intersection() {
         circle(r=hex, $fn=6);
         espiral();
      }
      difference() {
          circle(r=hex, $fn=6);
          circle(r=(hex-bordo), $fn=6);
      }
    }
}
else{
     espiral();
}