/* 

AdaptaciÓn para 100hex
https://tecnoloxia.org/100hex/

Modelos: https://tecnoloxia.org/docs/100hex/L_system_100hex.pdf

L-system OpenSCAD library by Hans Loeblich
https://gist.github.com/thehans/a1494db8046a58832e2ebb10a5908a66

*/


/****************************/
/* Parámetros - parameters */
/****************************/

hex=60;         // side of the hexagon
h=2;            // height of the hexagon
$fn=32;         // resolution


////rounded = true; // Add circles at each vertex. False only angle=90.
//
////w = 2;        // line width
////d = 4*w;      // line length (d>w)
////n=8;          // iterations
//
////xc=-2*d;      // to center the curve on X
////yc=-2*d;      // to center the curve on Y
////rot=0;        // rotation angle of the curve
//
////polygon=false;    // false: open curves, true: closed curves
////hexagono=false;   // true: inside a hexagon, false: single curve
////diferenza= 0;    // 0: curve+hexagon; 1: hexagon-curve 2: mix subtract+join
////bordo=w;          // width of hexagon edge
//
////lina=0;       // To add lines with the vertices of the hexagon



/****************************/
/* 
Elixir a curva - choose the curve
    Ctrl+ Alt + d   = descomentar - uncomment
    Ctrl+d          = comentar - comment
    F6              = display
*/
/****************************/


/**** 01-Minkowski ****/ 

    axiom="F+F+F+F";
    rules=["F=F+F-F-FF+F+F-F"];
    angle=90;

    n=2;      // hexagon 1->3
    
    hexagono= n>3? false : true;
    polygon=true;  // true,false
    diferenza=1;   // 0,1
    
    w= (n==1)? 2.01 : (n==2)? 1.6 : 1.21;
    bordo= diferenza>0? 2.01 : w;
    
    a=hex*cos(30)-bordo/2;
    
    function f(n)= (n==1)?3 : f(n-1)*4+1 ;
    
    d= (hexagono==true)? a/f(n) : 2*w ;       

    xc=-pow(2,n)*pow(2,n)/2*d;
    yc=-pow(2,n)*pow(2,n)/2*d;
    
    rot=0;

    rounded = false;
    lina=0;


/**** 02-quadratic1  ****/ 

//    axiom="F+F+F+F";
//    rules=["F=F+F-F-FFF+F+F-F"];
//    angle=90;
//
//    n=2;        // hexagon 1->2
//    
//    hexagono= n>2? false : true;
//    polygon=true;       // true/false
//    diferenza=1;       // 0,1
//    
//    w= (n==1)? 2.01 : (n==2)? 1.6 : 1.21;
//    bordo= diferenza>0? 3 : w;
//    
//    a=hex*cos(30)-bordo/2;
//    
//    d= 
//    n==1? a/(7/2) : 
//    n==2? a/(31/2) : 
//    2*w;  
//
//    xc= n==1 ? -2.5*d : n==2 ? -11.5*d : -49.5*d ;
//    yc= n==1 ? -1.5*d : n==2 ? -3.5*d : -2.5*d;
//    rot=0;
//    
//    rounded = false;
//    lina=0;


/**** 03-quadratic2  ****/ 

//    axiom="F+F+F+F";
//    rules=["F=F+FF-F-FF+F-FF+F+FF-F"];
//    angle=90;
//    
//    n=2;    // hexagon: 1, 2, curve: max 4
//    
//    hexagono= n>3? false : true;
//    polygon= true;     // true/false
//    diferenza=1;       // 0,1
//    
//    w= (n==1)? 2.01 : (n==2)? 1.21 : 0.1;
//    bordo= diferenza>0? 3 : w;
//    
//    a=hex*cos(30)-bordo/2;
//    
//    d= hexagono==true? a/(pow(5,n)-1/2) :  2*w;      
//
//    xc= -pow(5,n)/2*d ;
//    yc= xc;
//    
//    rot=0;
//
//    rounded = false;
//    lina=0;
    

/**** 04-quadratic3 ****/ 

//    axiom="F+F+F+F";
//    rules=["F=F-FF+FF+F+F-F-FF+F+F-F-FF-FF+F"];
//    angle=90;
//    
//    n=2;    // hexagon:1,2 ; curve: max 4
//    
//    hexagono= n>2? false : true;
//    polygon= true;      // true/false
//    diferenza=1;       // 0,1
//    
//    w= (n==1)? 1.6 : (n==2)? 1.21 : 0.1;
//    bordo= diferenza>0? 3 : w;
//    
//    b=hex-bordo/2/cos(30)/cos(45);
//    
//    d= 
//    n==1? b/(5+2/tan(60)) : 
//    n==2? b/(32+11/tan(60)):  
//    2*w;
//
//    function f2(n)= (n==1)? 3 : f2(n-1)*6 ;
//
//    xc= -f2(n)*d;
//    yc= xc;
//    
//    rot=0;
//    
//    rounded = false;
//    lina=0;


/**** 05a-32_SegmentCurveI ****/ 

//    axiom="F";
//    rules=["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"];
//    angle=90;
//    
//    n=2;    // hexagon:1,2 ; curve: max 3
//    
//    hexagono= n>2? false : true;
//    polygon= false;  // (true only n=2)
//    diferenza=0;
//    
//    w= polygon==true? 1.21 : n==1? 2.01 : diferenza>0?  0.4 : 0.8 ;
//    bordo= diferenza>0? 3 : w;
//    
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30)/cos(45);
//        
//    d= 
//    n==1? b/(3+4/tan(60)) : 
//    n==2? b/(32+27/tan(60)) :  
//    2*w;       
//
//    xc= n==1? 0 : n==2? 32*d : 0 ;
//    yc= n==1? -4*d : n==2? 0 : 0 ;
//    
//    rot= 0;
//
//    rounded = false;
//    lina= n==2? 60 : 0;
    

/**** 05b-32_SegmentCurveII ****/ 

//    axiom="F-F-F-F";
//    rules=["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"];
//    angle=90;
//    
//    n=2;    // hexagon:1,2 ; curve: max 3
//    
//    hexagono= n>2? false : true;
//    polygon= true; 
//    diferenza=1;
//    
//    w= polygon==true? 1.21 : n==1? 2.01 : 0.4 ;
//    bordo= diferenza>0? 3 : w;
//    
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30)/cos(45);
//
//    d= 
//    n==1? b/(7+4/tan(60)) : 
//    n==2? a/68 :  
//    2*w;       
//
//    xc= n==1? -4*d : n==2? 32*d : 0 ;
//    yc= n==1? -4*d : n==2? -32*d : 0 ;
//    
//    rot=0;
//    
//    rounded = false;
//    lina= 0;


/**** 06-Cesaro's Sweep variant ****/ 

//    axiom="F";
//    rules=["F=F+F--F+F"];
//    angle=80;
//    
//    n=4;    // hexagon:1->5 ; curve: max 7
//    
//    hexagono= n>5? false : true;
//    polygon= false; 
//    diferenza=0;
//    
//    w= polygon==true? 1.21 : n==1? 2.01 : n==2? 1.6 : n==3? 1.21 : n==4? 1.21 : 0.4 ;
//    bordo=w;
//    
//    b=hex-bordo/2/cos(30);
//    
//    function f(n)= n==1 || n==0 ? 2+2*cos(angle) : f(n-1)*(1+cos(angle))*(n-1);  echo(f(n));
//    
//    d= 
//    n==1? b/f(n)*2 : 
//    n==2? b/f(n) : 
//    n==3? b/f(n) : 
//    n==4? b/f(n)*3/2 :  
//    n==5? b/f(n)*3 : 
//    4*w;       
//
//    xc= n==1? -d/2*f(n) : n==2? -d*f(n) : n==3? -d*f(n) : n==4? -2/3*d*f(n) : n==5? -1/3*d*f(n) : 0;
//    
//    yc= 0 ;
//    rot=0;
//
//    rounded = true;
//    lina= 60;
    
   
    
    
/**** 07-CesaroCarpet ****/   
 
//    axiom="X+X+X+X";
//    rules=["X=FXF+FXF--FXF+FXF"];
//    angle=90;
//    
//    n=3;    // hexagon:1->4 ; curve: max 6
//
//    hexagono= n>4? false : true;
//    polygon= false; 
//    diferenza=2;       // 0,2
//    
//    w= n<=2? 2.01 : n==3? 1.6 : n==4? 0.8 : 0.4 ;
//    bordo=w;
//       
//    function f(n)= n==1 || n==0 ? 2 : (f(n-1))*2+2 ;  echo(f(n));
//    
//    c=(hex*cos(30)-bordo*cos(45))*cos(45);
//    
//    d= c/f(n);       
//
//    xc= -f(n)*d;
//    yc= xc;
//    rot=45;
//    
//    rounded = false;
//    
//    b=hex-bordo/2/cos(30);
//    lina= b-f(n)*2*d*cos(45) ;
    
    
/**** 08-icyFractal ****/ 

//    axiom="F-F-F-F";
//    rules=["F=FF-F--F-F"];
//    angle=90;
//    
//    n=3;    // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=2;    // 0,2
//    
//    w= n<=2? 2.01 : n==3? 1.6 : n==4? 0.8 : 0.4 ;
//    bordo=w;
//    
//    c=(hex*cos(30)-bordo*cos(45))*cos(45);
//    
//    d= n<4? c/pow(3,n)*2 : 2*w;       
//    
//    xc=-pow(3,n)/2*d;
//    yc= -xc;
//    
//    rot= hexagono==true? 45 : 0;
//    
//    rounded = false;
//    
//    b=hex-bordo/2/cos(30);
//    lina= b-d*pow(3,n)*cos(45) ;



/**** 09- Heighway's dragon curve  ****/ 

//    axiom="FX";
//    rules=["X=X+YF+","Y=-FX-Y"];
//    angle=90;
//    
//    n=8;        // ( hexagon: n=9; curva: n<=18)
//    
//    hexagono= (n<=11)? true : false;
//    polygon=false;
//    diferenza=0;
//    
//    w= (n<6)? 2.01 : (n<9)? 1.6 : (n<11)? 1.21 : 0.8;
//    bordo=w;
//    
//    a=hex*cos(30)-bordo/2;
//    
//    function g(n)= 
//    (n%2==1)? (n==1 || n==3)? 1 : g(n-2)+1 :
//    (n<8)? 0 : g(n-2)+1 ;
//    
//    function f(n)= 
//    (n==0 || n==-1)? 1 :
//    (n%2==1)? (n==1)?1 : f(n-2)+pow(2,g(n)) :
//    (n==2)? 1 : (n==4)? 5 : f(n-2)+6*pow(2,g(n));
//     
//    d= (hexagono==true)? (n==1 || n==2)? a : a/(f(n)/2):     3*w;
//    
//    xc= 
//    n==1? -d*cos(30)/2 :
//    n==2? -d/2 :
//    n==3? d*1/2 :
//    n==4? d*3/2 :   
//    n==5? d*2 :
//    n==6? d*2 :
//    n==7? -d*5/2 :
//    n==8? -d*13/2 :
//    n==9? -d*15/2 : 
//    n==10? -d*8/2 :
//    n==11? d*21/2 :
//    n==12? d*53/2 :
//    0;
//    
//    yc= 
//    n==1? 0 :
//    n==2? -d :
//    n==3? -d :
//    n==4? -d*1/2 :
//    n==5? d*3/2 :
//    n==6? d*7/2 :
//    n==7? d*8/2 :
//    n==8? d*5/2 :
//    n==9? -d*11/2 :
//    n==10? -d*27/2 :
//    n==11? -d*30/2 :
//    n==12? -d*15/2 : 
//    0;
//    
//    rot= (n==3 || n==4 || n==7 || n==8 || n==11)? 90 : 0; 
//    
//    rounded = false;
//    lina=0;
    
    

/**** 10- Polya Sweep ****/             // (not hexagon)

//    axiom="X";
//    rules=["X=+FX-FY-","Y=-FX+FY+", "F="];
//    angle=90;
//    
//    n=8;        // (n<=18)
//
//    polygon=false;
//    hexagono=false;
//    diferenza=0;
//    
//    w=0.8;
//    bordo=w;
//    
//    d=4*w;
//    
//    xc= 0;
//    yc= 0;
//    rot=0;
//
//    rounded = false;  
//    lina=0; 


/**** 11- hexagonal dragon  ****/ 

//    axiom="X-X-X-X-X-X";
//    rules=["X=X+YF+","Y=-FX-Y"];
//    angle=60;
//    
//    n=5;        // (n<=10)
//    
//    hexagono= n<=7? true : false;
//    polygon=true;   // true, false
//    diferenza=1;   // 0,1
//    
//    w= polygon==true? 1.21 : n<=2? 2.01 : n<=4? 1.6 : n<6? 1.21 : n<=7? 0.8 : 0.4 ;
//    bordo= diferenza>0? 3 : w;
//    
//    b=hex-bordo/2/cos(30);
//    
//    d=
//    (n==1)? b:
//    (n==2)? b/3:
//    (n==3)? b/6:
//    (n==4)? b/12:
//    (n==5)? b/21 :
//    (n==6)? b/38 :
//    (n==7)? b/65 :
//    (n==8)? b/112 :
//    3*w;
//    
//    xc= 
//    (n==1)? d*1/2:
//    (n==2)? d*4/2:
//    (n==3)? d*10/2:
//    (n==4)? d*19/2:
//    (n==5)? d*28/2 :
//    (n==6)? d*28/2 :
//    (n==7)? d*1/2 :
//    (n==8)? -d*80/2 :
//    0;
//    
//    yc= 
//    (n==1)? -d*cos(30):
//    (n==2)? -d*cos(30)*2:
//    (n==3)? -d*cos(30)*2:
//    (n==4)?  d*cos(30):
//    (n==5)?  d*cos(30)*10:
//    (n==6)?  d*cos(30)*28:
//    (n==7)?  d*cos(30)*55:
//    (n==8)?  d*cos(30)*82:
//    0 ;
//    
//    rot=0;
//        
//    rounded = true;
//    lina=0;



