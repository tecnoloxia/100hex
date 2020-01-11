/* 
teselación hexagonal
gridHex1
100hex https://tecnoloxia.org/100hex/
CC By-SA
*/

/* visualización
------------------------
*/

hexagono(forma);
// tesela(forma);
// grid(forma);         // (F6)


/* Parámetros:
------------------------
*/

w = 1.6;              // separación (ancho liñas)
h = 2 ;                // altura
hex = 60 ;             // lado do hexágono
bordo = w ;           // ancho do bordo do hexágono

n = 4 ;                // teselas (formas 5, 6, 8, 9, 11, 12, 13 --> n par)

forma = 0 ;
//  0:hexágonos, 1:cubos, 2:triángulos, 3:cadrados random, 4:triángulos random,
//5:asahona, 6:soles, 7:pétalos, 8:FlowerOfLife1, 9:FlowerOfLife2, 
//10:círculos superpostos, 11:flores, 12: malla, 13: pajarita nazarí, 14: trapecios,
//15: estrelas-cubos, 16: Francois stone mosaic, 17: entrelazado, 18:FlowerOfLife3,
//19:flores2, 20:rectángulos superpostos, 21: círculos1, 22: círculos2, 
//23: círculos3, 24: estrelas e hexágonos 1, 25: estrelas e hexágonos 2, 
//26: estrelas e hexágonos 3, 27: estrelas e hexágonos 4, 
//28: círculos e triángulos, 29: estrelas e cadrados, 30: cubos2, 
//31: ondas1, 32: ondas2, 33: aspas

res = 60;       // resolución dos círculos

echo ("forma=", forma);
echo ("n=", n);

/* 
------------------------ 
*/

//  para centrar as seguintes formas n debe ser par
f= (forma==5||forma==6||forma==8||forma==9||forma==11||forma==12||forma==13||forma==14||forma==15||forma==16||forma==17||forma==18||forma==19||forma==20||forma==21||forma==22||forma==23 ||forma==24||forma==25||forma==26||forma==27||forma==29||forma==30   ) ? 1 : 0;
nt= f==1 && n%2==1 ? n+1 : n;       

// diámetro tesela (altura hexágono)
d =                             
n==0 ? 0: 
f==1 ? (2*hex-w/cos(30))/nt :
(2*hex*cos(30)-w)/nt; 

echo ("distancia d=", d);

// outras dimensións

d1=d/cos(30);
r=d/2;
r1=r/cos(30);
r2=(r+w/2)/cos(30);
r3=(r-w/2)/cos(30);

// xeración da tesela

module tesela(forma){
    
    // hexágonos
    
    if (forma==0) {
        difference(){
            circle (r=r3, $fn=6);
        }
    }
    
    // cubos
    
    if (forma==1) {
        difference() {
            circle (r=r3, $fn=6);
            for(i=[0:120:360]) rotate(i+30) translate([0,r,0]) square([w,d], center=true);
        }
    }
    
    // triángulos
    
    if (forma==2) {
        difference() {
            circle (r=r3, $fn=6);
            for(i=[0:60:360]) rotate(i+30) translate([0,r,0]) square([w,d], center=true);
        }
    }
    
     // cadrados random
    
    if (forma==3){
        xiro=(round(rands(-0,12,1)[0]));
        echo (xiro*15);
        rotate(xiro*15) circle (r=r-w/2, $fn=3);
    } 

     // triángulos random
    
    if (forma==4){
        xiro=(round(rands(-0,12,1)[0]));
        echo (xiro*15);
        rotate(xiro*15) circle (r=r-w/2, $fn=4);
    } 
    
    // asahona    
    
    if (forma==5){  
        difference(){
            circle (r=r1+0.01, $fn=6);
            for(i=[0:30:360]) rotate(i+30) square([w,d1], center=true);
        }
    }
    
    // soles   
    
    if (forma==6){
        difference(){
            circle (r=r1+0.01, $fn=6);
            rotate(120) 
                for(i=[0:15:360]) rotate(i+30) translate([0,r,0]) square([w,2*(d+w)], center=true);
        }
    } 
    
    // pétalos
    
