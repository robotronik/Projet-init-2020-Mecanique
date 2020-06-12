$fn=50;

module CNY70(){
	difference(){
		color("midnightBlue")cube([7,7,6]);
		color("midnightBlue")union(){
			translate([-0.1,3,-0.1])cube([1.1/2,1,6.2]);
			translate([7.1-1.1/2,3,-0.1])cube([1.1/2,1,6.2]);
			translate([1,1,5])cube([5,5,1.1]);
		}
	}
    //pattes
	translate([(7-3.04)/2,(7-3.2)/2,0]){
		color("khaki"){
            translate([0,0,-6])cube([0.5,0.4,6]);
            translate([0,2.8,-6])cube([0.5,0.4,6]);
            translate([2.54,2.8,-6])cube([0.5,0.4,6]);
            translate([2.54,0,-6])cube([0.5,0.4,6]);
		}
	}
    // émetteur
	color("black")translate([3.5,3.5-1.8/2-(2.5-1.8)/2,5])cylinder(d=1.8,h=0.1); 
    // capteur
	color("silver")translate([3.5,3.5+1.8/2+(2.5-1.8)/2,5])cylinder(d=1.8,h=0.1);		
}

CNY70();