/**** 12- hexagonal dragon Estrela  ****/ 

//    axiom="Z-Z-Z--Z-Z-Z";
//    rules=["X=X+YF+","Y=-FX-Y","Z=FX+FX"];
//    angle=60;
//    
//    n=7;        // (n<=12)    
//    
//    hexagono= (n>1 && n<10)? true : false;
//    polygon=false;
//    diferenza=2;   // 0, 2
//    
//    w= n<=3? 2.01 : n==4? 1.6 : n<=6? 1.21 : n==7? 0.8 : 0.4 ;
//    bordo= diferenza>0? 2.01 : w;
//    
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30);
//    
//    list = [0,1,2,3,6,10,19,30,57,91,172,273];
//    
//    d=  (hexagono==true)? b/list[n] : 
//    3*w;
//    
//    xc=0;
//    yc=0 ;
//    
//    rot=0;
//
//    rounded = true;
//    lina=0;
  
  
    
/**** 13-twin_dragon  ****/     
    
//    axiom="FX+FX+";
//    rules=["X=X+YF","Y=FX-Y"];
//    angle=90;
//    
//    n=8;        // (n<=14)
//    
//    hexagono= n<11? true : false;
//    polygon=false;
//    diferenza=0;  //(2 para n>6)
//    
//    w= diferenza==2? 0.4 : n<=3? 2.01 : n<=7? 1.6 : n<=9? 1.21 : n==10? 0.8 : 0.4 ;
//    bordo= diferenza==2? 2.01 : w;
//    
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30)/cos(45);
//          
//    d= 
//    n==1? b/(1/2+1/2/tan(60)) :
//    n==2? b/(1+1/tan(60)) :
//    n==3? a/2 :
//    n==4? a/3 :
//    n==5? a/4 :
//    n==6? a/6:
//    n==7? a/9 : 
//    n==8? a/13 : 
//    n==9? a/18 :   
//    n==10? a/26 : 
//    4*w;
//    
//  
//    xc=
//    n==1? -d*1/2 :
//    n==2? 0 :
//    n==3? d :
//    n==4? d*2 :
//    n==5? d*2 :
//    n==6? 0 :
//    n==7? -d*4 :
//    n==8? -d*8 :
//    n==9? -d*8 :
//    n==10? 0 :
//    0;
//    
//    yc=
//    n==1? -d*1/2 :
//    n==2? -d :
//    n==3? -d :
//    n==4? 0 :
//    n==5? d*2 :
//    n==6? d*4 :
//    n==7? d*4 :
//    n==8? 0 :
//    n==9? -d*8 :
//    n==10? -d*16 :
//    0;
//    
//    rot= hexagono==true? (n==5 || n==6 || n==9 || n==10)? 0 : 90 : 0;
//
//    rounded = false;
//    lina=0;
    
    
/**** 14-terdragon ****/ 

//    axiom="F";
//    rules=["F=F+F-F"];
//    angle=120;
//    
//    n=5;        // (n<=10)
//        
//    hexagono= n<7? true : false;
//    polygon=false;
//    diferenza=0;
//    
//    w= n<4? 2.01 : n==4? 1.6 : n==5? 1.21 : 0.8;
//    bordo=w;
//    
//    b=hex-bordo/2/cos(30);
//    
//    list1 = [0,1,3/2,3,11/2,10,33/2];
//    
//    d= (hexagono==true)? b/list1[n] :
//    4*w;
//    
//    xc=
//    n==1? -d*3/4 :
//    n==2? -d*3/4 :
//    n==3? 0 :
//    n==4? d*9/4 :
//    n==5? d*27/4 :
//    n==6? d*54/4 :
//    0;
//    
//    yc=
//    n==1? -d/2*sin(60) :
//    n==2? -d/2*sin(60)*3 :
//    n==3? -d/2*sin(60)*6 :
//    n==4? -d/2*sin(60)*9 :
//    n==5? -d/2*sin(60)*9 :
//    0;
//
//    rot=0;
// 
//    rounded = true;
//    lina=0;
    

/**** 15-inverted_terdragon ****/ 

//    axiom="F";
//    rules=["F=F-F+F + F-F+F - F-F+F"];
//    angle=120;
//    
//    n=2;        // (n<=5)
//    
//    hexagono= n<4? true : false;
//    polygon=false;
//    diferenza=0;
//    
//    w= n==1? 2.01 : n==2? 1.6 : n==3? 1.21 : 0.8;
//    bordo= w;
//    
//    d= hexagono==true? (2*hex-bordo/cos(30))/pow(3,n) : 6*w ;
//    
//    xc= -pow(3,n)/2*d;  
//    yc=0;
//
//    rot=0;
//
//    rounded = true;
//    lina=0;
    
    
/**** 16- Mandelbrot quartet - root5 ****/ 

//    axiom="+X";
//    rules=["X=-FYFX+FX+FY-FX","Y=FY+FX-FY-FYFX+","F=" ];
//    angle=90;
//    
//    n=3;        // (hexagon n<=5)
//    
//    hexagono= n<5? true : false;
//    polygon=false;  
//    diferenza=1;  // 0,1
//    
//    w= diferenza==1? 0.8 : n<3? 2.01 : n==3? 1.6 : 1.2;
//    bordo= diferenza>0? 4 : w;
//    
//    b= hex-bordo/2/cos(30)/cos(45);
//    
//    d=
//    n==1? b/(1+1/tan(60)) :
//    n==2? b/(3+2/tan(60)) :
//    n==3? b/(6+5.5/tan(60)) : 
//    n==4? b/(16.5+7.5/tan(60)) : 
//    n==5? b/(16.5+7.5/tan(60)) : 
//    6*w ;
//    
//    xc= 
//    n==1? -d*1 : 
//    n==2? -d*3 : 
//    n==3? -d*6.5 : 
//    n==4? -d*8.5 : 
//    0; 
//    
//    yc= 
//    n==1? -d*1 : 
//    n==2? d*0 : 
//    n==3? d*4.5 : 
//    n==4? d*15.5 : 
//    0;
//
//    rot=0;
//    
//    rounded = false;
//    lina=0;


/**** 17- Hilbert curve ****/

//    axiom="X";
//    rules=["X=-YF+XFX+FY-","Y=+XF-YFY-FX+" ];
//    angle=90;
//    
//    n=5;        // (n<=6)
//    
//    hexagono= n<6? true : false;
//    polygon=false;
//    diferenza=1;
//    
//    w= n==1? 2.01 : n==2? 2.01 : n==3? 1.6 : n==4? 1.21 : 0.8;
//    bordo= diferenza>0? 4 : w;
//    
//    function f(n)= (n==1)? 1 : (f(n-1)*2+1)  ;
//    
//    d= (hex*cos(30)-bordo/2)/cos(45)/f(n);
//      
//    xc=-1/2*d*f(n);
//    yc= -xc ;
//
//    rot=45;
//
//    rounded = false;
//    lina= 0 ;


    
/**** 18- Moore curve ****/   

//    axiom="F-XFX-F-XFX";
//    rules=["X=+YF-XFX-FY+","Y=-XF+YFY+FX-" ];
//    angle=90;
//    
//    n=4;        // (hexagon: 1->5 ; curve: n<=7)
//    
//    hexagono= n<5? true : false;
//    polygon= true;     // true, false
//    diferenza=1;       // 0,1, 2
//        
//    w= diferenza==2? 0.01 : n==1? 2.01 : n==2? 2.01 : n==3? 1.6 : n==4? 1.21 : 0.8;
//    bordo= diferenza>0? 4 : w;
//    
//    a=polygon==true? hex*cos(30)-bordo/2 : hex*cos(30)-bordo/2/cos(45);
//    
//    function f(n)= (n==1)? 1 : (f(n-1)*2+1)  ;
//    function g(n)= (n==1)? 3 : (g(n-1)*2+1)  ;
//    
//    d= hexagono==true? a/(g(n)*cos(45)) : 3*w;
//      
//    xc=-1/2*d;
//    yc= (f(n)+0.5)*d ;
//
//    rot=hexagono==true? 45 : 0;
//    
//    rounded = false;
//    lina= 0 ;



/**** 19- Peano curve ****/   

//    axiom="X";
//    rules=["X=XFYFX-F-YFXFY+F+XFYFX","Y=YFXFY+F+XFYFX-F-YFXFY" ];
//    angle=90;
//    
//    n=3;        // (n<=6)
//    
//    hexagono= n<4? true : false;
//    polygon= false;
//    diferenza=0;   // 0,1
//    
//    w= n==1? 2.01 : n==2? 2.01 : n==3? 1.6 : 0.8;
//    bordo= diferenza>0? 4 : w;
//    
//    a=hex*cos(30)-bordo/2/cos(45);
//    b=hex-bordo/2/cos(30);
//    
//    function f(n)= (n==1)? 2 : (n==2)? 8 : pow(3,n)-1  ;
//    
//    d= hexagono==true? a/f(n)/cos(45) : 3*w;
//    
//    xc= (n<=2)? -d*(f(n)/2) : -d*(f(n)/2);
//    yc= -xc;
//    
//    rot=45;
//       
//    rounded = true;
//    lina= (hex-bordo/2/cos(30))*(1-cos(30));


    
/**** 20- Gosper curve ****/   

//    axiom="X";
//    rules=["X=FX+YF++YF-FX--FXFX-YF+","Y=-FX+YFYF++YF+FX--FX-FY", "F=" ];
//    angle=60;
//    
//    n=4;        // ( hex: 1->4 ; curva n<=5)
//    
//    hexagono= n<5? true : false;
//    polygon= false;
//    diferenza=0;   // 0,1
//    
//    w=
//    diferenza==0? n<3? 2.01 : n==3? 1.6 : n==4? 1.21 : 0.8 :
//    n<3? 1.6 : n==3? 0.8 : n==4? 0.4 :
//    0.8;
//    
//    bordo= diferenza>0? n==4? 5.5 : 6 : w;
//    
//    b=hex-bordo/2/cos(30);
//    
//    function f(n)= (n==1)? 1.5 : (n==2)? 4 : (n==3)? 12 : (n==4)? 31 : 1  ;
//     
//    d= n<5? b/f(n) : 4*w;
//      
//    xc= (n==1)? -d : (n==2)? -d : (n==3)? 0 : (n==4)? d*9.5 : 0;
//    yc= (n==1)? -d*cos(30) : -d*cos(30)*f(n) ;
//
//    rot=0;
//    
//    rounded = true;
//    
//    lina= 0;


    
    
/**** 21- inner-flip Gosper curve  ( REVISAR!! ) ****/   

//    axiom="X";
//    rules=["X=FZ-FY--FY+FZ++FZFZ+FY-","Y=FW+XF++XF-WF--WFWF-XF+", "Z=-WF+XFXF++XF+WF--WF-XF", "W=+FY-FZF--ZF-FY++FY+FZ", "F=" ];
//    angle=60;
//    
//    n=3;        // (n<=3 Revisar rules, a partir de 4 non funciona)
//           
//    hexagono= n<4? true : false;
//    polygon= false;
//    diferenza=1;   // 0,1 
//    
//    w=
//    diferenza==0? n<3? 2.01 : n==3? 1.6 : 0.8 :
//    n<3? 1.6 : n==3? 0.8 : 
//    0.8;
//    
//    bordo= diferenza>0? 8: w;
//    
//    a=hex*cos(30)-bordo/2;
//    
//    function f(n)= (n==1)? 1.5 : (n==2)? diferenza>0? 4.5 : 4 : (n==3)? 11 : 1  ;
//    
//    d= hexagono==true? a/(f(n)*cos(30)) : 4*w;
//      
//    xc= 
//    diferenza>0? (n==1)? -d : (n==2)? -d*3.5 : (n==3)? -d*7 : 0 :
//    (n==1)? -d : (n==2)? -d*4 : (n==3)? -d*7.5 : 
//    0;
//    yc= (n==1)? d*cos(30) :(n==2)? d*cos(30)*2 : (n==3)? d*cos(30)*9 : 0 ;
//
//    rot=0;
//    
//    rounded = true;
//    lina= 0;
    


/**** 22- Gosper curve tree ****/   
//
//    axiom="X--X--X";
//    rules=["X=FX+YF++YF-FX--FXFX-YF+","Y=-FX+YFYF++YF+FX--FX-FY", "F=" ];
//    angle=60;
//    
//    n=3;        // ( hex: 1->3 ; curva n<=4)
//        
//    hexagono= n<4? true : false;
//    polygon=false;  // true, false
//    diferenza=0;   // 0,1
//    
//    w= n==1? 2.01 : n==2? 1.6 : n==3? 1.21 : 0.8;
//    bordo= diferenza>0? 4 : w;
//    
//    function f(n)= (n==1)? 5 : (n==2)? 15 : (n==3)? 39 : 1  ;
//    
//    a= (polygon==false && diferenza==0)? 2*hex*cos(30) : 2*hex*cos(30)-bordo ;
//    
//    d= hexagono==true? a/f(n) : 4*w;
//      
//    xc= (n==1)? -d*1.5 : (n==2)? -d*4 : (n==3)? -d*9.5 : 0;
//    yc= (n==1)? d*cos(30)/3 :(n==2)? -d*cos(30)*2/3 : (n==3)? -d*cos(30)*17/3 : 0 ;
//
//    rot=30;
//    
//    rounded = true;
//    lina= 0;



/**** 23- Gosper curve star ****/   

