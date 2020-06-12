use <../Pieces_basiques/moteur.scad>;
use <../Pieces_basiques/roue.scad>;
fn = 100;

module roue_moteur(){
    rotate([0,-90,0]) roue();
    translate([30.5,0,0]) moteur();
}

roue_moteur();