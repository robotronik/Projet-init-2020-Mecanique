$fn=50;

module quartz(){
	cube([6.4,4.4,3.3]);
	translate([0,2.2,0])cylinder(d=4.4,3.3);
	translate([8.6-2.2,2.2,0])cylinder(d=4.4,3.3);
}

module connexion_plastique(L,l,hauteur){
    // pavé octogonal de côté L+2*root(2)*l
	color("black")linear_extrude(height=hauteur)
    polygon(points=[[l,0],[L-l,0],[L,l],[L,L-l],[L-l,L],[l,L],[0,L-l],[0,l]],paths=undef);
}

module connecteur_coudee(Lc=5.6,pin_diam=1){
	connexion_plastique(2.56,0.5*sqrt(2)*0.75,2.6);
	color("khaki"){
        #translate([(2.56-pin_diam)/2,(2.56-pin_diam)/2,-2])
                   cube([pin_diam,pin_diam,Lc]);
        translate([(2.56-pin_diam)/2+pin_diam/2,(2.56-pin_diam)/2,1.6+2.56])rotate([0,90,0])
                   cube([pin_diam,pin_diam,Lc]);
        translate([2.56/2,(pin_diam+2.56)/2,pin_diam/2+3.16])rotate([90,0,0])
                   cylinder(d=pin_diam,h=pin_diam);}
}

module capteurUS_HCSR04(){
    //support
	color("Royalblue")difference(){
		 union(){
		  cube([45,20,1.5]);
		  translate([0,(20-12)/2,-1.8])cube([45,12,1.8]);
		 }
		translate([0.85,0.85,-0.1])cylinder(d=1.5,h=1.7);
		translate([45-0.85,0.85,-0.1])cylinder(d=1.5,h=1.7);
		translate([0.85,20-0.85,-0.1])cylinder(d=1.5,h=1.7);
		translate([45-0.85,20-0.85,-0.1])cylinder(d=1.5,h=1.7);
	}
    //speakers
	color("lightgray")difference(){
        union(){
            translate([9.5,10,1.5])cylinder(d=16,h=12);
            translate([45-9.5,10,1.5])cylinder(d=16,h=12);
            }
		translate([9.5,10,1.5])cylinder(d=14,h=12.1);
		translate([45-9.5,10,1.5])cylinder(d=14,h=12.1);
	}
	color("black")translate([9.5,10,1.5])cylinder(d=14,h=11);
	color("black")translate([45-9.5,10,1.5])cylinder(d=14,h=11);
    //connecteurs
	color("silver")translate([(45-10.8+4.4)/2,0.8,1.5])quartz();
	for(i=[0:3])translate([2.56+17.35+2.56*i-2.2,20-2.56,0])rotate([-180,0,90])connecteur_coudee();
}

capteurUS_HCSR04();