//    axiom="X-X-X-X-X-X";
//    rules=["X=FX+YF++YF-FX--FXFX-YF+","Y=-FX+YFYF++YF+FX--FX-FY", "F=" ];
//    angle=60;
//    
//    n=2;        // ( hex: 1->3 ; curva n<=4)
//    
//    hexagono= n<4? true : false;
//    polygon=false;   //true, false
//    diferenza=0;    //0,1
//    
//    w= n==1? 2.01 : n==2? 3.2 : n==3? 1.21 : 0.8;
//    bordo= diferenza>0? 3 : n==2? 1.6 : w;
//    
//    a= (polygon==true && diferenza==0)? 2*hex*cos(30) : 2*hex*cos(30)-bordo;
//    
//    function f(n)= (n==1)? 8 : (n==2)? 26 : (n==3)? 67 : 1  ;
//    
//    d= hexagono==true? a/(f(n)*sin(60)) : 4*w;
//      
//    xc= (n==1)? -d*2 : (n==2)? -d*6.5 : (n==3)? -d*18.5 : 0;
//    yc= (n==1)? d*2*cos(30) :(n==2)? d*cos(30)*3 : (n==3)? d*cos(30)*1 : 0 ;
//
//    rot= (n==3)? 30 : 0;
//    
//    rounded = true;
//    lina= 0;


  
    
/**** 24- Gosper hex ****/  

//    axiom="X";
//    rules=["X=-F++F-X-F--F+Y---F--F+Y+F++F-X+++F++F-X-F++F-X+++F--F+Y--", "Y=+F++F-X-F--F+Y+F--F+Y---F--F+Y---F++F-X+++F++F-X+++F--F+Y", "F=" ];
//    angle=30;
//    
//    n=2;    // (hexagon:1->3); curve: n=4 )
//    
//    hexagono= n<4? true : false;
//    polygon= false;
//    diferenza= 0;      
//    
//    w= (n<3)? 2.01 : 1.6;
//    bordo= w ;
//    
//    function f(n)= (n==1)? 5 : (n==2)? 16 : (n==3)? 38 : 1  ;
//    
//    d= hexagono==true? (2*hex*cos(30)-bordo)/(f(n)*sin(60)) : 3*w;
//      
//    xc= (n==1)? -d*5/2*cos(30) : (n==2)? -d*6/2*cos(30) : (n==3)? 2*d*cos(30) : 0;
//    yc= (n==1)? d*2*cos(30) :(n==2)? 6.5*d : (n==3)? 38/2*d : 0 ;
//
//    rot=  30;
//    
//    rounded = true;
//    lina= 0;


    
/**** 25- Quadratic Gosper ****/ 

//    axiom="XF";
//    rules=["X=XFX-YF-YF+FX+FX-YF-YFFX+YF+FXFXYF-FX+YF+FXFX+YF-FXYF-YF-FX+FX+YFYF-", "Y=+FXFX-YF-YF+FX+FXYF+FX-YFYF-FX-YF+FXYFYF-FX-YFFX+FX+YF-YF-FX+FX+YFY" ];
//    angle=90;
//    
//    n=2;        // (hexagon:1->2); curve: n=4 )
//    
//    hexagono= n<=2? true : false;
//    polygon= false;    
//    diferenza= 1;  //0,1
//    
//    w= n==1? 2.01 : n==2? diferenza>0? 0.8 : 1.6 : 0.8;
//    bordo= diferenza>0? 4 : w;
//    
//    a= hex*cos(30)-bordo/2/cos(45);
//    b= hex-bordo/2/cos(30)/cos(45);
//      
//    d= hexagono==true? 
//    (n==1)? a/(5/2/cos(45)) : 
//    (n==2)? a/(25/2/cos(45)) :
//    3*w :
//    3*w;
//      
//    xc= (n==1)? -2*d : (n==2)? -12*d : 0;
//    yc=-xc ;
//
//    rot= 45;
//    
//    rounded = false;  
//    lina= 0;
    
    
  
/**** 26- Gosper variation ****/   

//    axiom="X";
//    rules=["X=FX+YF++YF-FX--FXFX-YF+","Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ];
//    angle=60;
//    
//    n=3;        // (hexagon:1->3); curve:n<=5)
//    
//    hexagono= n<4? true : false;
//    polygon= false;
//    diferenza=0;
//    
//    w= n<3? 2.01  : 1.6;
//    bordo= w;
//    
//    function f(n)= (n==1)? 1.5 : (n==2)? 5 : (n==3)? 17 : (n==4)? 48 : 1  ;
//    
//    d= n<=3? (hex*cos(30)-bordo/2)/(f(n)*cos(30)) : 3*w;
//      
//    xc= (n==1)? -d : (n==2)? -d*2.5 : (n==3)? -d*3.5 : 0;
//    yc= (n==1)? -d*cos(30) : (n<=3)? -d*cos(30)*f(n) :0;
//
//    rot=0;
//       
//    rounded = true;
//    lina= 0;

    
 
/**** 26a- Gosper variation tree ****/   

//    axiom="X--X--X";
//    rules=["X=FX+YF++YF-FX--FXFX-YF+","Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ];
//    angle=60;
//    
//    n=3;        // (hexagon:1->3); curve:n<=4)
//    
//    hexagono= n<4? true : false;
//    polygon= true;
//    diferenza= 1;
//    
//    w= 
//    (n==1)? 2.01 : (n==2)? 1.6 : (n==3)? 1.21 : 1.21 ;
//    bordo= diferenza>0? 3*w : polygon==true? 1.6 : w;
//    
//    a= (polygon==true && diferenza==0)? hex*cos(30) : hex*cos(30)-bordo/2;
//    
//    d= hexagono==true? 
//    (n==1)? a/(2/cos(30)) :
//    (n==2)? a/(31/4/cos(30)) :
//    (n==3)? a/(102/4/cos(30)) :
//    3*w: 
//    3*w;
//      
//    xc= 
//    (n==1)? -d*3/2 : 
//    (n==2)? -d*11/2 : 
//    (n==3)? -d*30/2 : 
//    0;
//    
//    yc= 
//    (n==1)? d*cos(30)*1/3 :
//    (n==2)? -d*cos(30)*1/3 : 
//    (n==3)? -d*cos(30)*18/3 : 
//    0 ;
//
//    rot= 0;
//
//    rounded = true; 
//    lina= 0;
    
    
/**** 27- Levy_c curve ****/           

//    axiom="F";
//    rules=["F=+F--F+"];
//    angle=45;
//    
//    n=7;        // (hexagon: 1->9 ; curve: n<=14)
//    
//    hexagono= (n<=9)? true : false;
//    polygon= false;
//    diferenza= 0;
//    
//    w= (n<7)? 2.01 : (n<9)? 1.6 : 1.2;
//    bordo=  w ;
//    
//    b= hex-bordo/2/cos(30)/cos(45);
//    
//    function f1(n)= (n==1 || n==2)? 1 : f1(n-2)*2+1; echo("f1=", f1(n));
//    function f2(n)= (n<=4)? 0 : f2(n-2)+1; echo("f2=", f2(n));
//     
//    d=  hexagono==true?
//    (n==1)? b/(1+1/2/tan(60))/cos(45): 
//    (n==2)? b/(1*cos(45)+1/tan(60)):
//    (n==3)? b/(3*cos(45)):
//    (n%2)==0? b/(f1(n)+ pow(2,f2(n-1))/tan(60)):
//    b/(f1(n)+ f1(n-4)/tan(60))/cos(45) :
//    3*w;
//    
//    function g(n)= (n%2)==0? pow(2,(n-2)/2) : pow(2,(n-1)/2)*cos(45);
//    
//    xc= -d*g(n);   
//    yc= xc*1/2;
//
//    rot= 0;   
//    
//    rounded = true; 
//    lina= 0;
  

  
/**** 28- Koch curve ****/           

//    axiom="F";
//    rules=["F=F+F--F+F"];
//    angle=60;
//    
//    n=3;        // (hexagon: 1->3 ; curve: n<=14)
//    
//    hexagono= (n<4)? true : false;
//    polygon= false;    
//    diferenza= 0;
//    
//    w= (n<3)? 2.01 : (n==3)? 1.6 : 0.8;
//    bordo=  w ;
//    
//    b= hex-bordo/2/cos(30);
//     
//    d= (hexagono==true)? b/(1.5*pow(3,(n-1))) : 3*w;
//      
//    xc= - d*pow(3,n)/2  ;   
//    yc= 0 ;
//
//    rot= 0;  
//    
//    rounded = true; 
//    lina= 0;

 
    
/**** 29- Koch snowflake ****/           

//    axiom="F--F--F";
//    rules=["F=F+F--F+F"];
//    angle=60;
//    
//    n=3;        // (hexagon: 1->4 ; curve: n<=8)
//    
//    hexagono= (n<=4)? true : false;
//    polygon= true;  // true, false
//    diferenza= 1;  // 0,1
//    
//    w= (n<3)? 1.6 : (n==3)? 1.21 : 0.4;
//    bordo= diferenza>0? 4 : w;
//    
//    rot= 30;     // 0, 30
//        
//    a= hex-bordo/2/cos(30);
//     
//    d= (hexagono==true)? 
//    (rot==0)? a/(2*pow(3,(n-1))) : a/(2*pow(3,(n-1)))/cos(30)  
//    : 3*w ;
//      
//    xc= - d*pow(3,n)/2  ;
//    yc= d*cos(30)*pow(3,n)/3 ;
//      
//    rounded = true; 
//    lina= 0;
    


/**** 30- Koch snowflake inverted ****/          

//    axiom="F+F+F+F+F+F";
//    rules=["F=F+F--F+F"];
//    angle=60;
//    
//    n=2;        // (hexagon: 1->4 ; curve: n<=8)
//    
//    hexagono= (n<=4)? true : false;
//    polygon= false;    
//    diferenza= 0;
//    
//    w= (n<3)? 1.6 : (n==3)? 1.21 : 0.4;
//    bordo= diferenza>0? 4 : w;
//    
//    rot= 0;     // 0, 30
//        
//    a= hex-bordo/2/cos(30);
//     
//    d= (rot==0)? a/pow(3,n) : a/(4*pow(3,(n-1)))/cos(30)  ;
//      
//    xc= -d*pow(3,n)/2  ;
//    yc= -d*cos(30)*pow(3,n) ;
//      
//    rounded = true;
//    lina= 0; 
    


/**** 31- Koch snowflake variant ****/          

//    axiom="F--F--F--F--F--F";
//    rules=["F=-F++F--F+"];
//    angle=30;
//    
//    n=3;        // (hexagon: 1->3 ; curve: n<=8)
//    
//    hexagono= (n<4)? true : false;
//    polygon= true;
//    diferenza= 1;
//    
//    w= (n<3)? 1.6 : (n==3)? 1.21 : 0.4;
//    bordo= diferenza>0? 4 : w;
//    
//    rot= (n==2)? 0 : 30;     // 0, 30
//        
//    a= (hex-bordo/2/cos(30))*cos(30) ;
//     
//    d= 
//    (rot==0)? 
//    (n==1)? a/2.5 : 
//    (n==2)? a/8/cos(30): 
//    (n==3)? a/19 : 
//    4*w :
//    (n==1)? a/3/cos(30) : 
//    (n==2)? a/7: 
//    (n==3)? a/21/cos(30) : 
//    4*w  ;
//      
//    xc= 
//    (n==1)? -d*cos(30) : 
//    (n==2)? -d : 
//    (n==3)? d*cos(30) :
//    0 ;
//    yc= 
//    (n==1)? d*2.5 : 
//    (n==2)? d*cos(30)*8 :
//    (n==3)? d*18.5 : 
//    0 ;
//      
//    rounded = true; 
//    lina= 0;



/**** 32- Reflected Koch ****/           

//    axiom="X";
//    rules=["X=XF+YF--XF-XF--XF--YFXF", "Y=XFYF++YF++YF+YF++XF-YF", "F="];
//    angle=60;
//    
//    n=3;        // (hexagon: 1->3 ; curve: n<=14)
//    
//    hexagono= (n<4)? true : false;
//    polygon= false;    
//    diferenza= 0;
//    
//    w= (n<3)? 2.01 : (n==3)? 1.21 : 0.8;
//    bordo=  w ;
//    
//    b=hex-bordo/2/cos(30);
//     
//    d= (hexagono==true)? b/(1.5*pow(3,(n-1))) : 3*w;
//      
//    xc= - d*pow(3,n)/2  ;   
//    yc= 0 ;
//
//    rot= 0;
//    
//    rounded = true; 
//    lina= 0;



/**** 33- Sierpinski triangle ****/

//    axiom="X";
//    rules=["X=++FX++FX++FX", "F=FF"];
//    angle=60;
//    
//    n=5;        // (hexagon: 1->5 ; curve: n<=11)
//    
//    hexagono= (n<6)? true : false;
//    polygon= false;    
//    diferenza= 0;   // 0,2  (2 só n impar)
//    
//    w= diferenza==2? n==5? 0.8 : 1.21 : (n<=3)? 2.01 : (n==4)? 1.6 : 1.21;
//    bordo=  w ;
//     
//    d= (hexagono==true)? (hex-bordo/2/cos(30))*(3/2)/pow(2,(n-1)) : 5*w;
//         
//    xc= d*pow(2,(n-2)) ;
//    yc= -d*cos(30)*1/3*pow(2,(n-1));
//
//    rot= 0;
//    
//    rounded = true; 
//    lina= 0;



/**** 34- Sierpinski hexagon ****/

//    axiom="Y-Y-Y-Y-Y-Y";
//    rules=["X=--FXF++FXF++FXF--", "Y=FXF--FF--FF", "F=FF"];
//    angle=60;
//    
//    n=4;        // (hexagon: 1->5 ; curve: n<=11)
//    
//    hexagono= (n<6)? true : false;
//    polygon= false;    
//    diferenza= 2;   // 0, 2
//    
//    w= (n<3)? 2.01 : (n==3)? 1.6 : (n==4)? 0.8 : diferenza==2? 0.4 : 0.8;
//    bordo=  w ;
//     
//    d= (hexagono==true)? (hex-bordo/2/cos(30))/pow(2,n) : 3*w ;
//         
//    xc= 0  ;
//    yc= 0 ;
//    rot= 0;
//        
//    rounded = true; 
//    lina= 0;


    
    
/**** 35- Sierpinski arrowhead ****/    // ( Not hexagon)

