/* 
Adaptación do ficheiro "Golden spiral generator" https://www.thingiverse.com/thing:1759124 
para 100hex 
https://tecnoloxia.org/100hex/

Espiral de Fibonacci
https://en.wikipedia.org/wiki/Fermat%27s_spiral
f0=0
f1=1
fn=fn-1+fn-2

Espiral de padovan
https://es.wikipedia.org/wiki/Sucesi%C3%B3n_de_Padovan
P(0)=P(1)=P(2)=1
P(n)=P(n-2)+P(n-3)
*/

// Parámetros hexágono
hexagono=true;      // true/false
hex=60;             // lado do hexágono
bordo=2;            // ancho do bordo

// Parámteros espiral
tipo=1;         // 0:fibonacci, 1:padovan
escala=1;
espirais=1;     // nº de espirais
dobre=false;     // false/true - simpre ou dobre
xiro=0;         // ángulo de xiro o patrón xerado
n_inicio=1;     
n_final=15;
w = bordo/escala;   // ancho liña
h = 2;          // altura
res=36;         // resolución

// Función de fibonacci
function fibonacci(n) = 
    n == 0 || n == 1 ? n : ( fibonacci(n-1)+fibonacci(n-2) 
);
// Función de padovan
function padovan(n) = 
    n == 0 || n == 1 || n== 2 ? 1 : ( padovan(n-2)+padovan(n-3) 
);

// sectores para cada intervalo
module sector(radio, angulo, fn) {  
    r = radio/cos(180/fn);
    step = -360/fn;   
    points = concat(
        [[0, 0]], 
        [for(a = [angulo[0] : step : angulo[1]-360]) 
            [r*cos(a), r*sin(a)]
        ],
        [[r*cos(angulo[1]), r*sin(angulo[1])]]
    );
    difference() {
        circle(radio, $fn = fn);
        polygon(points);
    }
}

module arco(radio, angulo, ancho=w, fn=res) {
    difference() {
        sector(radio+ancho, angulo, fn);
        sector(radio, angulo, fn);
    }
} 

// xeración das espirais

module Fibonacci_espiral(from, to, thickness) {
    if(from <= to) {
        f1 = fibonacci(from);
        f2 = fibonacci(from+ 1);
        arco(f1, [0, 90], thickness, 60);
        offset = f2-f1;
        translate([0, -offset, 0]) rotate(90)
            Fibonacci_espiral(from + 1, to, thickness);
    }
}
module Padovan_espiral(from, to, thickness) {
    union(){
        if(from <= to) {
            f1 = padovan(from);
            f2 = padovan(from+ 1);
            arco(f1, [0, 60], thickness, 60);
            offset = f2-f1;
            translate([-offset*cos(60), -offset*sin(60), 0]) rotate(60)
                Padovan_espiral(from+1, to, thickness);
        }
    
    }
}

// construción das espirais

module pattern(){
    
        if(tipo==0){ 
        union(){
            translate([fibonacci(n_inicio)+w/2,0,0]) circle(d=w,  $fn=res);    
            for(x = [0: 360/espirais: 360-360/espirais]) {
                rotate(x) Fibonacci_espiral(n_inicio, n_final, w); 
                if (dobre==true){
                    rotate(x) mirror(90) Fibonacci_espiral(n_inicio, n_final, w); 
                } 
            }
        }
    }
    if(tipo==1){ 
        union(){
            translate([padovan(n_inicio)+w/2,0,0]) circle(d=w,  $fn=res);  
        for(x = [0: 360/espirais: 360-360/espirais]) {
            rotate(x) Padovan_espiral(n_inicio, n_final, w); 
            if (dobre==true){
                rotate(x) mirror(90) Padovan_espiral(n_inicio, n_final, w); } 
            }
        }
    }

}

// Inserir dentro dun hexágono

if (hexagono==true){
    linear_extrude(h) union() {
        difference (){
            circle(r=hex, $fn=6);
            circle(r=(hex-bordo/cos(30)), $fn=6); 
        }
        intersection(){
            circle(r=hex, $fn=6);
            scale(escala) translate([0,0,0]) rotate(xiro) pattern();
        }
    }
}
else{
    scale(escala) rotate(xiro) pattern();
}
