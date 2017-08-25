// Flower of life
// 100Hex -- https://www.thingiverse.com/thing:2477471

radio = 30;         // radius
altura = 2;         // Higth
ancho = 1.6;         // thickess of lines 
res = 36;           // resolution 24 (low) -> 360 (hight)
item=3;

// Ring:

module anel() {
	difference() {
		cylinder(r = radio, h = altura, center = true, $fn = res);
		cylinder(r = radio-ancho, h = altura, center = true, $fn = res);
	}
}


// funcións:

function x(n) = (radio-ancho/2) * sin(n*60);
function y(n) = (radio-ancho/2) * cos(n*60);

// Iteración:

module floweroflife(item) {
    
    if (item>0) {
        for ( i = [1 : 6] ){
            translate([x(i),y(i),0]) anel();
            translate([x(i),y(i),0]) for (j = [1: 6]) {
                translate([x(j),y(j),0]) anel();
                floweroflife(item-1);
            }
        }
    }
	
}


// Draw

floweroflife(item);
