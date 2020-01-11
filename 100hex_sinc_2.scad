hex=60;
h=2;
ancho_lina=2;       
radio_circulo=ancho_lina/2;
ancho_bordo=ancho_lina;     // border


mode=0;         // 0=difference, 1=intersection
dobre=0;        // 0=simple, 1=dobre

pi=3.1416;

linear_extrude(h) union(){
    
    difference(){
        circle (r=hex, $fn=6);
        circle (r=hex-ancho_bordo, $fn=6);
    }
    
    if (mode==0){
        difference() { 
            circle (r=hex, $fn=6);
            union() {
                funcion();
                if (dobre==1){
                    mirror([0,1,0]) funcion(); 
                }
            }
        }
    } else {
        intersection() { 
            circle (r=hex, $fn=6);
            union() {
                funcion();
                if (dobre==1){
                    mirror([0,1,0]) funcion(); 
                }
                translate([-hex+ancho_bordo,-0.6])  square([(hex-ancho_bordo)*2,1.2]);  
            }
        }
    }
}        

module funcion(){   
    
    for(i=[-18:18]){
        y = 2800*sin(17*pi*i/2)/(17*pi*i/2);
        
        if (i==0) {
           translate([-ancho_lina/2,0]) square([ancho_lina,hex*cos(30)]); 
        } else {       
            translate([pi*i,y]) circle(r=radio_circulo,$fn=100);
            if (y>0) {
                translate([pi*i-ancho_lina/2,0]) square([ancho_lina,y]);
            } else {
                translate([pi*i-ancho_lina/2,y]) square([ancho_lina,-y]);
            }
        }
    }  
    
}

    
