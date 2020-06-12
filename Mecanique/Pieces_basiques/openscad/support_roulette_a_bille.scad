$fn=50;

module support_roulette_a_bille(H=3,e=2.5)
{
    difference(){
        union(){	
            cylinder(d=32,h=e);
            cylinder(d=8,h=e+H);
            translate([1.65+2.3/2-19.05/2,0,0])cylinder(d=2.3+2,h=e+H);
            translate([-(1.65+2.3/2-19.05/2),0,0])cylinder(d=2.3+2,h=e+H);
        }
	    for(i=[0:2]){
            translate([12.6*cos(i*120-30),12.6*sin(i*120-30),-0.01])cylinder(d=3,h=e+0.02);
            }
        translate([1.65+2.3/2-19.05/2,0,-0.01])cylinder(d=2.3,h=e+10.16+0.02);
	    translate([19.05/2-(1.65+2.3/2),0,-0.01])cylinder(d=2.3,h=e+10.16+0.02);   
  }  
}

support_roulette_a_bille(3,2.5);
