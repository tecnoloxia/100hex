/* 
Patrón flower of life - shape pattern
100Hex -- https://www.thingiverse.com/thing:2477471
*/

// parámetros patrón 


radio=30;       // tamaño de cada unidade -- unit size
grosor=2;       // Ancho das liñas -- thickess of lines
altura=2;       // Higth
xiro=0;         // Rotation
item=3;
fn=10;           // circle:72(flower of life), hexagon:6, square:4, etc



module hex(rad, g) {     // hexágono do grosor definido -- Hexagon of defined thickness
    
        rotate([0,0,xiro]) difference() {
            circle(r=rad+g/2, $fn=fn);
            circle(r=rad-g/2, $fn=fn);
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

linear_extrude (altura) hexFlower(radio, grosor, item);