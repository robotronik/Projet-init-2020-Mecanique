$fn=100;
diam_vis=1.5;

module cable_management(L,l,h,e)
{
     cube([L,l,e]);
     cube([2,h,e]);
     translate([0,h,0])cube([L-2,e,e]);
}

module frontplate(L,l,e)
{
    //corps principal
     difference(){  
	       union(){
               minkowski(){
                   translate([-2,-(l-21),0])cube([L,l,e]);
                   cylinder(d=1.5,h=0.001);
                   }
               //gaines de fixation
               translate([0.85,0.85,-3.5])cylinder(d=diam_vis+2,h=e+2);
               translate([45-0.85-1,0.85,-3.5])cylinder(d=diam_vis+2,h=e+2);
               translate([0.85,20-0.85,-3.5])cylinder(d=diam_vis+2,h=e+2);
               translate([45-0.85-1,20-0.85,-3.5])cylinder(d=diam_vis+2,h=e+2);
               }
           // trous de vis
           translate([0.85,0.85,-0.1-3.5])cylinder(d=diam_vis,h=e+2.2+3);
           translate([45-0.85-1,0.85,-0.1-3.5])cylinder(d=diam_vis,h=e+2.2+3);
           translate([0.85,20-0.85,-0.1-3.5])cylinder(d=diam_vis,h=e+2.2+3);
           translate([45-0.85-1,20-0.85,-0.1-3.5])cylinder(d=diam_vis,h=e+2.2+3); 
           // trous speakers
           translate([9.5,10,-0.1]) cylinder(d=18,h=e+0.2);
           translate([45-9.5,10,-0.1]) cylinder(d=18,h=e+0.2);
           }

      // crochets pour câbles
      translate([-8,5,0])cable_management(6,2,7,2);
      translate([L+4,5,0])mirror([1,0,0])cable_management(6,2,7,2);
	         
}

module backplate(L,H,e)
{
    // corps principal
    difference(){
        union(){
            difference(){
                minkowski(){
                    translate([-2,-(H-21),0])cube([L,H,e]);
                    cylinder(d=1.5, h=0.001);
                    }
                minkowski(){
                    // not interference with header
                    translate([(45-17)/2,-3.5+0.1+21,-0.1])cube([17,5,e+0.2]); 
                    cylinder(d=3,h=e+0.2);
                    }
            }
            //gaines de fixation
            translate([0.85,0.85,0])cylinder(d=diam_vis+2,h=e+2);
            translate([44-0.85,0.85,0])cylinder(d=diam_vis+2,h=e+2);
            translate([0.85,20-0.85,0])cylinder(d=diam_vis+2,h=e+2);
            translate([44-0.85,20-0.85,0])cylinder(d=diam_vis+2,h=e+2);
            }
	  // screw hole
	  translate([0.85,0.85,-0.1])cylinder(d=diam_vis,h=e+2.2);
	  translate([44-0.85,0.85,-0.1])cylinder(d=diam_vis,h=e+2.2);
	  translate([0.85,20-0.85,-0.1])cylinder(d=diam_vis,h=e+2.2);
	  translate([44-0.85,20-0.85,-0.1])cylinder(d=diam_vis,h=e+2.2);
      // économie de PLA
	  minkowski(){
          translate([(45-30)/2,21-10-H/2+3,-0.1])cube([30,10,e+0.2]); 
          cylinder(d=2,h=e+0.2);
          }
     }

     // fixations support-châssis
     translate([-2,-(H-18),0])cube([L,3,e]);
     difference(){
         union(){
             translate([-2,-(H-18),-10.5])cube([5,e,10.5]);
	         translate([-7+L,-(H-18),-10.5])cube([5,e,10.5]);
             }
         translate([0.35,0,-7.5])rotate([90,0,0])cylinder(d=2.5,h=10);
	     translate([-4.35+L,0,-7.5])rotate([90,0,0])cylinder(d=2.5,h=10);
	  
     }
}

module support_capteur_US()
{
translate([0,0,-4])backplate(48,23,2);
translate([0,0,3.5])frontplate(48,23,2);
}


