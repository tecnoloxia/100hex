/* Función corazón
100hex https://tecnoloxia.org/100hex/
heart curve: http://mathworld.wolfram.com/HeartCurve.html
*/

// parámetros

hexagono=true;  // se queremos inserilo dentro dun hexágono
h=2;            // altura
hex=60;         // lado do hexágono

burato=true;    // true: burato, false: liña

espesor=2;    // ancho da liña
w= burato ? 0.4 : espesor;           // ancho da liña da función 

a=1;            // para escalar a función


// Función
//function x(t) = 16*pow(sin(t),3);
//function y(t) = 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);

function x(t) = 47*pow(sin(t),3);
function y(t) = 39*cos(t)-15*cos(2*t)-6*cos(3*t)-3*cos(4*t);

module heart() {
    for(i=[-180:1:180]) {
        hull(){
            translate([a*x(i),a*y(i),0]) circle(r=w/2,  $fn=20);
            translate([a*x(i+1),a*y(i+1),0])circle(r=w/2,  $fn=20);
            if(burato==true){
                circle(r=w/2,  $fn=20);
            }
        } 
    }
}


// Dentro dun hexágono

if(hexagono==true){  
    linear_extrude(h) union(){   
        if(burato==true){
            difference() {
                circle(r=hex,  $fn=6);
                scale(0.95) heart(); 
            }
        }
        else{
            intersection() {
                circle(r=hex,  $fn=6);
                heart();
            }
        }            
      difference() {
          circle(r=hex,  $fn=6);
          circle(r=(hex-espesor/cos(30)),  $fn=6);
      }     
   }  
}
else{
    heart();
}


