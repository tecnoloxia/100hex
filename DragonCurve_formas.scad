/* Dragon curve
100hex - https://tecnoloxia.org/100hex/
*/

nivel = 8;
l=20;            // lonxitude da liña
w =l/5;        // ancho/width
h=2;            // altura/height

forma=0;    
// 0: esquina cadrada, 1: esquina redondeada, 
// 2: cadrados, 3: círculos, 4: aros, 
// 5: cadrados nas liñas, 6: pinchos, 7: octógonos, 
// 8: lóbulos, 9: hexágonos, 10:arcos

e=0.4;  // xuntar: +0.4, separar: -0.4 (formas 3, 4, 5, ...)
res=72;


// xerador de curva de dragón

module dragon(nivel) {
    
    if (nivel <= 0) {
        translate([l/2,0]) linha();
    } else {
        rotate(-45) scale(1/sqrt(2)) dragon(nivel-1);
        translate([l,0]) 
            rotate(-135) scale(1/sqrt(2)) dragon(nivel-1);
    }
}


linear_extrude(h) scale(1) dragon(nivel);


// formas

module linha(){
    
    if (forma ==0){
        square ([l+w, w], center=true);
    }
    if (forma ==1){
        union(){
            translate([l/2,0]) circle(r=w/2,  $fn=36);
            translate([-l/2,0]) circle(r=w/2,  $fn=36);
            square ([l, w], center=true);
        }
    }
    if (forma ==2){
        translate([0,l/2]) circle(l/2+e,  $fn=4);
    }
    if (forma ==3){
        translate([0,l/2]) circle(r=l/2+e,  $fn=res);
    }
    if (forma ==4){
        difference(){
            translate([0,l/2]) circle(r=l/2+e,  $fn=res);
            translate([0,l/2]) circle(r=l/2+e-w,  $fn=res);
        }
    }
    if (forma ==5){    
        union(){
            translate([0,w]) square([w+l/8, w+l/8], center = true);
            square([l+w, w], center = true);
    }
        
    }
    if (forma ==6){
        union(){
            translate([0,w]) rotate(-30) circle(w, $fn=3);
            square([l+w, w], center = true);
        }
    }
     
    if (forma==7){
        forma7();  
    }
    
    if (forma ==8){
        translate([0,l/2*cos(45)]) forma7();
    }

    if (forma==9){
        union() {
            translate([0,(l/2)*cos(45)-w/8]) forma7();
            translate([0,(-l/2)*cos(45)+w/8]) mirror([0,180,0]) forma7();
        }
    }
    if (forma ==10){   
        w = l/8;
        translate([0,-l+w,0]) rotate(45) difference(){
            intersection(){square(l-w); circle(l-w, $fn = 72);}
            intersection(){square(l-w*2); circle(l-w*2, $fn = 72);}
        }
    }    
    
    
}    



    module forma7(){
        union(){
            hull(){
                translate([-l/2,-l/3]) circle(d=w, $fn = res);
                translate([-l/6,0]) circle(d=w,  $fn = res);
            }
            hull(){
                translate([-l/6,0]) circle(d=w,  $fn = res);
                translate([l/6, 0]) circle(d=w, $fn = res);
            }
            hull(){
                translate([l/6,0]) circle(d=w, $fn = res);
                translate([l/2,-l/3]) circle(d=w,  $fn = res);
            }
        }
    }