//    axiom="X";
//    rules=["X=YF+XF+YF","Y=XF-YF-XF", "F="];
//    angle=60;
//    
//    n=5;        // (n<=11)
//    
//    hexagono= false;
//    polygon= false;    
//    diferenza= 0;
//    
//    w=1.2;
//    bordo=  w ;
//     
//    d= 2*w;
//         
//    xc=0;
//    yc=0;
//    
//    rot= (n%2==0)? 180 : 120;
//    
//    rounded = true; 
//    lina= 0;



/**** 36- Sierpinski arrowhead hexagon ****/ 


//    n=5;        // (hex: 1->6 ; curve n<=8)
//    
//    axiom = (n%2)==0 ? "FYFF+FYFF+FYFF+FYFF+FYFF+FYFF" : "YF-YF+YF-YF+YF-YF";
//    rules=["X=YF+XF+Y","Y=XF-YF-X"];
//    angle=60;
//    
//    hexagono= n<=6? true : false;
//    polygon= false;  // true, false (n impar -> false)
//    diferenza= 0;   //0,1
//
//    
//    w= (n==1)? 2.01 :(n==2)? 2.01 : (n==3)? 1.6 :  (n==4)? 1.6 : 0.8;
//    bordo= (n==6 && polygon==true)? 1.6 : w ;
//    
//    a= hex-bordo/2/cos(30);
//     
//    d= (n<=6)? (n%2)==1? a/pow(2,n) : a/(pow(2,n)+2) : 3*w;
//         
//    xc= (n%2)==1 ? 0 : -d*(pow(2,n)/2+1);
//    yc= (n%2)==1 ? 0 : -d*(pow(2,n)+2)*cos(30);
//    
//    rot= 0;
//    
//    rounded = true; 
//    lina= 0;



/**** 37- Sierpinski arrowhead star ****/ 

//    n=4;        // (n<=8)
//    
//    axiom = (n%2)==0 ? "YF-YF-YF-YF-YF-YF" : "YF+YF+YF+YF+YF+YF";
//    rules=["X=YF+XF+Y","Y=XF-YF-X"];
//    angle=60;
//    
//    hexagono= (n<6)? true : false;    
//    polygon= false;    // true, false
//    diferenza= 0;  //0,1
//    
//    w= (n<3)? 2.01 : (n<5)? 1.6 : (n==5)? 1.21 : 0.8;
//    bordo=  polygon==true? diferenza==0? 1.6 : 2*w : w ;
//     
//    function f(n)= (n==1) ? 3 :  (f(n-1)*2+1)  ;
//    echo(f(n));
//    
//    rot= 30;    // 0, 30
//    
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30);
//    
//    d= (hexagono==true)? 
//    rot==0? b/f(n) : 
//    2*a/(f(n)+pow(2,n)) : 
//    2*w;
//    
//    xc= (n%2)==1 ? d*pow(2,n)/2 : -d*pow(2,n)/2;
//    yc= d*pow(2,n)*cos(30);
//    
//    rounded = true; 
//    lina= 0;
//    
    

/**** 38- Lace ****/    // ( Not hexagon)

//    axiom="X";
//    rules=["X=---W++F++YFW-","Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---"];
//    angle=30;
//    
//    n=6;        // (n<=11)
//    
//    polygon= false;
//    hexagono= false;
//    diferenza= 0;
//    
//    w=1.2;
//    bordo=  w ;
//     
//    d= 3*w;
//         
//    xc=0;
//    yc=0;
//    rot= 0;
//   
//    rounded = true; 
//    lina= 0;



/**** 39- Lace triangle ****/

//    axiom="+X+++F+++Z+++F";
//    rules=["X=---W++F++YFW-","Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---"];
//    angle=30;
//    
//    n=5;        // (n<=7)
//    
//    hexagono= (n<=6)? true : false;
//    polygon= false;      // true, false
//    diferenza= 0;     // 0,1
//    
//    w= (n<5)? 1.6 : (n==5)? 1.21  : 0.8;
//    bordo=  (polygon==true)? diferenza==0? 1.6 : 2.01 : w ;
//    
//    a=hex*cos(30)-bordo/2;
//       
//    d= 
//    (n==1)?  a/(0+1*cos(30)) : 
//    (n==2)?  a/(2+1*cos(30)) :
//    (n==3)?  a/(2+5*cos(30)) :
//    (n==4)?  a/(8+5*cos(30)) :
//    (n==5)?  a/(8+17*cos(30)) :
//    (n==6)?  a/(20+24*cos(30)) :
//    4*w;
//         
//    xc= 
//    (n==1)? -d*1/2 : 
//    (n==2)? -d*(1/2+cos(30)) :
//    (n==3)? -d*(2+cos(30)) :  
//    (n==4)? -d*(2+4*cos(30)) :
//    (n==5)? -d*(13/2+4*cos(30)) :
//    (n==6)? -d*(27/2+5*cos(30)) :
//    0;
//    
//    yc= 
//    (n==1)? -d*(0+1*cos(30)) : 
//    (n==2)? -d*(1/2+1*cos(30)) : 
//    (n==3)? -d*(1/2+2*cos(30)) :
//    (n==4)? -d*(2+2*cos(30)) :
//    (n==5)? -d*(2+5*cos(30)) :
//    (n==6)? -d*(7/2+5*cos(30)) :
//    0;
//
//    rot= 0;
//    
//    rounded = true; 
//    lina= 0;



/**** 40-Square Sierpinski ****/   
 
//    axiom="F+XF+F+XF";
//    rules=["X=XF-F+F-XF+F+XF-F+F-X"];
//    angle=90;
//    
//    n=3;    // hexagon:1->4 ; curve: max 8
//    
//    hexagono= n>4? false : true;
//    polygon= true;    // true, false
//    diferenza=1;     // 0,1
//    
//    w= (n<4)? 1.6 : 1.2;
//    bordo= (diferenza>0)? 3 : w;
//    
//    function f(n)= n==1 || n==0 ? 5 : (f(n-1))*2+3 ;  echo(f(n));
//    
//    a=hex*cos(30)-bordo/2;
//    
//    d= (hexagono==true)? a/f(n)*2 : 2*w;
//    
//    xc= -d/2;
//    yc= -d/2*f(n);
//
//    rot=0;
//
//    rounded = false;
//    lina= 0;



/**** 41-Square Sierpinski 45 ****/   
 
//    axiom="X--F--X--F";
//    rules=["X=+Y-F-Y+", "Y=-X+F+X-"];
//    angle=45;
//    
//    n=9;    // hexagon:1->10 ; curve: max 14
//    
//    hexagono= n>10? false : true;
//    polygon= true;      // true, false
//    diferenza=1;       // 0,1
//    
//    w=  (n<4)? 2.01 : (n<9)? 1.6 : (n==9)? 1.21 :  0.8 ;
//    bordo= (polygon==true && diferenza>0)? 3 :  w;
//    
//    function f(n)= (n==1 || n==2)? 1 : (n==4)? 3 : f(n-2)*2+1 ;
//    echo(f(n));
//    
//    a= 2*hex*cos(30)-bordo;
//    b= 2*hex-bordo/cos(30);
//    
//    d= 
//    (hexagono==true)?
//    ((n%2)==1)? 
//        (n==1)? 2*a/(1+tan(60)): 
//        a/( f(n) + (f(n)-1)*cos(45)):          
//    (n==2)? b/(1+2*cos(45)+tan(30)):
//    a/ ( f(n-1) *(1+2*cos(45)) ) :
//    3*w;
//    
//    xc= 
//    ((n%2)==1)? 
//    (n==1)? -d/2 : 
//    -d*(f(n)/2+f(n-2)*cos(45)):
//    -d*f(n-1)*(1/2+cos(45))
//    ;
//   
//    yc= d/2;
//    rot=0;
//
//    rounded = true;
//    lina= 0;
    
    
/**** 42-Peano curve - root9 ****/   
 
//    axiom="F";
//    rules=["F=F+F-F-F-F+F+F+F-F"];
//    angle=90;
//    
//    n=2;    // hexagon:1->3 ; curve: max 5
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=0;
//    
//    w= (n<=2)? 1.6 : n==3? 1.21 : 0.8;
//    bordo= w;
//    
//    a=(hex*cos(30)-bordo/2); 
//    b=(hex-bordo/cos(30));  
//    
//    d= 
//    (n==1)? b/1.5 : 
//    (n==2)? a/4 : 
//    (n==3)? a/13 :
//    4*w;
//    
//    xc= -pow(3,n)/2*d;
//    yc=0;
//
//    rot=0;
//
//    rounded = false;    
//    lina= (hex-bordo/2/cos(30))*(1-cos(30));
    
    

/**** 43-Peano round corners ****/   
 
//    axiom="X";
//    rules=["X=FX+FY+FX-FY-FX-FY-FX-FY-FX+FY+FX+FY+FX+FY+FX-FY-FX", "Y=FY", "F="];
//    angle=45;
//    
//    n=3;    // hexagon:1->3 ; curve: max 5
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=1;   //0,1
//    
//    w= 
//    diferenza>0? (n<=2)? 1.21 : 0.8 : 
//    (n<=2)? 1.6 : n==3? 1.21 : 0.8;
//    
//    bordo= diferenza>0? 4 : w;
//    
//    a=(hex*cos(30)-bordo/2); 
//    b=(2*hex-2*bordo/cos(30));  
//    
//    d= hexagono==true? (n==1)? b/(3+4*cos(45)) :
//    a/( (pow(3,n)-1)/2 + (pow(3,n)-1)*cos(45)) :
//    3*w ;
//
//    xc= -d*(pow(3,n)/2+(pow(3,n)-1)*cos(45));
//    yc=0;
//
//    rot=0;
//
//    rounded = true;   
//    lina= (hex-bordo/2/cos(30))*(1-cos(30));


/**** 44-krishna ****/   
 
//    axiom="-X--X";
//    rules=["X=XFX--XFX"];
//    angle=45;
//    
//    n=4;    // hexagon:1->4 ; curve: max 8
//    
//    hexagono= n>4? false : true;
//    polygon= false; 
//    diferenza=0;
//    
//    w= (n<=2)? 2.01 : 1.6;
//    bordo= w;
//        
//    d= (hexagono==true)? (hex*cos(30)-bordo/2)/cos(45)/(pow(2,n)-1) :
//    3*w ;
//
//    xc= 0;
//    yc= (pow(2,n)-1)*d*cos(45)  ;
//
//    rot=0;
//
//    rounded = true;
//    lina=0;   
    
    
    
/**** 45-carpet3 ****/   
 
//    axiom="F--F";
//    rules=["F=F+F-F-F-F++FF"];
//    angle=90;
//    
//    n=3;    // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=0;
//    
//    w= (n<=2)? 2.01 : 1.6;  
//    bordo= w;
//    
//    a=(hex*cos(30)-bordo/2); 
//    b=(2*hex-2*bordo/cos(30));  
//    
//    d= hexagono==true? (n==1)? b/(3) :
//    a/( (pow(3,n)-1)/2) :
//    3*w ;
//    
//    xc= -pow(3,n)/2*d ;
//    yc= 0  ;
//
//    rot=0;
//
//    rounded = true;  
//    lina= (hex-bordo/2/cos(30))*(1-cos(30)); 
    


/**** 46-carpet5 ****/   
 
//    axiom="-L";
//    rules=["L=LF+RFR+FL-F-LFLFL-FRFR+", "R=-LFLF+RFRFR+F+RF-LFL-FR", "F=F"];
//    angle=90;
//    
//    n=3;    // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=1;       // 0,1
//    
//    w= (diferenza>0)? (n<=2)? 1.21 : 0.8 : (n<=2)? 2.01 : 1.6;
//    bordo= (diferenza>0)? 3 : w;
//    
//    a=(hex*cos(30)-bordo/2/cos(45));   
//    
//    function f(n)= (n==1)? 1 : f(n-1)*3+1; echo(f(n)); 
//    
//    d= (hexagono==true)? a/(2*f(n)*cos(45)) : 3*w ;
//
//    xc= -d*f(n);
//    yc= -xc  ;
//
//    rot=45;
//
//    rounded = true; 
//    
//    lina= (hex-bordo/2/cos(30))*(1-cos(30));



/**** 47-Pentaplexity ****/   

//    axiom="F++F++F++F++F";
//    rules=["F=F++F++F+++++F-F++F"];
//    angle=36;
//    
//    n=2;        // hexagon:1->3 ; curve: max 5
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=2;
//    
//    w= (n==1)? 2.01 : (n==2)? 1.21 : 0.8;    
//    bordo= w;
//    
//    a=2*hex-bordo/cos(30) ;
//        
//    d= 
//    (n==1)? a/5.2 :
//    (n==2)? a/13.5 :
//    (n==3)? a/34.5 :
//    5*w ;
//
//    xc= 
//    (n==1)? -d*(1+cos(72)) :
//    (n==2)? -d*(5/2+3*cos(72)) :
//    (n==3)? -d*(13/2+8*cos(72)) :
//    0;
//    yc= 
//    (n==1)? -d*(1+sin(72)) :
//    (n==2)? -d*(4+sin(72)) :
//    (n==3)? -d*(12+sin(72)) :
//    0;
//
//    rot=0;
//
//    rounded = true;   
//    lina=0;


/**** 48-pentadendrite ****/   //(not hexagon)

 
//    axiom="F-F-F-F-F";
//    rules=["F=F-F-F++F+F-F"];
//    angle=72;
//    
//    n=3;    // curve: max 5
//    
//    hexagono= false ;
//    polygon= false; 
//    diferenza=0;
//    
//    w= 1.2;    
//    bordo= w;
//        
//    d= 5*w ;
//
//    xc= 0;
//    yc= 0;
//
//    rot=0;
//
//    rounded = true;   
//    lina=0;
    
    


/**** 49-McWorter's Pentigree ****/   //(not hexagon)

 
//    axiom="F++F++F++F++F";
//    rules=["F=+F++F----F--F++F++F-"];
//    angle=36;
//    
//    n=2;    // curve: max 5
//    
//    hexagono= false ;
//    polygon= false; 
//    diferenza=0;
//    
//    w= 1.2;
//    
//    bordo= w;
//        
//    d= 5*w ;
//
//    xc= 0;
//    yc= 0;
//
//    rot=0;
//
//    rounded = true;   
//    lina=0;



