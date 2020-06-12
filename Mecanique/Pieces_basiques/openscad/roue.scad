$fn=50;

module roue()
{
    //pneu
	color("grey") rotate_extrude(angle=360) 
    difference(){
        intersection(){
            translate([17, 0, 0]) 
                square([34, 26], center = true);
            circle(d=69,true);
        }
        translate([13, 0, 0]) 
                square([26.1, 26.1], center = true);
        translate([34, 3, 0]) 
                square([1, 2], center = true);
        translate([34, -3, 0]) 
                square([1, 2], center = true);
    }
    //cylindre support du pneu
    color("yellow") difference(){
        cylinder(d=52, h=26, center = true);
        cylinder(d=46, h=26.1, center = true);
    }
    //anneau suport des rayons
    color("yellow") translate([0, 0, 9]) difference(){
        cylinder(d=46, h=2, center = true);
        cylinder(d=42, h=2.1, center = true);
    }
    //liaison encastrement pour l'arbre
    color("yellow") union(){
        translate([0, 0, -18]) difference(){
            cylinder(d=11, h = 27);
            translate([0, 0, 6]) intersection(){
                cube([3.4, 6, 10.1], center = true);
                cylinder(d=6, h=10.1, center = true);
            }
            translate([0, 0, 0.5]) cylinder(d=6, h=1.1, center = true);
        }
        //moyeu
        translate([0, 0, 7]) difference(){
             linear_extrude(height=7, center = true, scale = 2) 
            circle(d=11,true);
            translate([0, 0, 3]) linear_extrude(height=7, center = true, scale = 2) 
            circle(d=11,true);
        }
        
        translate([0, 0, 7]) cylinder(h=2, d=15, center = true);
        //jante en étoile
        translate([0, 0, 10]) difference(){
            for(i=[0:4]){
                rotate([0, 0, i*360/5]) linear_extrude(height=0.5) 
                polygon([[10*cos(120), 10*sin(120)], [10*cos(60), 10*sin(60)], [0, 30]]);
                rotate([0, 90, i*360/5]) linear_extrude(height=0.5) 
                polygon([[0, 0], [10, 25], [0, 25]]);
            }
            linear_extrude(height=7, center = true, scale = 2) 
            circle(d=11,true);
        }
    }
}

roue();