    if (forma==7){
            rotate(15) for(i=[0:60:360]) rotate(i+32) intersection() {
                translate([-d/7,d/3,0]) circle (r=d/4,  $fn=res);
                translate([d/7,d/3,0]) circle (r=d/4, $fn=res);
            }
    }
    
   // flower of life 1
    
    if (forma==8){
        difference(){
            circle (r=r2, $fn=6);
                for ( i = [0 : 60 : 360] ){
                translate([d*sin(i),d*cos(i),0]) difference() {
                    circle(r=d+w/2, $fn=res);
                    circle(r=d-w/2, $fn=res);
                }    
            }
        }
    }
    
   // flower of life 2
    
    if (forma==9){
        difference(){
            circle (r=r2, $fn=6);
            for(i=[0:60:360]){
                rotate(i) intersection() {
                    translate([d*sin(0),d*cos(0),0]) circle(r=d+w/6, $fn=res); 
                    translate([d*sin(60),d*cos(60),0]) circle(r=d+w/6, $fn=res);
                    translate([d*sin(120),d*cos(120),0]) circle(r=d+w/6, $fn=res);
                }
            }
        } 
    }
    
   //círculos superpostos
    
   if (forma==10){
        difference(){
            circle (r=(r1)/cos(30), $fn=6);
            intersection() {
                circle (r=(r1)/cos(30)+0.01, $fn=6);
                for(i=[0:60:360]){
                    rotate(i) translate([0,d,0]) circle(r=r2-0.3, $fn=res); 
                }
            } 
        }
    }
    
   //flores
    
    if (forma==11){
        rotate(30) for(i=[0:60:360]){
            rotate(i) intersection() {
                translate([r2*sin(0),r2*cos(0),0]) circle(r=r1, $fn=res); 
                translate([r2*sin(60),r2*cos(60),0]) circle(r=r1, $fn=res);
                translate([r2*sin(120),r2*cos(120),0]) circle(r=r1, $fn=res);
            }
        }
    }
    
    // malla   
    
    if (forma==12){  
        difference(){
            circle (r=r3, $fn=6);
            for(i=[0:30:360]) rotate(i+30) square([w,d1], center=true);
        }
    }
   
    // pajarita nazari da Alhambra
    
    if (forma==13){
        rotate(30-atan(w/r3))  difference() {
            union() {
                circle(r3/2, $fn=res);
                for (i=[0:2]) rotate(i*120) translate([0,r3/2]) circle(r3/2, $fn=res);
            }
            for (i=[0:2]) rotate(i*120) translate([(d-w)/2,0]) circle(r3/2, $fn=res);
        }
    }
    
    // trapecios
    
    if (forma==14){
        difference() {
            circle (r=r3, $fn=6);
            // for(i=[0:90:360]) rotate(i+30) translate([0,r,0]) square([w,d], center=true);
            for(i=[0:60:360]) rotate(i) translate([0,d1/4*cos(30),0]) square([r1*(1-sin(30))+w/2,w], center=true);
            for(i=[0:60:360]) rotate(i+30) translate([0,r1,0]) square([w,d1*(1-sin(30))+w/2], center=true);
            for(i=[0:60:360]) rotate(i+60) translate([0,r,0]) square([w,r-w], center=true);
        }
    }
    
     // estrelas e cubos
    
    if (forma==15){
        difference() {
            circle (r=r3, $fn=6);
            //for(i=[0:60:360]) rotate(i+30) translate([0,r,0]) square([w,d], center=true);
            for(j=[0:60:360]) rotate(j) 
                translate([d1/4*cos(60),d1/4*sin(60),0]) for(i=[0:120:120]) rotate(i-90) translate([0,r,0]) square([w,d+w/2], center=true);
        }
    }   
    
    // Francois stone mosaic   

    if (forma==16){
        difference() {
            rotate(30) circle (r=r1/cos(30)-w/2/cos(30), $fn=6);
            for(i=[0:120:360]) rotate(i) translate([0,r,0]) square([w,d], center=true);
            for(i=[0:120:360]) rotate(i+60) translate([0,3/2*r1/cos(30)-w/cos(30),0]) rotate(30) circle(r=r1/cos(30)-w/2/cos(30), $fn=6);
         }
    }
    
    // Entrelazado