/**** 50-Penrose ****/  


//    axiom="[7]++[7]++[7]++[7]++[7]";
//    rules=["6=81++91----71[-81----61]++", 
//    "7=+81--91[---61--71]+", 
//    "8=-61++71[+++81++91]-", 
//    "9=--81++++61[+91++++71]--71", 
//    "1="];
//    angle=36;
//
//
//    n=3;        // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>5? false : true;
//    polygon= false; 
//    diferenza=0;
//    
//    w= (n==1)? 2.01 : (n<=3)? 1.6 : (n==4)? 1.21 :  0.8;    
//    bordo= w;
//    
//    a=(hex*cos(30)-bordo/2);
//        
//    d= 
//    (n==1)? a/(2*cos(36)) :
//    (n==2)? a/(1+2*cos(36)) :
//    (n==3)? a/(2+2*cos(36)+2*sin(18)) :
//    (n==4)? a/(2+4*cos(36)+2*sin(18)) :
//    (n==5)? a/(4+5*cos(36)+2*sin(18)) :
//    5*w ;
//
//    xc= 0;
//    yc= 0;
//
//    rot=18;
//
//    rounded = true;   
//    lina=0;



/**** 51-A bush ****/   
 
//    axiom="F-F-F-F";
//    rules=["F=F-F+F+F-F"];
//    angle=90;
//    
//    n=2;    // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=0;    //0,2
//    
//    w= diferenza==2? 0.4 : (n<=2)? 2.01 : 1.2;
//    bordo= diferenza==2? 2.01 : w;
//    
//    rot=0;     // 0, 45
//    
//    a=2*(hex*cos(30)-bordo/2); 
//    b=(2*hex-2*bordo/cos(30));  
//    
//    d= hexagono==true? 
//    (rot==0)? b/pow(3,n)/(1+1/tan(60)) :
//    (rot==45)? a/pow(3,n)*cos(45) :
//    3*w :
//    3*w ;
//  
//    xc= -pow(3,n)/2*d ;
//    yc= -xc  ;
//    
//    rounded = true;  
//    lina=0;



/**** 52-X-border - Joined Cross Curves ****/  

//    axiom="Z+Z+Z+Z";
//    rules=["F=","X=FX+FX+FXFY-FY-","Y=+FX+FXFY-FY-FY","Z=XYXYXYX"];
//    angle=90;
//    
//    n=3;    // hexagon:2->3 ; curve: max 6
//    
//    hexagono= n>3? false : true;
//    polygon= true;  //true, false
//    diferenza=1;    // 0,1
//    
//    w= (n<3)? 1.6 : 1.2;
//    bordo= diferenza>0? 3 : w;
//    
//    rot= (n==4)? 45 :0;     
//    
//    a= polygon==true && diferenza==0? hex*cos(30) : (hex*cos(30)-bordo/2);
//    b= polygon==true && diferenza==0? hex : (hex-bordo/2/cos(30));
//    
//    d= hexagono==true? 
//    (n==2)? b/(11.5+3.5/tan(60)) :
//    (n==3)? a/27.5 :
//    3*w :
//    3*w ;
//  
//    xc= 
//    (n==2)? d*10.5 :
//    (n==3)? -d*3.5 :
//    (n==4)? -d*45.5 :
//    0;
//    yc= 
//    (n==2)? -d*3.5 :
//    (n==3)? d*24.5 :
//    (n==4)? -d*31.5 :
//    0;
//
//    rounded = false;  
//    lina=0;


/**** 52a-X-border2 - Joined Cross Curves ****/   
 
//    axiom="Z+Z+Z+Z";
//    rules=["F=","X=FX+FX+FXFY-FY-","Y=+FX+FXFY-FY-FY","Z=XYX"];
//    angle=90;
//    
//    n=4;    // hexagon:2->4 ; curve: max 6
//    
//    hexagono= n>4? false : true;
//    polygon= false;     //true, false
//    diferenza=0;        // 0,1
//    
//    w= (n<=3)? 1.6 : 1.21;
//    bordo= diferenza>0? 3 : w;
//    
//    rot= (n==4)? 45 : 0;     
//    
//    a= polygon==true && diferenza==0? 2*hex*cos(30) : 2*(hex*cos(30)-bordo/2);
//    
//    d= hexagono==true? 
//    (n==2)? a/11 :
//    (n==3)? a/27 :
//    (n==4)? a/45*cos(45) :
//    3*w :
//    3*w ;
//  
//    xc= 
//    (n==2)? d*9/2 :
//    (n==3)? -d*3/2 :
//    (n==4)? -d*39/2 :
//    0;
//    yc= 
//    (n==2)? -d*3/2 :
//    (n==3)? d*21/2 :
//    (n==4)? -d*27/2 :
//    0;
//
//    rounded = false;  
//    lina=0;



/**** 53-Moore ****/   //(not hexagon)

 
//    axiom="X";
//    rules=["F=", "X=FX+FX+FXFYFX+FXFY-FY-FY-", "Y=+FX+FX+FXFY-FYFXFY-FY-FY"];
//    angle=90;
//    
//    n=3;    // curve: max 5
//    
//    hexagono= false ;
//    polygon= false; 
//    diferenza=0;
//    
//    w= 1.2;
//    bordo= w;
//        
//    d= 5*w ;
//
//    xc= 0;
//    yc= 0;
//
//    rot=0;
//
//    rounded = true;   
//    lina=0;



/**** 54-Moore square ****/   //(not hexagon)

 
//    axiom="Y-Y-Y-Y";
//    rules=["F=", "X=FX+FX+FXFYFX+FXFY-FY-FY-", "Y=+FX+FX+FXFY-FYFXFY-FY-FY"];
//    angle=90;
//
//    n=2;    // curve: max 5
//    
//    hexagono= false ;
//    polygon= false; 
//    diferenza=0;
//    
//    w= 1.2;
//    bordo= w;
//        
//    d= 5*w ;
//
//    xc= 0;
//    yc= 0;
//
//    rot=0;
//
//    rounded = true;   
//    lina=0;
    
    


/**** 55-Pajarita ****/   

 
//    axiom="X++X++X";
//    rules=["F=", "X=F-F-F+F+FX++F-F-F+F+FX--F-F-F+F+FX"];
//    angle=60;
//    
//    n=2;      // hexagon:1->4 ; curve: max 6
//    
//    hexagono= n>4? false : true;
//    polygon= false; 
//    diferenza=0;       // 0, 2
//    
//    w= (diferenza==2)? 0.4 : (n<3)? 1.6 : 1.21 ;
//    bordo= diferenza>0? 3 : w;
//    
//    a=(hex-bordo/2/cos(30));
//        
//    d= (hexagono==true)? (n==1)? a/4 : a/(pow(n+1,2)-1):
//    4*w; 
//    
//    function f(n)= (n==1)? 1 : (n==2)? 5 : f(n-1)+(n-1)+(n+2) ;
//
//    xc= 
//    n==1 ? -7/2*d : 
//    n==2 ? -9/2*d : 
//    n==3 ? -3*d : 
//    9/2*d ;
//    
//    yc= -f(n)*d*cos(30);
//
//    rot=0;
//
//    rounded = true;   
//    lina=0;




/**** 56-estrela4puntas ****/   
 
//    axiom="F++++F";
//    rules=["F=F+F+F++++F+F+F"];
//    angle=45;
//    
//    n=3;    // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>4? false : true;
//    polygon= false; 
//    diferenza=0;
//    
//    w= (n<=2)? 1.6 : (n==3)? 1.21 : 0.8;
//    bordo= w;
//    
//    rot=0;     // 0, 45
//    
//    a=(hex*cos(30)-bordo/2); 
//    b=(hex-bordo/2/cos(30)/cos(45)); 
//   
//    function f(n)= 
//    (n==1)? (1+cos(45)) : 
//    (n==2)? (3+4*cos(45)) : 
//    (n==3)? (10+14*cos(45)) : 
//    (n==4)? (39+41*cos(45)) : 
//    1;
//    function g(n)= 
//    (n==1)? (1/2+cos(45))*(1+1/tan(60)) : 
//    (n==2)? (2+3*cos(45))*(1+1/tan(60)) : 
//    (n==3)? (7+10*cos(45))*(1+1/tan(60)) : 
//    (n==4)? (24+34*cos(45))*(1+1/tan(60)) : 
//    1;
//    
//    d= (hexagono==true)? (rot==0)? a/f(n) : b/g(n) : 3*w ;
//  
//    xc= (hexagono==true)? -d*f(n):0;
//    yc= 0  ;
//    
//    rounded = true;  
//    lina= (rot==0)? (hex-bordo/2/cos(30))*(1-cos(30)) : 0;




/**** 57-Cross2 ****/   
 
//    axiom="F+F+F+F";
//    rules=["F=F+F-F+F+F"];
//    angle=90;
//    
//    n=3;    // hexagon:1->4 ; curve: max 6
//    
//    hexagono= n>4? false : true;
//    polygon= false; 
//    diferenza=0;   // 0, 2
//    
//    w= (diferenza==2)? 0.8 : (n<=3)? 1.6 : 0.8;
//    bordo=  (diferenza==2)? 2.01 : w;
//    
//    rot= 0;    
//   
//    a=(hex*cos(30)-bordo/2); 
//    b=(hex-bordo/2/cos(30)/cos(45)); 
// 
//    d= (hexagono==true)? 
//    (n==1)? b/(3/2+1/2/tan(60)) :
//    (n==2)? b/(7/2+3/2/tan(60) ): 
//    (n==3)? a/(17/2): 
//    (n==4)? b/(37/2+13/2/tan(60) ): 
//    3*w :
//    3*w ;
//    
//    function g1(n)= (n==1)? 3 : (n==2)? 5 : g1(n-2)*5 ;  
//    function g2(n)= (n==1)? 1 : (n==2)? 5 : g2(n-2)*5 ; 
//    
//    xc=  -d*g1(n)/2;   
//    yc=  -d*g2(n)/2;
//
//    rounded = false;  
//    lina= 0;
    
    
    
/**** 58-Cross3 ****/   
 
//    axiom="F-F-F-F";
//    rules=["F=FF-F-F-F-F-F+F"];
//    angle=90;
//    
//    n=2;    // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=0;  
//    
//    rot= 45;     // 0, 45
//    
//    w= (n==1)? 2.01 : (n==2)? 1.6 : 1.2;
//    bordo= diferenza>0? 2.01 : w;
//    
//    b=(hex-bordo/2/cos(45));
//   
//    d= (hexagono==true)? 
//    (rot==0)? 
//    (n==1)? b/(2+1/tan(60)):  
//    (n==2)? b/(6+4/tan(60)): 
//    (n==3)? b/(21+9/tan(60)): 
//    3*w :
//    (n==1)? b/cos(45)/(3+1/tan(60)): 
//    (n==2)? b/cos(45)/(8+6/tan(60)):  
//    (n==3)? b/cos(45)/(28+16/tan(60)):   
//    3*w : 3*w ;
//    
//    function g1(n)= (n==1)? 1 : (n==2)? 1 : (n==3)? -4 : 0 ;  
//    function g2(n)= (n==1)? 2 : (n==2)? 7 : (n==3)? 22 : 0 ; 
//    
//    xc=  -d*g1(n);   
//    yc=  d*g2(n);
//
//    rounded = false;  
//    lina= 0;



/**** 59-Mango Leaf ****/   
 
//    axiom="Y+++Y";
//    rules=["X={F-F}{F-F}--[--X]{F-F}{F-F}--{F-F}{F-F}--", "Y=F-F+X+F-FY"];
//    angle=60;
//    
//    n=4;    // hexagon:1->4 ; curve: max 6
//    
//    hexagono= n>8? false : true;
//    polygon= false; 
//    diferenza=2;  // 0,2
//    
//    w= diferenza==2? 0.4 :(n<5)? 1.6 : (n<7)? 1.21 : 0.8;
//    bordo= diferenza>0? 2.01 : w;
//    
//    rot= 90;  // 0,90
//    
//    a=(hex*cos(30)-bordo/2); 
//    b=hex-bordo/2/cos(30);
//   
//    function f1(n)= (n==1)?3 : (n==2)?8 : (n==3)?14 : f1(n-2)+12 ; echo(f1(n));
// 
//    d= (hexagono==true)? 
//    (rot==90)? b/cos(30)/f1(n)*2 :
//    b*2/f1(n) : 
//    4*w ;
//    
//    function f2(n)= (n==1)?3/2 : (n==2)?3 : f2(n-2)+3 ;
//
//    xc=  -d*f2(n);   
//    yc=  0;
//
//    rounded = true; 
//   
//    function f3(n)= (n==1)?0 : (n==2)?7 : (n%2==1)? f3(n-1)+4 : f3(n-1)+5 ;
//    
//    lina= (rot==0)? b*2-f3(n)*d : 0 ;



/**** 60-Maple-root9 ****/   
 
//    axiom="F";
//    rules=["F=F--F++F++FF--F--F++FF"];
//    angle=60;
//    
//    n=3;    // hexagon:1->3 ; curve: max 6
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=0;  
//    
//    w= (n<=2)? 1.6 : 1.21 ;
//    bordo= diferenza>0? 2.01 : w;
//    
//    rot= 0;     
//    
//    b=hex-bordo/2/cos(30);
//   
//    d= (hexagono==true)? b/(pow(3,n)/2) : 4*w ;
//    
//    xc= -d*pow(3,n)/2;
//    yc= 0 ;
//
//    rounded = true; 
//    lina= 0 ;    
    

    
/**** 61-Maple2-root9 ****/   
 
