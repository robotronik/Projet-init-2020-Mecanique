$fn=50;

module arbre_de_transmission()
{
    union(){
        intersection(){
            cube([8.9, 5.35, 3.7], center = true);
            rotate([0, 90, 0]) cylinder(h=8.9, d=5.35, center = true);
        }
        translate([(8.9-0.5)/2, 0, 0]) rotate([0, 90, 0])
        cylinder(h=0.5, d=5.35, center = true);
    }
}

module rondelle(){
     difference(){
         translate([-3,0,0])rotate([0,90,0])cylinder(d=10,h=2);
         arbre_de_transmission();
     }
}

module moteur()
{
       //corps prinicipal plastique
	   union(){
        color("yellow")difference(){
            translate([0,-7.3,0])cube([18.6,37,22.4], center = true);
        
            translate([0,6.6,22.4/2-4.6])difference(){
                translate([0,4.6/2,4.6/2])cube([19,4.7,4.7],center=true);
                rotate([0,90,0])cylinder(h=20,d=2*4.6, center = true);
            }
            
            translate([0,6.6, -22.4/2+4.6]) difference(){
                translate([0, 4.6/2, -4.6/2]) cube([19, 4.7, 4.7], center = true);
                rotate([0, 90, 0]) cylinder(h=20, d=2*4.6, center = true);
            }
            //trous débouchants symétriques
            translate([0,-20.3, 22.4/2-2]) rotate([0, 90, 0]) 
            cylinder(h=19, d=3, center = true);
            translate([0,-20.3, -22.4/2+2]) rotate([0, 90, 0]) 
            cylinder(h=19, d=3, center = true);
        }
        //trou débouchant extérieur
        color("yellow") translate([0,13.7, 0]) difference(){
            cube([3, 5, 5], center = true);
            rotate([0, 90, 0]) cylinder(h=3.1, d=3, center = true);
        }
        //cylindre en surface du plastique 
        color("yellow") translate([-(18.6+1)/2,-11.8, 0]) rotate([0, 90, 0]) cylinder(h=1, d=4, center = true);
        
         color("white") translate([-(18.6+8.9)/2, 0, 0]) arbre_de_transmission();
    }
        //corps secondaire plastique
        color("yellow") translate([0, -31.8, 0]) intersection(){
            cube([17.6, 12, 22.4], center = true);
            scale([1.1, 1, 1]) rotate([90, 0, 0]) cylinder(h=12, d = 22.4, center = true);       
        }
        //crochets
        color("yellow") translate([0,-33, 0]) union(){
            translate([-(17.6+2)/2, 0, 0]) cube([2, 1, 5.1], center = true);
            translate([-(17.6+3)/2, 0.5, 0]) cube([1, 2, 5.1], center = true);
            
            translate([(17.6+2)/2, 0, 0]) cube([2, 1, 5.1], center = true);
            translate([(17.6+3)/2, 0.5, 0]) cube([1, 2, 5.1], center = true);
        }
        //corps métallique
        color("lightgray") translate([0, -41.93, 0]) intersection(){
            scale([1.1, 1, 1]) rotate([90, 0, 0]) cylinder(h=8.3, d = 20, center = true);
            cube([15, 8.3, 20], center = true);
        }
        
        translate([0, -48.75, 0]) color("white") difference(){
            intersection(){
                scale([1.1, 1, 1]) rotate([90, 0, 0]) cylinder(h=5.3, d = 20, center = true);
                cube([15, 5.3, 20], center = true);
            }     
            rotate([90, 0, 0]) scale([1.1, 1.01, 1]) rotate_extrude(angle=360) difference(){
                translate([(19.8-5.3)/2, 0, 0]) square([5.4, 5.4], center = true);
                translate([19.8/2 - 5.3,-5.3/2, 0]) circle(d=2*5.3,true);
            }
            
            translate([0, 0, (20-3)/2]) rotate([90, 0, 0]) cylinder(h=6, d=3, center = true);
            translate([0,0,20/2]) cube([3, 6, 3], center = true);
            
            translate([0, 0, -(20-3)/2]) rotate([90, 0, 0]) cylinder(h=6, d=3, center = true);
            translate([0, 0, -(20)/2]) cube([3, 6, 3], center = true);
        }
        
        translate([0, -52.4, 0]) union(){
            color("white") rotate([90, 0, 0]) cylinder(h=2, d=9.6, center = true);
            color("grey") rotate([90, 0, 0]) cylinder(h=3, d=1.9, center = true);
        }  
    translate([-9,0,0]) rondelle();
}

moteur();

