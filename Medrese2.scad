/* Islamic Pattern - Ak Medrese
100hex https://tecnoloxia.org/100hex/
 */

// parámetros hexágono
altura=2;                   // Higth
marco=1.6;                   // ancho do bordo -- Frame width
hex=60 ;                    // radio do hexágono -- hexagon radio

// parámetros patrón 
radio=30;                  // tamaño de cada unidade -- unit size
grosor=1.6;                  // Ancho das liñas -- thickess of lines
matriz=[5,5];              // unidades en [x,y] -- units in [x,y]
escala=0.98;

// Non tocar
w=(grosor/cos(45))/escala;

// Estrela de 8 picos tamaño 2*radio -- 8 point star

module oct1() {         
    rotate (360/16) union() {
        square([2*radio/sqrt(2), 2*radio/sqrt(2)], center=true);
        rotate([0,0,45]) square([2*radio/sqrt(2), 2*radio/sqrt(2)], center=true);
    }
}

// Deixamos só o bordo
module oct2() {         
    difference() {
        scale([(radio+w/2)/radio, (radio+w/2)/radio, 1]) oct1();
        scale([(radio-w/2)/radio, (radio-w/2)/radio, 1]) oct1();
    } 
}

// enreixado --  grid
module medrese(){       
    translate([-matriz[0]*radio/2,-matriz[1]*radio/2,0]) {
        for (x=[0:matriz[0]]) {
            for (y=[0:matriz[1]]) {
                translate([x*radio, y*radio, 0]) oct2();
            }
        }
    }    
}


// medrese inserida nun hexágono
linear_extrude(altura) union(){
    difference (){
        circle(r=hex,  $fn=6);
        circle(r=(hex- marco/cos(30)),  $fn=6);   
    }
    intersection (){
        circle(r=hex,  $fn=6); 
        scale(escala) medrese();
    } 
}

