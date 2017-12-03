// Dragon curve

nivel = 10;
ancho = 4;  
l=10;
altura=2;
rounded=true;       // true, false

hexagono=false;     // true, false
hex=60;

if (hexagono==true){
    union(){
        difference(){
            cylinder(r=60, h=altura, center=false, $fn=6);
            cylinder(r=(60-ancho/2), h=altura, center=false, $fn=6);
        } 
        intersection(){
            cylinder(r=60, h=altura, center=false, $fn=6);
            linear_extrude(altura) scale(12.5) rotate(0) translate([-l/2,-l/4,0]) dragon(nivel);  
        }
    }  
}
else {
    linear_extrude(altura) scale(12) rotate(0) translate([-l/2,-l/4,0]) dragon(nivel);   
}  


module dragon(nivel) {
    
    if (nivel <= 0) {
        translate([l/2,0]) 
            if (rounded==true){
                union(){
                    translate([-l/2,0]) circle(ancho/2, center = true, $fn = 36);
                    square ([l, ancho], center=true);
                    translate([l/2,0]) circle(ancho/2, center = true, $fn = 36);
               }
           }else{
                square([l+ancho, ancho], center=true);
           }
    } 
    else {
        rotate(45) scale(1/sqrt(2)) dragon(nivel-1);
        translate([l,0]) rotate(135) scale(1/sqrt(2)) dragon (nivel-1);
    }
}
 



