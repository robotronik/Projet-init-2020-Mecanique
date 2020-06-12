$fn=100;

module equerre_fixation_moteur(longueur_L=16, longueur_S=7,largeur=5, epais=2, diam_trou=3)
{    
    //branche longue
    rotate([0,-90,0]){	
        difference(){
            cube([longueur_L,largeur,epais]);
            translate([13.2,largeur/2,-2])cylinder(d=diam_trou,h=7);	
            }
    }
    //branche courte
	difference() {
		cube([longueur_S,largeur,epais]);
		translate([4.2,largeur/2,-5])cylinder(d=diam_trou,h=10);
	}
    //renfort d'angle
	translate([0,largeur,epais]) rotate([0,-90,90])linear_extrude(height = largeur)polygon(
		points=[ [0,0],[1.5,0],[0,-1] ],
		paths=[0,1,2,]
	);	
}

module plateau(e=5)
{
    difference(){
    translate([-52.5,-33,-e])cube([53.2,44,e]); 
    //trous débouchant centraux 
   	translate([-29.5+3.5,-26.5+3+2,-10])cylinder(d=3,h=25);
	translate([-29.5+3.5,-26.5+3+13.5,-10])cylinder(d=3,h=25);
	translate([-29.5+3.5,-26.5+3+13.5+11.5,-10])cylinder(d=3,h=25);
	//trous débouchant bordure
	translate([-49.4,-29.5,-7.5])cylinder(d=3,h=10);
	translate([-33.4,-29.5,-7.5])cylinder(d=3,h=10);
	translate([-18.4,-29.5,-7.5])cylinder(d=3,h=10);
	translate([-2.4,-29.5,-7.5])cylinder(d=3,h=10);
    }
}


module parois_support()
{
    difference(){
    	union(){
		translate([-22.5,-25,0])cube([2,35,25]);	
		translate([-31.5,-25,0])cube([2,35,25]);
		translate([-52.5,-25,0])cube([1.5,35,25]);
		translate([-0.8,-25,0])cube([1.5,35,25]);
    }
    translate([-22.6,-25.1,12.1])minkowski(){
        cube([1.1,20,13]);
        rotate([0,90,0])cylinder(d=4,h=1.1);
    }
    translate([-31.6,-25.1,12.1])minkowski(){
        cube([1.1,20,13]);
        rotate([0,90,0])cylinder(d=4,h=1.1);
    }
    translate([-52.6,-24.5,6.1])minkowski(){
         cube([1.1,21.5,19]);
         rotate([0,90,0])cylinder(d=4,h=1.1);
    }
    translate([-1,-24.5,6.1])minkowski(){
         cube([1.1,21.5,19]);
         rotate([0,90,0])cylinder(d=4,h=1.1);
    }
    
    translate([-55.7,4.5,20.4])rotate([0,90,0])
    cylinder(d=3,h=60);
    }
}

module support_moteur(e=5){
    plateau(e);
    parois_support();
    translate([-45,-27,-2])rotate([0,0,180])
    equerre_fixation_moteur(longueur_L=16, longueur_S=7,largeur=5, epais=2, diam_trou=3);
    translate([-38,-32,-2])
    equerre_fixation_moteur(longueur_L=16, longueur_S=7,largeur=5, epais=2, diam_trou=3);
    translate([-14,-27,-2])rotate([0,0,180])
    equerre_fixation_moteur(longueur_L=16, longueur_S=7,largeur=5, epais=2, diam_trou=3);
    translate([-7,-32,-2])
    equerre_fixation_moteur(longueur_L=16, longueur_S=7,largeur=5, epais=2, diam_trou=3);
    
}

support_moteur(5);