    if (forma==17){
        difference() {
            rotate(30) circle (r=r1/cos(30), $fn=6);
            for(i=[0:120:360]) rotate(i) translate([0,r,0]) square([w,d], center=true);
            for(i=[0:120:360]) rotate(i+60) translate([0,3/2*r1/cos(30)-3/2*w/cos(30),0]) rotate(30) circle(r=r1/cos(30)-w/2/cos(30), $fn=6);
         }
    }
    
    // flower of life 3
    
    if (forma==18) {
            for(i=[0:60:360]){
                rotate(i) intersection() {
                    translate([d*sin(0),d*cos(0),0]) circle(r=d-w/2, $fn=res); 
                    translate([d*sin(60),d*cos(60),0]) circle(r=d-w/2, $fn=res);
                    translate([d*sin(120),d*cos(120),0]) circle(r=d-w/2, $fn=res);
                }
            }
    }

   //flores2
    
    if (forma==19){
        difference(){
            circle (r=r1+0.01, $fn=6);
            rotate(30) for(i=[0:60:360]){
                rotate(i) intersection() {
                    translate([r1*sin(0),r1*cos(0),0]) circle(r=r2, $fn=res); 
                    translate([r1*sin(60),r1*cos(60),0]) circle(r=r2, $fn=res);
                    translate([r1*sin(120),r1*cos(120),0]) circle(r=r2, $fn=res);
                }
            }
        }
    }

     // rectángulos superpostos
    
    if (forma==20){
        difference() {
            circle (r=r1+0.01, $fn=6);
            for(i=[0:60:360]) rotate(i) translate([0,r,0]) difference() { 
                square([r1+w,r1*cos(30)+w], center=true);
                square([r1-w,r1*cos(30)-w], center=true);
            }
        }       
    }
    
    // círculos1
    
    if (forma==21){      
        difference() {
            circle (r=r1+0.01, $fn=6);
            for(i=[0:60:360]) rotate(i+30) translate([0,r1,0]) 
                circle(r=r1/2+0.2, $fn=res);
        }       
    }
    
    // círculos2
    
    if (forma==22){     
        difference() {
            circle (r=r1+0.01, $fn=6);
            for(i=[0:60:360]) rotate(i+30) translate([0,r1,0]) 
                difference() { 
                    circle(r=r1/2+w/2, $fn=res);
                    circle(r=r1/2-w/2, $fn=res);                
                }
        }       
    }
    
    // círculos3
    
    if (forma==23){     
        for(i=[0:60:360]) rotate(i+30) translate([0,r1,0]) 
            circle(r=r1/2-w/2, $fn=res);    
    }
    
   //estrelas e hexágonos 1
    
   if (forma==24){      
        difference() {
            circle (r=r1+0.01, $fn=6);
            for(i=[0:60:360]) rotate(i+30) 
                translate([2*r1-r1*cos(30)/2,0,0]) 
                difference() { 
                    circle(r=r1+w/2/cos(30),  $fn=6);
                    circle(r=r1-w/2/cos(30), $fn=6);                
                }
        }  
    }
    
    //estrelas e hexágonos 2
    
    if (forma==25){    
        difference() {
            circle (r=r1+0.01, $fn=6);
            for(i=[0:60:360]) rotate(i+30) 
                translate([2*r1-r1*cos(30)/2,0,0]) 
                    circle(r=r1+w/2/cos(30),  $fn=6);          
        }  
    } 
        
    // estrelas e hexágonos 3
    
   if (forma==26){       
        difference() {
            circle (r=r1+0.01, $fn=6);
            for(i=[0:60:360]) rotate(i+0) 
                translate([r1*(2-cos(60)),0,0]) 
                difference() { 
                    circle(r=r1+w/2/cos(30), $fn=6);
                    circle(r=r1-w/2/cos(30), $fn=6);                
                }
        }  
   }
 
     // estrelas e hexágonos 4   
    
    if (forma==27){    
        difference() {
            circle (r=r1+0.01, $fn=6);
            for(i=[0:60:360]) rotate(i+0) 
                translate([r1*(2-cos(60)),0,0]) 
                    circle(r=r1+w/2/cos(30), $fn=6);            
        }  
    }
    
    // círculos e triángulos
    
