$fn =100;
use <capteurIR_CNY70.scad>;

module support_CNY70(L=9.4,H=10)
{
    //corps principal
	difference(){
		translate([0,0,3.8])cube([L,L,6.2]);
		union(){
			translate([(L-(L-1.9))/2,(L-(L-1.9))/2,3])cube([L-1.9,L-1.9,6.5]);
			translate([(L-(L-4))/2,(L-(L-4))/2,10-0.6])cube([L-4,L-4,0.7]);
		}
	}	
    translate([(L-0.5)/2,0.95,4])cube([0.5,0.5,6]);
	translate([(L-0.5)/2,L-0.95-0.5,4])cube([0.5,0.5,6]);
    //fixations
	difference(){  
		union(){
		     // fixation à la base
			translate([-5,(L-5)/2,-H+10])cube([5,5,H]);
			translate([L,(L-5)/2,-H+10])cube([5,5,H]);
			
			// fixation du capteur au support
			translate([L/2-3/2,L,3.8])cube([3,2,6.2]);
			translate([L/2,L+2,3.8])cylinder(d=3,h=6.2);
			}
		translate([-1.5-1,(L-3)/2+1.5,-H+9.5])cylinder(d=3,h=H+1);
		translate([+1.5+1+L,(L-3)/2+1.5,-H+9.5])cylinder(d=3,h=H+1);
		translate([L/2,L+2,3.7])cylinder(d=1.6,h=6.4);	
	}	
}

module fixation_CNY70(L=8.7){
	difference(){
	     union(){
		  cube([L,L,1]);
		  translate([L/2-3/2,L,0])cube([3,2.3,1]);
		  translate([L/2,L+2.3,0])cylinder(d=3,h=1);
		}
	     translate([(L-5)/2,(L-5)/2,-.1])cube([5,5,1.7]);
	     translate([L/2,L+2.3,-0.1])cylinder(d=1.6,h=1.2);
	}
}

module support_capteur_CNY70(){
translate([0,0,3.8])mirror([0,0,1])support_CNY70(9.5,10);
//mirror([0,0,1])translate([1.25,1.25,-0.2])CNY70();
translate([0.45,0.5,0.5])fixation_CNY70(8.7);
}
support_capteur_CNY70();