//    axiom="F+F+F+F+F+F";
//    rules=["F=F--F++F++FF--F--F++FF--F++F++FF--F--F++F"];
//    angle=60;
//    
//    n=2;    // hexagon:1->2 ; curve: max 6
//    
//    hexagono= n>2? false : true;
//    polygon= false; 
//    diferenza=0;  
//    
//    w= diferenza==2? 0.4 :(n<2)? 1.6 : 0.8 ;
//    bordo= diferenza>0? 2.01 : w;
//    
//    rot= 0;     
//    
//    b=hex-bordo/2/cos(30);
//   
//    d= (hexagono==true)? b/( pow(pow(2,n),(n))+pow(2,n)+1)  : 4*w ;
//    
//    xc=-pow(2,n)*pow(2,n)/2*d;
//    yc=- pow(2,n)*pow(2,n)*d*cos(30);
//
//    rounded = true; 
//    lina= 0 ; 


  


/**** 62-triangulos4-rosas ****/   

 
//    axiom="X";
//    rules=["X=+FX+FX+FX+FX+FX+FX+", "F=FF"];
//    angle=60;
//    
//    n=4;    // hexagon:1->5 ; curve: max 6 (n=6 -> 6 min)
//    
//    hexagono= n>5? false : true;
//    polygon= false; 
//    diferenza=0;  
//    
//    w= (n<4)? 2.01 : (n==4)? 1.6 : 1.21 ;
//    bordo= w;
//    
//    rot= 0;     
//    
//    b=hex-bordo/2/cos(30);
//   
//    function f(n)= (n==1)? 1 :  (f(n-1)*2+1) ;
//    
//    d= (hexagono==true)? (n==1)? b: 2*b/(f(n)+1/3)  : 4*w;
//    
//    xc=(n==1)? d/2 : 0;
//    yc= (n==1)? -d*cos(30) : -pow(2,n-1)*d*sin(60)*2/3 ;
//
//    rounded = true; 
//    lina= 0 ; 


    
/**** 63-hexagonos1 ****/   

 
//    axiom="X";
//    rules=["X=+XF+XF+XF+XF+XF+XF", "F=FF"];
//    angle=60;
//    
//    n=4;    // hexagon:1->4 ; curve: max 6 
//    
//    hexagono= n>4? false : true;
//    polygon= false; 
//    diferenza=0;  
//    
//    w= (n<3)? 2.01 : (n==3)? 1.21 : 0.8 ;
//    bordo= w;
//    
//    rot= 30;    // 0,30
//    
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30);
//   
//    function f(n)= (n==1) ? 1 :  (f(n-1)*2+1) ; echo(f(n));
//    function g(n)= (n==1) ? 1 : (n==2) ? 5 : (g(n-1)*2+1) ; echo(g(n));
//    
//    d= hexagono==true? rot==30? a/g(n)*2 : b/f(n) : 4*w ;
//    
//    xc= d/2*pow(2,n-1);
//    yc= -d*cos(30)*pow(2,n-1);
//
//    rounded = true; 
//    lina= 0 ; 
    

    
/**** 64-hexagonos2-estrelas ****/   

 
//    axiom="X";
//    rules=["X=+FX+FX+FX+FX+FX+FX", "F=FFF"];
//    angle=60;
//    
//    n=3;    // hexagon:1->4 ; curve: max 6 
//    
//    hexagono= (n<=4)? true : false;
//    polygon= false; 
//    diferenza=0;  // 0, 2
//    
//    w= (n<=2)? 1.6 : (n==3)? 1.21 : 0.8 ;
//    bordo= w;
//    
//    rot= 0;    
//    
//    a=hex-bordo/2/cos(30);
//    
//    d= hexagono==true? a/pow(3,(n-1)) : 3*w;
//    
//    xc= d*pow(3,(n-1))/2;
//    yc= -d*cos(30)*pow(3,(n-1)) ; 
//
//    rounded = true; 
//    
//    lina= 0 ; 
    
    
    
/**** 65-triángulos1-root4 ****/   

 
//    axiom="F";
//    rules=["F=F++FF--F"];
//    angle=60;
//    
//    n=3;    // hexagon:1->4 ; curve: max 8 
//    
//    hexagono= (n<=4)? true : false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w= (n<=2)? 2.01 : (n==3)? 1.6 : (n==4)? 1.21 : 0.8 ;
//    bordo= w;
//    
//    rot= 0; 
// 
//    b=hex-bordo/2/cos(30); 
//    
//    function f(n)= n==1? 1 : n==2? 3 : n%2==0? f(n-1)*2+1 : f(n-1)*2 ;
//    
//    d= hexagono==true? b/f(n): 4*w;
//      
//    xc= 
//    n==1? -d/2 :
//    n==2? d*1 :
//    n==3? d*4 :
//    n==4? d*4 :
//    n==5? -d*8 :
//    n==6? -d*32 :
//    0;
//    
//    yc=  
//    n==1? -d*cos(30) :
//    n==2? -d*cos(30)*2 :
//    n==3? 0 :
//    n==4? d*cos(30)*8 :
//    n==5? d*cos(30)*16 :
//    n==6? 0 :
//    0; 
//
//    rounded = true; 
//    lina= 0 ; 



/**** 66-triángulos1a-root4 ****/   

 
//    axiom="F++F++F";
//    rules=["F=F++FF--F"];
//    angle=60;
//    
//    n=3;    // hexagon:1->4 ; curve: max 6 
//    
//    hexagono= (n<=4)? true : false;
//    polygon= false; 
//    diferenza=0;   // 0,2
//    
//    w= diferenza==2? 0.4 : (n<=2)? 2.01 : (n==3)? 1.6 : (n==4)? 1.21 : 0.4 ;
//    bordo= diferenza==2? 2.01 : w;
//    
//    rot= 0; 
// 
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30); 
//    
//    function f(n)= n==1? 5 : f(n-1)*2+1 ;
//    
//    d= hexagono==true? b/(f(n)/3) : 4*w;
//      
//    xc= 
//    n==1? 0 :
//    n==2? d*2 :
//    n==3? d*4 :
//    n==4? d*0 :
//    n==5? -d*16 :
//    n==6? -d*32 :
//    0;
//    
//    yc=  
//    n==1? -d*cos(30)*4/3 :
//    n==2? -d*cos(30)*4/3 :
//    n==3? d*cos(30)*8/3 : 
//    n==4? d*cos(30)*32/3 :
//    n==5? d*cos(30)*32/3 :
//    n==6? -d*cos(30)*64/3 :
//    0; 
//
//    rounded = true; 
//    lina= 0 ; 
//   
  
 
  
/**** 67-triángulos2-root4 ****/   

 
//    axiom="X";
//    rules=["X=-FYFX++FYFX-","Y=+YFXF--YFXF+", "F= "];
//    angle=60;
//    
//    n=5;    // hexagon:1->5 ; curve: max 6 
//    
//    hexagono= (n<=5)? true : false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w= (n<=3)? 2.01 : (n<=4)? 1.6 : (n==5)? 1.21 : 0.8 ;
//    bordo= w;
//    
//    rot= 0; 
// 
//    b=hex-bordo/2/cos(30); 
//    
//    function f(n)= n==1? 3/2 : n==2? 3 : f(n-1)*2+1 ; 
//    
//    d= hexagono==true? b/f(n): 4*w;
//    
//    function g(n)= n==1? 1 : n==2? 2 : n%2==0? g(n-1)*2-1 : g(n-1)*2+1; echo(g(n));
//      
//    xc= -d*g(n);
//    yc=  d*cos(30)*pow(2,n-1); 
//
//    rounded = true; 
//    lina= 0 ; 

    
    
/**** 68-triángulos2a-root4 ****/  

 
//    axiom="X++X++X";
//    rules=["X=-FYFX++FYFX-","Y=+YFXF--YFXF+", "F= "];
//    angle=60;
//    
//    n=4;    // hexagon:1->4 ; curve: max 6 
//    
//    hexagono= (n>4)? false : true;
//    polygon= false; 
//    diferenza=0;  // 0,2
//    
//    w=  diferenza==2? 0.4 : (n<3)? 2.01 : (n==3)? 1.6 : (n==4)? 1.21 : 0.8 ;
//    bordo= diferenza==2? 2.01 : w;
//    
//    rot= 0;  
//    
//    b=hex-bordo/2/cos(30);
//    
//    function f(n)= (n==1)?8 : (n%2==0)? f(n-1)*2 : f(n-1)*2+6 ;
//  
//    d= hexagono==true? b/(f(n)/3) : 2*w;
//
//    xc= -d*pow(2,n)/2;
//    yc= -d/cos(30)*pow(2,n-1)/2;
//
//    rounded = true; 
//    lina= 0 ; 



    
/**** 69-5dragon-root5 ****/   

 
//    axiom="F";
//    rules=["F=F+F+F-F-F"];
//    angle=90;
//    
//    n=4;    // hexagon:1->4 ; curve: max 10 
//    
//    hexagono= (n>5)? false : true;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<3)? 2.01 : (n==3)? 1.6 : 1.21 ;
//    bordo= w;
//    
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30)/cos(45);  
//
//    d= 
//    (n==1)?  a: 
//    (n==2)?  b/(5/2+2/tan(60)):
//    (n==3)?  b/(13/2+4/tan(60)):
//    (n==4)?  a/17:  
//
//    3*w;
//    
//    xc= 
//    (n==1)? -d/2:
//    (n==2)? d*3/2:
//    (n==3)? d*11/2:
//    (n==4)? d*7/2:
//    0;
//    yc= 
//    (n==1)? -d:
//    (n==2)? -d*2:
//    (n==3)? d:
//    (n==4)? d*12:
//    0 ; 
//
//    rounded = false; 
//    lina= 0 ; 




/**** 70-Pinched 5_dragon -root5 ****/   

 
//    axiom="+X";
//    rules=["X=YF+YF+YF-YF-YF", "Y=XF-XF-XF+XF+XF" , "F="];
//    angle=90;
//    
//    n=4;    // hexagon:1->4 ; curve: max 6 
//    
//    hexagono= (n>4)? false : true;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<3)? 2.01 : (n==3)? 1.6 : 1.21 ;
//    bordo= w;
//    
//    rot= 90;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30)/cos(45);  
//
//    d= 
//    (n==1)?  a/1: 
//    (n==2)?  b/(2.5+2/tan(60)):
//    (n==3)?  a/7:
//    (n==4)?  b/(12+26/2/tan(60)):  
//
//    3*w;
//    
//    xc= 
//    (n==1)? d:
//    (n==2)? 0:
//    (n==3)? d*5:
//    (n==4)? 0:
//    0;
//    yc= 
//    (n==1)? -d/2:
//    (n==2)? -d*5/2:
//    (n==3)? -d*5/2:
//    (n==4)? -d*25/2:
//    0 ; 
//
//    rounded = false; 
//    
//    lina= (n==2)? b-2.5*d : (n==4)? b-12*d :0 ;



/**** 71-5_Crazy dragon ****/  

 
//    axiom="X";
//    rules=["X=-XF+YF-XF+YF+XF","Y=FY-FX-FY+FX-FY+", "F= "];
//    angle=90;
//    
//    n=4;    // hexagon:1->4 ; curve: max 7 
//    
//    hexagono= (n>4)? false : true;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<3)? 2.01 : (n==3)? 1.6 : (n==4)? 1.21 : 0.8 ;
//    bordo= w;
//    
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30)/cos(45);  
//
//    d= 
//    (n==1)?  b/(1+1/tan(60)): 
//    (n==2)?  b/(3+2/tan(60)):
//    (n==3)?  a/(9):
//    (n==4)?  a/(20): 
//    3*w;
//    
//    xc= 
//    (n==1)? -d*1:
//    (n==2)? -d*1:
//    (n==3)? d*2:
//    (n==4)? d*9:
//    0;
//    yc= 
//    (n==1)? d*1:
//    (n==2)? d*3:
//    (n==3)? d*7:
//    (n==4)? d*13:
//    0 ; 
//
//    rounded = false; 
//    lina=0 ;




/**** 72-5_Pine ****/   // (not hexagon)

 
//    axiom="X";
//    rules=["X=-YF-XF-YF+XF-YF","Y=FX+FY-FX+FY+FX+", "F= "];
//    angle=90;
//    
//    n=4;    // curve: max 6
//    
//    hexagono=  false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w= 0.8 ;
//    bordo= w;
//    
//    rot= 0;    
//
//    d= 3*w;
//    
//    xc= 0;
//    yc= 0 ; 
//
//    rounded = true; 
//    
//    lina= 0 ; 





/**** 73- 5_Jaggy-Cross2 ****/   

 
//    axiom="X+X+X+X";
//    rules=["X=-YF-YFXF+XF+XF","Y=FY-FY-FYFX+FX+", "F= "];
//    angle=90;
//    
//    n=4;    // hexagon:1->4 ; curve: max 6 
//    
//    hexagono= (n>4)? false : true;
//    polygon= true;      // true, false
//    diferenza=1;       // 0,1
//    
//    w=  (n<3)? 2.01 : (n==3)? 1.21 : (n==4)? polygon==false? 0.8 : 1.21 : 0.4 ;
//    bordo= diferenza>0? 3 : w;
//    
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b= polygon==true && diferenza==0? hex : hex-bordo/2/cos(30)/cos(45);  
//
//    d= 
//    (n==1)?  a/2.5: 
//    (n==2)?  b/(13/2+5/2/tan(60)):
//    (n==3)?  b/(25/2+21/2/tan(60)):
//    (n==4)?  b/(69/2+29/2/tan(60)):  
//
//    3*w;
//    
//    xc= 
//    (n==1)? -d*1/2:
//    (n==2)? d*7/2:
//    (n==3)? -d*9/2:
//    (n==4)? -d*17/2:
//    0;
//    yc= 
//    (n==1)? d*3/2:
//    (n==2)? -d*1/2:
//    (n==3)? -d*13/2:
//    (n==4)? d*31/2:
//    0 ; 
//
//    rounded = false; 
//    lina= 0 ;




/**** 74-Lazo ****/   

 
//    axiom="F";
//    rules=["F=FF-F-"];
//    angle=60;
//    
//    n=6;    // hexagon:4->8 ; curve: max 9 (5 min)
//    
//    hexagono= ( n<=8)? true : false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<=5)? 2.01 : (n<=7)? 1.6 : 1.21 ;
//    bordo= diferenza>0? 2.01 : w;
//    
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30); 
//    
//    function f(n)=
//    (n==1 || n==2 || n==3)? 5 :  
//    (n==4 || n==5)? 7 :
//    (n==6 || n==7)? 11 :
//    13; 
//
//    d= hexagono==true? b/(f(n)/2): 3*w;
//    
//    xc=-d*1.5;
//    yc= d*2*cos(30); 
//
//    rounded = true; 
//    
//    lina= 0 ;