    if (forma==28) {
        difference() {
            circle (r=r3, $fn=6);
            for(i=[0:60:360]) rotate(i+30) translate([0,r,0]) square([w,d], center=true);
            for(i=[0:60:360]) rotate(i) translate([0,(r3+w/2)/2/cos(30),0]) 
                difference(){
                    circle (r=r3/2*tan(30)+w/2, $fn=res);
                    circle (r=r3/2*tan(30)-w/2, $fn=res);
                }
        }
    }
    
    // estrelas e cadrados
    
    if (forma==29){  
      rc=((r1-w*(1+tan(30)))*cos(45)/cos(15))/2;
      for(i=[0:60:360]) rotate(i) 
      translate([r1-rc-w/2/cos(30),0,0]) circle(r=rc, $fn=4);  
    }    
    
    // cubos2  

    if (forma==30){
        difference() {
            rotate(30) circle (r=r1/cos(30)-w/2/cos(30), $fn=6);
            for(i=[0:120:360]) rotate(i) translate([0,r,0]) square([w,d], center=true);
            for(i=[0:120:360]) rotate(i) translate([0,r1/cos(30)/2,0]) for(i=[0:120:360]) rotate(i) translate([0,r,0]) square([w,d], center=true);
            for(i=[0:120:360]) rotate(i+60) translate([0,3/2*r1/cos(30)-w/cos(30),0]) rotate(30) circle(r=r1/cos(30)-w/2/cos(30), $fn=6);
         }
    }
    
    // ondas 1
    if (forma==31){
        rotate(120) difference() {
            circle (r=r1+0.01, $fn=6); 
            for(i=[0:180:180]) rotate(i) difference(){
                translate([0,r,0]) circle (r=r+w/2, $fn=res); 
                translate([0,r,0]) circle (r=r-w/2, $fn=res);   
            }
        }     
    }
    
    // ondas 2
    
    if (forma==32){
        rotate(120) difference() {
            circle (r=r1+0.01, $fn=6); 
            for(i=[0:180:180]) rotate(i) difference(){
                translate([0,r,0]) circle (r=r+w/2, $fn=res); 
                translate([0,r,0]) circle (r=r-w/2, $fn=res);   
            }
            for(i=[0:180:180]) rotate(i) { 
                difference(){
                    translate([-r1/2,r,0]) circle (r=r1/2+w/2, $fn=res); 
                    translate([-r1/2,r,0]) circle (r=r1/2-w/2, $fn=res); 
                }
                difference(){
                    translate([r1/2,r,0]) circle (r=r1/2+w/2, $fn=res); 
                    translate([r1/2,r,0]) circle (r=r1/2-w/2, $fn=res); 
                }               
            }
        }
    }
    
    // aspas
    
    module semi() {
           difference(){
               translate([0,r/2,0]) circle (r=r/2+w/2, $fn=res); 
               translate([0,r/2,0]) circle (r=r/2-w/2, $fn=res); 
               translate([0,-r/2,0]) square([2*r,2*r], center=false); 
        }
    }
    
    if (forma==33){
        difference() {
            circle (r=r1+0.01, $fn=6);  
              for(i=[0:60:300]) rotate(i+120) semi();
              for(i=[0:60:300]) rotate(i) translate([0,r,0]) mirror([1,0,0])  semi();
        }     
    }
    
  
    

        
    
    
} // Fin teselas



// Xeración da teselación

module grid(forma){
    for (j=[0:1:nt*2]) 
        translate([(j%2)*r, j*r*2*cos(30), 0]) 
        for(i=[-nt:1:nt])
            translate([i*d,0,0]) rotate([0,0,30]) tesela(forma);
}


// Inserir a teselación dentro dun hexágono

// parámetros para centrar o hexágono
x= f==1 ? 0 : (-hex*cos(30)+w/2);
y= -nt*(r)*2*cos(30); 

rot= f==1 ? 0 : 30;

module hexagono(forma){
     rotate(rot) linear_extrude(h) union(){
         rotate(rot) difference (){
            circle(r=hex,  $fn=6);
            circle(r=hex-bordo/cos(30),  $fn=6);
        }
        difference(){
            rotate(rot) circle(r=hex,  $fn=6);
            translate([x,y,0]) grid(forma);
        }
    }
}
