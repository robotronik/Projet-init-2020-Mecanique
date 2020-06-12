use <chassis_fixations.scad>
use <roue_moteur.scad>

$fn =50;
chassis_fixations();
translate ([95.9,25,21])rotate([0,0,180]) roue_moteur();
mirror([1,0,0])translate ([-3.9,25,21])rotate([0,0,180]) roue_moteur();