/**** 75-root8-BrainDragon variant ****/ 

 
//    axiom="X";
//    rules=["X=XFXF+XF+YF-XF-YF","Y=FX+FY+FX-FY-FYFY", "F= "];
//    angle=90;
//    
//    n=3;    // hexagon:1->3 curve: max 6
//    
//    hexagono= ( n<=3)? true : false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<=2)? 2.81 : (n==3)? 2.01 : 0.8 ;
//    bordo= diferenza>0? 2.01 : w;
//    
//    rot= (n==2)? 90 : 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30)/cos(45); 
//    
//    d=  
//    (n==1)? b/(1+1/tan(60)) :  
//    (n==2)? b/(4+2/tan(60)) :
//    (n==3)? b/(12+6/tan(60)) :
//    (n==4)? a/28 :
//    2*w;
//    
//    xc= 
//    (n==1)? -d:
//    (n==2)? -d*0:
//    (n==3)? d*8:
//    (n==4)? d*32:
//    0;
//    yc= 
//    (n==1)? -d:
//    (n==2)? -4*d:
//    (n==3)? -8*d:
//    (n==4)? -8*d:
//    0 ; 
//
//    rounded = false; 
//    
//    lina= 0 ;  
    



/**** 76-triangular grid - root7 ****/   

 
//    axiom="X--X--X";
//    rules=["X=-YF++XF--YF++XFXF++YF--XF-","Y=+YF++XF--YFYF--XF++YF--XF+", "F= "];
//    angle=60;
//    
//    n=3;    // hexagon:1->3 ; curve: max 5 (5 min)
//    
//    hexagono= ( n<=3)? true : false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<=2)? 1.6 : 1.21 ;
//    bordo= w;
//    
//    rot= 0;  
//  
//    b=hex-bordo/2/cos(30); 
//    
//    d= n==1? b/(5/3) : n==2?  b/(14/3) : n==3? b/(38/3) : 3*w ;
//    
//    xc= n==1? -1.5*d : n==2? -2.5*d : 0.5*d;
//    yc= n==1? -d*cos(30)*1/3 : n==2? -d*cos(30)*11/3 : -d*cos(30)*37/3 ; 
//
//    rounded = true; 
//    
//    lina= 0 ;



/**** 77-sym_7_1-root7 ****/   

// 
//    axiom="X";
//    rules=["X=FX++FXFY++FY--FXFX--FX","Y=FX++FXFX++FY--FYFX--FX", "F= "];
//    angle=60;
//    
//    n=3;    // hexagon:1->3 ; curve: max 5 (5 min)
//    
//    hexagono= ( n<=3)? true : false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<=2)? 2.01 : 1.21 ;
//    bordo= w;
//    
//    rot= -60;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30); 
//    
//    d= 
//    n==1? b/(2) : 
//    n==2? a/(11/2*cos(30)) : 
//    n==3? a/(13.5) : 
//    3*w ;
//    
//    xc= 
//    n==1? 1/4*d : 
//    n==2? 3.25*d : 
//    -5*d;
//    
//    yc= 
//    n==1? -d*cos(30)*3/2 : 
//    n==2? d*cos(30)*3/2 : 
//    d*cos(30)*9 ; 
//
//    rounded = true; 
//    
//    lina= 0 ;





/**** 77a-sym_7_2-root7 ****/   

 
//    axiom="X++X++X";
//    rules=["X=FX++FXFY++FY--FXFX--FX","Y=FX++FXFX++FY--FYFX--FX", "F= "];
//    angle=60;
//    
//    n=2;    // hexagon:1->3 ; curve: max 5 (5 min)
//    
//    hexagono= ( n<=3)? true : false;
//    polygon= false; 
//    diferenza=0;    // 0, 2
//    
//    w=  diferenza==2? 0.4 : (n<=2)? 1.6 : 0.8 ;
//    bordo= diferenza==2? 3 : n==3? 1.21 : w;
//    
//    rot= 0;  
//  
//    a= n==3? hex*cos(30) : hex*cos(30)-bordo/2;
//    
//    d= 
//    n==1? a/(8/3*cos(30)) : 
//    n==2? a/(23/3*cos(30)) : 
//    n==3? a/(56/3*cos(30)) : 
//    3*w ;
//    
//    xc= 
//    n==1? 1*d : 
//    n==2? 2.5*d : 
//    n==3? -9.5*d :
//    0;
//    
//    yc= 
//    n==1? -d*cos(30)*4/3 : 
//    n==2? d*cos(30)*11/3 :
//    n==3? d*cos(30)*17/3 : 
//    0; 
//
//    rounded = true; 
//    
//    lina= 0 ;
    
    


/**** 78-8Filler-root8 ****/   

 
//    axiom="X";
//    rules=["X=XF+YF+XF+YF+XF","Y=YF-XF-YF-XF-YF", "F= "];
//    angle=45;
//    
//    n=4;    // hexagon:1->4 ; curve: max 6 
//    
//    hexagono= ( n<=4)? true : false;
//    polygon= false; 
//    diferenza=1; 
//    
//    w=  (n<=2)? 1.6 : (n==3)? 1.21 : 0.6 ;
//    bordo= w;
//    
//    function f(n)= (n==1)? 90 : f(n-1)-90;    
//    rot= f(n);  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30); 
//    
//    d= 
//    n==1? a/(1+1*cos(45)) : 
//    n==2? a/(5/2+3*cos(30)) : 
//    n==3? a/(12/2+9*cos(30)) : 
//    n==4? a/(17/2+12*cos(45)*3): 
//    2*w ;
//    
//    xc= 
//    n==1? -d/2 : 
//    n==2? d*(3/2+2*cos(45)) : 
//    n==3? d*(3/2+2*cos(45)) : 
//    n==4? -d*(17/2+12*cos(45)):
//    0;
//    
//    yc= 
//    n==1? -d*(1/2+cos(45)) : 
//    n==2? -d*(1/2+cos(45)) : 
//    n==3? d*(7/2+5*cos(45)) : 
//    n==4? d*(7/2+5*cos(45)):
//    0; 
//
//    rounded = true;  
//    lina= 0 ;




/**** 79-Dragon-root9 ****/   // (not hexagon)

 
//    axiom="X";
//    rules=["X=-XF+YF+XF-YF+XF+YF-XF+YF-XF-","Y=+FY+FX-FY+FX-FY-FX+FY-FX-FY+", "F= "];
//    angle=90;
//    
//    n=3;    // curve: max 5
//    
//    hexagono=  false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w= 0.8 ;
//    bordo= w;
//    
//    rot= 0;    
//
//    d= 3*w;
//    
//    xc= 0;
//    yc= 0 ; 
//
//    rounded = true; 
//    lina= 0 ; 



/**** 80-Triángulos-root9 ****/   

 
//    axiom="F---F";
//    rules=["F=F--F++F++F--FF"];
//    angle=60;
//    
//    n=3;    // hexagon:1->3 ; curve: max 6 
//    
//    hexagono= ( n<4)? true : false;
//    polygon= false; 
//    diferenza=0; // 0,2
//    
//    w= diferenza==2? 0.4 : (n<=2)? 1.6 : (n==3)? 1.21 : 0.8 ;
//    bordo= diferenza==2? 2.01 : w;
//       
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30); 
//    
//    d= (hexagono==true)? b/(pow(3,n)/2) : 4*w ;
//    
//    xc= -d*pow(3,n)/2;
//    yc=0; 
//
//    rounded = true; 
//    lina= 0 ;



/**** 81-Triángulos2-root9 ****/   

 
//    axiom="F++F++F";
//    rules=["F=F--F++F++F--FF"];
//    angle=60;
//    
//    n=2;    // hexagon:1->3 ; curve: max 6 
//    
//    hexagono= ( n<4)? true : false;
//    polygon= false; 
//    diferenza=0; // 0,2
//    
//    w= diferenza==2? 0.4 : (n<2)? 2.01 :(n==2)? 1.6 : 0.8 ;
//    bordo= diferenza==2? 2.01 : w;
//       
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30); 
//    
//    d= n==1? b/2 : n==2? b/7 : n==3? b/22 : 4*w;
//
//    xc= -d*pow(3,n)/2;
//    yc= -d*cos(30)*pow(3,n)/3 ; 
//
//    rounded = true; 
//    
//    lina= 0 ;




/**** 82-Triángulos3-root9 ****/   

 
//    axiom="X";
//    rules=["X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F="];
//    angle=60;
//    
//    n=2;    // hexagon:1->3 ; curve: max 6 
//    
//    hexagono= ( n<4)? true : false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w=  (n<=2)? 2.01  : 1.6 ;
//    bordo= w;
//       
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2;
//    b=hex-bordo/2/cos(30); 
//    
//    d= 
//    n==1? a*2/(5*cos(30)) : 
//    n==2? b/(8+1/tan(60)) : 
//    n==3? b/(26+1/tan(60)): 
//    4*w;
//    
//    xc=
//    n==1? -d : 
//    n==2? -d*3/2  : 
//    n==3? d*11/2 : 
//    0;
//    
//    yc=
//    n==1? -1/2*d*cos(30) : 
//    n==2? -4*d*cos(30) : 
//    n==3? -10*d*cos(30) : 
//    0; 
//
//    rounded = true; 
//    lina= 0 ;




/**** 83-Triángulos3a-root9 ****/   

 
//    axiom="X++X++X";
//    rules=["X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F="];
//    angle=60;
//    
//    n=2;    // hexagon:1->3 ; curve: max 6 
//    
//    hexagono= ( n<4)? true : false;
//    polygon= true;     // true, false
//    diferenza=1;      // 0,1
//    
//    w=  (n<=2)? 2.01 : (n==3)? polygon==true? 1.21 : 1.6 : 0.8 ;
//    bordo= diferenza>0? 2.01 :  w;
//       
//    rot= 0;  
//  
//    b= polygon==true && diferenza==0? hex : hex-bordo/2/cos(30)/cos(45);
//        
//    d= 
//    n==1? b/(3+2*cos(30)/tan(60)) : 
//    n==2? b/(13+2*cos(30)/tan(60)) : 
//    n==3? polygon==false?  b/(17.74+1/3*cos(30)/tan(60)): b/(43+2*cos(30)/tan(60)) :
//    4*w;
//    
//    xc=
//    n==1? 0 : 
//    n==2? d*4.5  : 
//    n==3? d*13.5 : 
//    0;
//    
//    yc=
//    n==1? -2*d*cos(30) : 
//    n==2? -3*d*cos(30) : 
//    n==3? 9*d*cos(30) : 
//    0; 
//
//    rounded = true; 
//    lina= 0 ;




/**** 84-PeanoGosper-root13 ****/   // (not hexagon)

 
//    axiom="X";
//    rules=["X=YF+XF-YF-YFXF+XF+YF-XF+XF+YF-XF+YF-XF-", "Y=+YF+XF-YF+XF-YF-YF+FX-YF-YFXF+XF+YF-XF", "F= "];
//    angle=90;
//    
//    n=2;    // curve: max 5
//    
//    hexagono=  false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w= 0.8 ;
//    bordo= w;
//    
//    rot= 0;    
//
//    d= 3*w;
//    
//    xc= 0;
//    yc= 0 ; 
//
//    rounded = true; 
//    
//    lina= 0 ; 



/**** 85-Gosper-root13 ****/   

 
//    axiom="X++X++X";
//    rules=["X=YF+XF++XF-YF--YF+XFXF++XF+YF-XF+YF--YF-XF-", "Y=+YF+XF++XF-YF+XF-YF--YFYF-XF++XF+YF--YF-XF", "F="];
//    angle=60;
//    
//    n=2;    // hexagon:1->2 ; curve: max 4 
//    
//    hexagono= ( n<3)? true : false;
//    polygon= false;     // true, false
//    diferenza=0;      // 0,1 
//    
//    w=  (n==1)? 2.01  : 1.21 ;
//    bordo= diferenza>0? 2.01 : w;
//       
//    rot= 0;  
//  
//    a= polygon==true && diferenza==0? hex*cos(30) : hex*cos(30)-bordo/2; 
//    
//    d= 
//    n==1? a/(14/3*cos(30)) : 
//    n==2? a/(52/3*cos(30))  : 
//    4*w;
//    
//    xc=
//    n==1? d*1.5 : 
//    n==2? d*3.5  : 
//    0;
//    
//    yc=
//    n==1? -d*5/3*cos(30) : 
//    n==2? d*23/3*cos(30) : 
//    0; 
//
//    rounded = true; 
//    
//    lina= 0 ;




/**** 86-root16-fractal1 ****/   

 
//    axiom="X++X++X";
//    rules=["X=-YF+XF+XF-", "Y=+FY-FY-FX+", "F="];
//    angle=60;
//    
//    n=5;    // hexagon:1->5 ; curve: max 10 
//    
//    hexagono= ( n<6)? true : false;
//    polygon= true;     // true, false
//    diferenza=1;      // 0,1  
//    
//    w=  (n<3)? 2.01 :(n==3)? 1.6 : (n<=5)? 1.21 : 0.8 ;
//    bordo= diferenza>0? 2.4 : w;
//       
//    rot= 30; // 0,30  
//  
//    a=(polygon==true && diferenza==0)? hex*cos(30) : hex*cos(30)-bordo/2; 
//    b=hex-bordo/2/cos(30);
//    
//    function f1(n)= (n==1)? 5 : f1(n-1)*2+3 ;
//    function f2(n)= (n==1)? 3 : f2(n-1)*2+1 ;
//    
//    d= (hexagono==true)? 
//    (rot==0)? b/(f1(n)/3) : 
//    a/(f2(n)/2) :
//    3*w ;
//
//    xc= -d*pow(2,n-1);
//    yc= -d*cos(30)*pow(2,n)/3;
//
//    rounded = true; 
//    
//    lina= 0 ;
    


