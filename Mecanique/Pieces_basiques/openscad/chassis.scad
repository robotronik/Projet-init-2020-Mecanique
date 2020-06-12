$fn=50;

module chassis(){
     difference(){
	  union(){
          //forme du châssis
	       translate([0,-10,-1])cube([100,110,6]);
	       translate([50,-10,-1])resize(newsize=[0,20,0])cylinder(d=100,h=6);
	       translate([50,100,-1])resize(newsize=[0,15,0])cylinder(d=100,h=6);
	  }
	  translate([-0.1,-10,-1.1])cube([23,73,6.2]);
	  translate([-0.1+77.2,-10,-1.1])cube([23,73,6.2]);

	  /* motor fixation holes */
	  translate([0.5,5,5]){
          translate([26,6.3,-10])cylinder(d=3,h=20);
          translate([42,6.3,-10])cylinder(d=3,h=20);
          translate([57,6.3,-10])cylinder(d=3,h=20);
          translate([73,6.3,-10])cylinder(d=3,h=20);
          translate([49.4,14.3,-10])cylinder(d=3,h=20);
          translate([49.4,25.8,-10])cylinder(d=3,h=20);
          translate([49.4,37.3,-10])cylinder(d=3,h=20);
	  }

	  /* PCB fixation holes */
      translate([20,81.15,-0.1]){
          translate([-2,0,-1])cylinder(d=3,h=20);
          translate([62,0,-1])cylinder(d=3,h=20);
      }

	  /* ball caster fixation holes */
	  translate([50,87,-2])rotate([0,0,180]){
	       translate([0,0,-1])rotate([0,0,0])cylinder(d=20,h=20);
	       for(i=[0:2]){
               translate([12.6*cos(i*120-30),12.6*sin(i*120-30),0])cylinder(d=3,h=10);
	       }    
	  }

	  /* US sensor fixation holes */
      translate([27.8,4.6,-3])cylinder(d=2.5,h=10);
      translate([72.15,4.6,-3])cylinder(d=2.5,h=10);
      
      /* color sensors fixation holes */
      // front
      translate([23,-13,-2])cylinder(d=3,h=10);
      translate([37.5,-14.5,-2])cylinder(d=3,h=10);	  
      translate([100-23,-13,-2])cylinder(d=3,h=10);
      translate([100-37.5,-14.5,-2])cylinder(d=3,h=10);
      
      // wire
      translate([30.25,-14,-2])cylinder(d=6,h=10);
      translate([100-30.25,-14,-2])cylinder(d=6,h=10);
      
      // back
      translate([23.2,100.65,-2])cylinder(d=3,h=10);
      translate([8.8,98.55,-2])cylinder(d=3,h=10);  
      translate([100-23.2,100.65,-2])cylinder(d=3,h=10);
      translate([100-8.8,98.55,-2])cylinder(d=3,h=10);
      
      //wire
      translate([16,99.6,-2])cylinder(d=6,h=10);
      translate([100-16,99.6,-2])cylinder(d=6,h=10);
     }
}

chassis();