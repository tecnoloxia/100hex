/* Espirógrafo - spirograph
100l
*/
// Funcións:

function Z(x, y) = sqrt(R_fora - (pow(x, 2) + pow(y, 2)));

function F(a, b) = a % b == 0 ? b : F(b, a % b);

// Parámetros espirógrafo
dentro = true;     
R_fixo = 64;
R_mobil = 30;
R_debuxo = 40;
pasos = 2;  // resolución
e = 1.6;    // ancho liña
h = 2;      // altura extrusión

// Parámetros figura
figura= true;
lados=6;    // hexágono
l=60;     // lado da figura en mm
ancho=e;    // ancho bordo
angulo=0;   // ángulo de xiro

// non tocar
R_fm = R_fixo / R_mobil;
R_fora = dentro ? pow(R_fixo + (R_debuxo - R_mobil), 2) : pow(R_fixo + (R_mobil + R_debuxo), 2);
veces = !dentro || R_fixo != R_mobil ? R_mobil / F(R_fixo, R_mobil) : 0;

// programa espirografo

module espirografo(){
    if (!dentro || R_fixo != R_mobil) {
        for (i = [0 : abs(pasos) : veces * 360 - pasos]) {  
            hull() {       
                rotate([0, 0, i])
                  translate([(dentro ? R_fixo - R_mobil : R_fixo + R_mobil), 0, 0])
                    rotate([0, 0, ((dentro ? -(R_fm * i) : R_fm * i) + 0)])
                      translate([R_debuxo, 0, 0])
                        circle(r=e/2);      
                rotate([0, 0, (i + pasos)])
                  translate([(dentro ? R_fixo - R_mobil : R_fixo + R_mobil), 0, 0])
                    rotate([0, 0, ((dentro ? -(R_fm * (i + pasos)) : R_fm * (i + pasos)) + 0)])
                      translate([R_debuxo, 0, 0])
                        circle(r=e/2);       
            }  
        } 
    }
}

// Inserir dentro dunha figura

if (figura == true){
    linear_extrude (h) union(){ 
        intersection() {
            rotate(angulo) circle(r=l,   $fn=lados);
            espirografo();
        }
        rotate(angulo)  difference() {
            circle(r=l, $fn=lados);
            circle(r=(l-ancho/cos(30)),  $fn=lados);
        }
    }
}
else{
    linear_extrude (h)  espirografo();
}


