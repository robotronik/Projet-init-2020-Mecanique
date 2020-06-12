$fn=50;
module bille_jockey()
{
    //disque central
	color("gold")difference(){
        union(){
            cylinder(d=31,h=2,center = true);
            rotate_extrude(angle=360)
                 scale([0.5,1,1])translate([31,0,0])
                      circle(d=2,center = true);
        }
        //frettes
        for(i=[0:2]){
            translate([12.6*cos(i*120),12.6*sin(i*120), 0]) cylinder(d=3,h=3, center = true);
        }
	}
    //cône dessus
	color("lightgrey") translate([0, 0, 1]) difference(){
        linear_extrude(height=3.5, scale = 13.9/19.7) circle(d=19.7);
    }
    //cylindre dessus
    color("lightgrey") translate([0, 0, 3.5+1+2.5/2]) difference(){
        cylinder(d=13.9, h=2.5, center = true);
        translate([0, 0, (2.5-1)/2]) rotate_extrude(angle=360) difference(){
            translate([(13.9-1)/2, 0, 0]) square(1.1, center = true);
            translate([13.9/2-1, -1/2, 0]) circle(r=1.1, center = true);
        }
    }
    //porte-bille
    color("gold") difference(){
        sphere(d=20);
        translate([0, 0, 10]) cube(20, center = true);
        translate([0, 0, -10-1-7]) cube(20, center = true);
    }
    //bille
    color("lightgrey") translate([0, 0, -8+4]) sphere(d=14.3);
}
bille_jockey();
