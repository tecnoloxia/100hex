/* 
Patrón de hexágonos -- Hexagon pattern
100Hex -- https://www.thingiverse.com/thing:2477471
*/

// parámetros patrón 


radio=30;       // tamaño de cada unidade -- unit size
grosor=1.6;       // Ancho das liñas -- thickess of lines
altura=2;       // Higth
xiro=0;         // Rotation
item=3;



module hex(rad, g) {     // hexágono do grosor definido -- Hexagon of defined thickness
    
        rotate([0,0,xiro]) difference() {
            cylinder(r=rad+g/2, h=altura, center=true, $fn=6);
            cylinder(r=rad-g/2, h=altura, center=true, $fn=6);
        }
}

module hexFlower (rad, g, item){
    
    function x(n) = (rad) * sin(n*60);
    function y(n) = (rad) * cos(n*60);
    
    if (item>0) {
        for ( i = [1 : 6] ){
            translate([x(i),y(i),0]) hex(rad, g);
            translate([x(i),y(i),0]) for (j = [1: 6]) {
                translate([x(j),y(j),0]) hex(rad, g);
                hexFlower (rad, g, item-1);
            }
        }
    }
    
}



// Xerar o patrón -- Generate the pattern

hexFlower(radio, grosor, item);


