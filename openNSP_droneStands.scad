// openNSP_project, drone stand section version 1.0
// Zexuan Qiao, 2024
// under GPL license ver3

droneStandLOA = 214.0; //.1
turningPin = 70.0; //.1
turningPinDiameter = 8.7; //.1
topMountWood = 13.5; //.1
topMountWoodDiameter = 10; //.1
topFerruleWood = 25; //.1
topFerruleWoodDiameter = 11.1; //.1

mainWooden = 39.0; //.1
mainWoodenDiameter = 12.0; //.1

decoration1 = 1; //.1
decoration2 = 2.0; //.1
decoration3 = 1.0; //.1
gap = 1.0; //.1
decoration4 = 1.0; //.1
decoration5 = 2.0; //.1
decoration6 = 1.0; //.1

decoration1Diameter = 13.0; //.1
decoration2Diameter = 14.5; //.1
decoration3Diameter = 13.0; //.1
decoration4Diameter = 13.0; //.1
decoration5Diameter = 14.5; //.1
decoration6Diameter = 13.0; //.1

bottomFerruleWood = 22; //.1
bottomFerruleWoodDiameter = 11.1; //.1

bottomMountWood = 13.5; //.1
bottomMountWoodDiameter = 10; //.1

tenon = 28; //.1
tenonDiameter = 8.9; //.1

mainBore = 3.5; //.1

reedSocket = 6; //.1
reedSocketDiameter = 5.6; //.1

/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;


rotate([0, 90, 0]) {
  difference() {
    union() {
    cylinder(h = turningPin, d = turningPinDiameter);
    translate([0,0,turningPin]) cylinder(h = topMountWood, d = topMountWoodDiameter);
    translate([0,0,turningPin+topMountWood]) cylinder(h = topFerruleWood, d = topFerruleWoodDiameter);
    translate([0,0,turningPin+topMountWood+topFerruleWood]) cylinder(h = mainWooden, d = mainWoodenDiameter);
    translate([0,0,turningPin+topMountWood+topFerruleWood+mainWooden]) cylinder(h = bottomFerruleWood, d = bottomFerruleWoodDiameter);
    translate([0,0,turningPin+topMountWood+topFerruleWood+mainWooden+bottomFerruleWood]) cylinder(h = bottomMountWood, d = bottomMountWoodDiameter);
    translate([0,0,turningPin+topMountWood+topFerruleWood+mainWooden+bottomFerruleWood+ bottomMountWood]) cylinder(h = tenon, d = tenonDiameter);
    
     translate([0,0,turningPin+topMountWood+topFerruleWood+mainWooden/2]) union() {
    translate([0,0,-decoration1-decoration2-decoration3-gap/2 ]) cylinder(h = decoration1, d = decoration1Diameter);
      translate([0,0,-decoration2-decoration3-gap/2 ]) cylinder(h = decoration2, d = decoration2Diameter);
      translate([0,0,-decoration3-gap/2 ]) cylinder(h = decoration3, d = decoration3Diameter);
    translate([0,0,+gap/2 ]) cylinder(h = decoration4, d = decoration4Diameter); 
    translate([0,0,decoration4+gap/2 ]) cylinder(h = decoration5, d = decoration5Diameter);
       translate([0,0,decoration4+decoration5+gap/2 ]) cylinder(h = decoration6, d = decoration6Diameter);
    }
    
    }
    cylinder(h = droneStandLOA, d = mainBore);
    translate([0,0,droneStandLOA-reedSocket])    cylinder(h = reedSocket, d1 = mainBore, d2 =reedSocketDiameter);
  }
}
