// Dragon curve

nivel = 8;
ancho = 0.4;  
h=2;

module dragon(nivel) {
    
    if (nivel <= 0) {
        translate([0.5,0]) square ([1+ancho, ancho], center=true);
    } else {
        rotate(-45) scale(1/sqrt(2)) dragon(nivel-1);
        translate([1,0]) 
            rotate(-135) scale(1/sqrt(2)) dragon(nivel-1);
    }
}

//linear_extrude(h) 
scale(50) union() {
    dragon(nivel);
    //rotate(180) dragon(nivel);  
}