/**** 87-dragonLóbulos ****/   // (not hexagon)

 
//    axiom="X";
//    rules=["X=--FXF+F+FYF--","Y=++FXF-F-FYF++", "F= "];
//    angle=45;
//    
//    n=9;    // curve: max 12
//    
//    hexagono=  false;
//    polygon= false; 
//    diferenza=0; 
//    
//    w= 0.8 ;
//    bordo= w;
//    
//    rot= 0;    
//
//    d= 2*w;
//    
//    xc= 0;
//    yc= 0 ; 
//
//    rounded = true; 
//    
//    lina= 0 ; 
//    


/**** 88-carpet6 ****/   

 
//    axiom="F-F-F-F";
//    rules=["F=F-b+F-F-F-Fb-F+b-F+F+F+Fb+FF","b=" ];
//    angle=90;
//    
//    n=2;    // hexagon: 1, 2 ; curve: max 4
//    
//    hexagono= ( n<3)? true : false;
//    polygon= false;     
//    diferenza=0;   // 0,2
//    
//    w=  (n==1)? 2.01 : (n==2)? diferenza>0? 0.8 :1.2 : 0.8 ;
//    bordo= diferenza>0? 2.4 : w;
//       
//    rot= 0;  
//  
//    a=hex*cos(30)-bordo/2; 
//    
//    function f1(n)= (n==1)? 3  : 4*f1(n-1)+1;
//    
//    d= hexagono==true? a/f1(n) : 2*w;
//    
//    function f2(n)= (n==1)? 1 : f2(n-1)+2;
//    
//    xc= -d*pow(2,f2(n));
//    yc=-xc;
//
//    rounded = false; 
//    
//    lina= 0 ; 
    

    
    
/**** 89-Peano variacion - root9 ****/   
 
//    axiom="F";
//    rules= ["F=F+F-F-F-G+F+F+F-F", "G=FFF"];
//    angle=90;
//    
//    n=2;    // hexagon:1->3 ; curve: max 5
//    
//    hexagono= n>3? false : true;
//    polygon= false; 
//    diferenza=0;    // 0,1
//    
//    w= diferenza==1? 0.8 : (n<=2)? 2.01 : n==3?  1.21 : 0.8;
//    bordo= diferenza==1? 3 : w;
//    
//    a=(hex*cos(30)-bordo/2); 
//    b=(hex-bordo/cos(30));  
//    
//    d= 
//    (n==1)? b/2 : 
//    (n==2)? b/(13/2) : 
//    (n==3)? a/18 :
//    4*w;
//    
//    xc=
//    (n==1)? -d*2:
//    (n==2)? -d*(13/2):
//    (n==3)? -d*20:
//    0;
//    yc=0;
//
//    rot=0;
//
//    rounded = false;    
//    lina= (n==3)? d :0;







/****************************/
// Modo de curva - curve mode
/****************************/


module curva(){
    if (polygon==false) {
        if (axiom=="[7]++[7]++[7]++[7]++[7]") {             // penrose
            L_system2(axiom, rules, n, angle, w, "6789");  
        }
        else {      
        L_system2(axiom, rules, n, angle, w); }
    }
    else {
        L_system_polygon(axiom,rules, n, angle, w);
    }
}


/****************************/
// hexágono - hexagon construction
/****************************/


    
linear_extrude(h) // comentar se non se quere extruir

if (hexagono==true){
    
    if (diferenza==0){
        union(){
            difference(){
                circle(r=hex, $fn=6);
                circle(r=hex-bordo/cos(30), $fn=6);
            }
            if ( lina>0){        // para engadir liñas
                translate([-hex+bordo,-w/2,0]) linha();
                translate([hex-bordo-lina,-w/2,0]) linha2();
            }
            intersection(){
                circle(r=hex, $fn=6);
                rotate(rot) translate([xc,yc,0]) curva();                
            }
        }
    }
    
    else if (diferenza==1) { 
        difference(){
            circle(r=hex, $fn=6);
            rotate(rot) translate([xc,yc,0]) curva();         
        } 
        
    }
    
    else if (diferenza==2){
        union(){
            difference(){
                circle(r=hex, $fn=6);
                rotate(rot) translate([xc,yc,0]) L_system_polygon(axiom,rules, n, angle, w); 
            } 
            intersection(){
                circle(r=hex, $fn=6);
                rotate(rot) translate([xc,yc,0]) L_system2(axiom, rules, n, angle, w);                
            }
            
    }
}
    
}

else{
    rotate(rot) translate([xc,yc,0]) curva();
}

module linha(){
    union() {
        square([lina-w/4,w], center=false); 
        translate([lina-w/2,w/2,0]) circle(d=w); }
    }

module linha2(){
    union() {
        translate([w/4,0,0]) square([lina,w], center=false); 
        translate([w/4,w/2,0]) circle(d=w); }
    }
    

/************************************
Xeración da curva - curve generation
************************************/


    module L_system2(start, rules, n, angle, w=0.4, draw_chars="F", move_chars="M", heading=0, startpos=[0,0],d=d) {
      tables = create_lookup(start, rules, draw_chars, move_chars);
      //echo(tables);
      instrs = apply_rules(start, tables[0], tables[1], n);
      //echo(instrs);
      l = len(instrs);
    
      // generate a completely flat list of numbers, with each consecutive 4 numbers representing a line segment
      // this doubles the output size necessary in most cases, but needed to support M (move without drawing) commands
        
      coords = // C-style "for" list comprehension
      [for(i=0,ch=instrs[0],pos=startpos, // init
          newpos=(ch=="F" || ch=="M") ? pos + d*[cos(heading), sin(heading)] : pos,
          heading=(ch=="-") ? heading-angle : (ch=="+") ? heading+angle : heading,
          stack=(ch=="[") ? [[pos,heading]] : [];
          
          i<l; // condition
          // update variables
          i = i+1,
          ch = instrs[i],
          pos = newpos, 
          newpos = (ch=="F" || ch=="M") ? newpos + d*[cos(heading), sin(heading)] : (ch=="]") ? stack[0][0] : newpos,
          heading = (ch=="-") ? heading-angle : (ch=="+") ? heading+angle : (ch=="]") ? stack[0][1]: heading,
          stack=(ch=="[") ? concat([[pos,heading]],stack) : (ch=="]") ? sublist(stack,1) : stack 
          //,_=echo(ch,pos,newpos,heading,stack)       
        )
        if(ch=="F") for(x=[pos[0],pos[1],newpos[0],newpos[1]]) x ];
    
      segmented_lines(coords, w);
      echo("Done!");
    }
    
    // draw a closed path using polygon, assumes no move commands(all lines connected)
    
    module L_system_polygon(start, rules, n, angle=90, draw_chars="F") {
      startpos = [0,0];
      heading = 0;
      tables = create_lookup(start, rules, draw_chars, "");
      //echo(tables);
      instrs = apply_rules(start, tables[0], tables[1], n);
      //echo(instrs);
      l = len(instrs);
      path = // C-style "for" list comprehension
      [for(i=0,ch=instrs[0], // init
          pos=(ch=="F") ? startpos + d*[cos(heading), sin(heading)] : startpos,
          heading=(ch=="-") ? heading-angle : (ch=="+") ? heading+angle : heading,
          stack=(ch=="[") ? [[pos,heading]] : [];
          i<l; // condition
          // update variables
          i = i+1,
          ch = instrs[i],
          pos = (ch=="F") ? pos + d*[cos(heading), sin(heading)] : (ch=="]") ? stack[0][0] : pos,
          heading = (ch=="-") ? heading-angle : (ch=="+") ? heading+angle : (ch=="]") ? stack[0][1]: heading,
          stack=(ch=="[") ? concat([[pos,heading]],stack) : (ch=="]") ? sublist(stack,1) : stack 
          //,_=echo(ch,pos,newpos,heading,stack)       
        )
        if(ch=="F") pos ];
      //echo(path);
      polygon(path);
    }
    
    
    // binary tree based join, depth of recursion is log_2(n), rather than (n) for naive join
    
    function join(l) = let(s = len(l)) s > 0 ? _jb(l,0,s) : "";
    // "join binary", splits list into halves and joins them. 
    // l=list, b=begin(inclusive), e=end(exlusive), s=size, m=midpoint
    function _jb(l,b,e) = let(s = e-b, m=floor(b+s/2)) s > 2 ? 
      str(_jb(l,b,m), _jb(l,m,e)) :
      s == 2 ? 
        str(l[b],l[b+1]) : 
        l[b];
    
    // extract substring given begin(inclusive) and end(exclusive)
    // if end not specified, go to end of string
    
    function substr(s,b,e) = let(e=is_undef(e) || e > len(s) ? len(s) : e) (b==e) ? "" : join([for(i=[b:e-1]) s[i] ]);
    function sublist(s,b,e) = let(e=is_undef(e) || e > len(s) ? len(s) : e) [for(i=[b:1:e-1]) s[i] ];
    // return true if value v in list(or string)
    function in_list(l,v) = len([for(x=l) if(x==v) x])>0;
    
    
    // create lookup tables for every character, then we can do array lookup for replacement
    // instead of many ternary statments
    
    function create_lookup(start, rules, draw_chars, move_chars) = 
      let (
        valid_chars = "FM-+[]",
        allchars = str(join(rules),start,valid_chars),
        // Create table of size == max ord character in all rules (<256 for ASCII)
        size = max([for(ch = allchars) if (ch != "=") ord(ch)])+1,
        rules_l = [for (rule = rules) rule[0]], // rule left symbol
        rules_r = [for (rule = rules)           // rule right symbols
          assert(rule[1]=="=", str("Invalid rule:\"",rule,"\"\nRules must be single strings starting with a symbol to replace, then '=', then the replacement string")) 
          substr(rule,2)
        ],
        table = [for(i=[0:size]) // rule_i is index of first rule for ch, otherwise undef 
          let (ch = chr(i), rule_i=[for(j=[0:len(rules)-1]) if(rules_l[j]==ch) j ][0]) 
          is_undef(rule_i) ? ch : rules_r[rule_i]
        ],
        //valid_identity = 
        final_rules1 = [for (rule = rules)     // rule right symbols
          assert(rule[1]=="=", str("Invalid rule:\"",rule,"\"\nRules must be single strings starting with a symbol to replace, then '=', then the replacement string")) 
          [rule[0],substr(rule,2)]
        ],
        final_rules2 = [for (ch=valid_chars) [ch,ch]], // use identity rules for valid characters, 
                                        // needed because any invalid char will be filtered out in final pass
        final_rules = [for(rule=concat(final_rules1,final_rules2))
            [rule[0], join([for(ch=rule[1]) in_list(draw_chars,ch)? "F": (in_list(move_chars,ch)? "M": in_list(valid_chars,ch) ? ch : "") ])]
        ],
        // final table should specify replacements for draw/move, and keep any other valid chars
        // if a draw/move char is a F or M then 
        final_table = [for(i=[0:size])
          let (
            ch = chr(i), // rule_i is index of first rule for ch, otherwise undef
            rule_i=[for(j=[0:len(final_rules)-1]) if(final_rules[j][0]==ch) j ][0])
          is_undef(rule_i) ? undef : final_rules[rule_i][1]
        ]
      )
      [table, final_table];
    
    
    // recursively apply rule replacement using table lookup.  
    // replacement strings are split out into individual characters at each level.
    // return a list of single character strings to be processed into coordinates
            
    function apply_rules(start, table, final_table, n) = 
      n > 1 ? 
        apply_rules([ for(ch=start) for(c2=table[ord(ch)]) c2 ], table, final_table, n-1) :
        (n == 1 ? 
          [ for(ch=start) for(c2=final_table[ord(ch)]) c2] :
          start);
    
    
    // works on long lists of "lines" which are specified as a flat list of numbers, 
    // each 4 representing a single line: [xa,ya,xb,yb,...]
          
    module segmented_lines(l, w=0.1) {
      // OpenSCAD doesn't allow ranges > 10000 in modules, 
      // so limit is used to split very large segmented lines into manageable chunks
      limit = 9999*4;
      size = len(l);
      imax = floor((size-1) / limit);
      for (i = [0:1:imax]) {
        jmin = i*limit;
        jmax = min(jmin + limit - 1, size-1);
        for (j=[jmin:4:jmax]) {
          line(l[j],l[j+1],l[j+2],l[j+3], w); 
        }
      }
      if (rounded) {
        lmax = len(l)-1;
        translate([l[lmax-1], l[lmax]]) circle(d=w); 
      }

    }
    
    // works on long lists of "lines" which are a flat list of numbers: [xa1,ya1,xb1,yb1,xa2,ya2,xb2,yb2...
    // From testing this is not really advantageous over segmented line implementation above
    
    module binary_lines(l, w=0.1,b=0, end) {
      e = is_undef(end) ? len(l) : end;
      s = e-b;
      //echo(b,e,s);
      if (s > 8) {
        m = b + floor(s/8)*4;
        binary_lines(l, w, b, m);    
        binary_lines(l, w, m, e);    
      } else if (s == 8) {
        line(l[b  ],l[b+1],l[b+2],l[b+3], w); 
        line(l[b+4],l[b+5],l[b+6],l[b+7], w); 
      } else if (s == 4){
        line(l[b],l[b+1],l[b+2],l[b+3], w); 
      }
      if (rounded) {
        lmax = len(l)-1;
        translate([l[lmax-1], l[lmax]]) circle(d=w); 
      }

    }
    
    
    module line(xa,ya,xb,yb, w=0.1) {
      //echo(xa,ya,xb,yb);
      dx = (xb - xa);
      dy = (yb - ya);
      d = sqrt(dx*dx + dy*dy);
      a = atan2(dy, dx);
      translate([xa,ya]) {
        if (rounded) circle(d=w); 
        else translate([-w/2,-w/2]) square([w,w]);
        rotate([0,0,a]) translate([0,-w/2]) square([d,w]);
      }
    }
    




