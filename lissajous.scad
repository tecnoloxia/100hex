/* Función lissajous
100hex https://tecnoloxia.org/100hex/
*/

// parámetros

hexagono=true;
h=2;        // altura
hex=60;     // lado do hexágono
ancho=1.6;  // ancho da liña
bordo=1.6;  // ancho do bordo do hexágono
res=60;    //resolución

// Función

pi = 3.14159265359;
e=0.4;

module lissajous() {
  for (i = [0: abs(e) : 360-e]) {
      hull() {
          translate([24*sin(7*pi*i),24*cos(5*pi*i),0]) circle(r=ancho/4, $fn=res);
          translate([24*sin(7*pi*(i+e)),24*cos(5*pi*(i+e)),0]) circle(r=ancho/4, $fn=res);
      } 
   } 
}

// Dentro dun hexágono
if(hexagono==true){
    linear_extrude(h) union(){
      intersection() {
         circle(r=hex,  $fn=6);
         scale(2.4) lissajous();
      }
      difference() {
          circle(r=hex,  $fn=6);
          circle(r=(hex-bordo/cos(30)),  $fn=6);
      }
    }
}
else{
    lissajous();
}