use <../Pieces_basiques/chassis.scad>
use <../Pieces_basiques/support_capteur_CNY70.scad>
use <../Pieces_basiques/support_capteur_US.scad>
use <../Pieces_basiques/support_moteur.scad>
use <../Pieces_basiques/support_roulette_a_bille.scad>

$fn = 50;
module chassis_fixations(){
    color([0.8,0.5,0.2,1]) chassis();
    color([1,0,0,1])translate([75.9,40.8,10]) 
    support_moteur();
    translate([50,87,5]) rotate([0,0,180])support_roulette_a_bille();
    //support_capteur_CNY70();
    color([0.1,0.3,0.8,1])translate ([28.5,-6.9,10]) rotate([90,0,0])
    support_capteur_US();
}

chassis_fixations();