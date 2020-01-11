
/* "La pajarita" alhambra
100hex https://tecnoloxia.org/100hex/
*/

r=5;    // radio tesela
res=60; // resolucion
nx= 10;  // número de columnas
ny= 10;   // número de filas


module tesela(r) {
    difference() {
        union() {
            circle(r/2);
            for (i=[0:2]) {
                rotate(i*120) translate([0,r]) circle(r, $fn=res);
            }
        }
        for (i=[0:2]) {
            rotate(i*120) translate([r*sqrt(3),0]) circle(r, $fn=res);
        }
    }
}


// teselación

for (x=[0:nx-1]) {
    for (y=[0:ny-1]) {
        translate([((y%2)?r*sqrt(3):0)+x*2*r*sqrt(3),y*3*r]) tesela(r);
    }
}
