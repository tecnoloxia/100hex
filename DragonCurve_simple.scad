// Dragon curve

nivel = 10;
ancho = 2;  
l=6;
h=2;

module dragon(nivel) {
    
    if (nivel <= 0) {
        translate([l/2,0]) square([l+ancho, ancho], center=true);
    } else {
        rotate(45) scale(1/sqrt(2)) dragon(nivel-1);
        translate([l,0]) rotate(135) scale(1/sqrt(2)) dragon (nivel-1);
    }
}
 
linear_extrude(h) scale(20) rotate(0) dragon(nivel);  


