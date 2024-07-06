// openNSP_project, drone top section version 1.0.1
// Zexuan Qiao, 2024
// under GPL license ver3

droneTopLOA = 214.0; //.1
bellTenon = 8.0; //.1
bellTenonDiameter = 7; //.1
topFerruleWood = 22; //.1
topFerruleWoodDiameter = 8.7; //.1
topWooden1 = 34.0; //.1
topWoodenDiameter = 9.5; //.1
beadFerruleWood = 11.0; //.1
beadFerruleWoodDiameter = 8.5; //.1
topWooden2 = 1.0; //.1
mainWooden = 48.0; //.1
mainWoodenDiameter = 12.0; //.1

decoration1 = 5.0; //.1
decoration2 = 1.0; //.1
decoration3 = 2.0; //.1
decoration4 = 1.0; //.1

decoration1Diameter = 14.0; //.1
decoration2Diameter = 16.0; //.1
decoration3Diameter = 18.0; //.1
decoration4Diameter = 16.0; //.1

chamberWooden = 81.0; //.1
chamberWoodenDiameter = 12.7; //.1

chamberBore = 9.5; //.1
chamberBoreLength = 70.0; //.1

mainBore =4.0; //.1

sideHoleDiameter = 4.0; //.1

hole1Pos = 145.0; //.1
hole2Pos = 201.0; //.1

/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;


rotate([0, 90, 0]) {
  difference() {
    union() {
      cylinder(h = chamberWooden, d = chamberWoodenDiameter);
      translate([0, 0, chamberWooden]) cylinder(h = decoration4, d = decoration4Diameter);
      translate([0, 0, chamberWooden+decoration4]) cylinder(h = decoration3, d = decoration3Diameter);
      translate([0, 0, chamberWooden+decoration4+decoration3]) cylinder(h = decoration2, d = decoration2Diameter);
      translate([0, 0, chamberWooden+decoration4+decoration3+decoration2]) cylinder(h = decoration1, d1 = decoration1Diameter, d2 = mainWoodenDiameter);
      translate([0, 0, chamberWooden+decoration4+decoration3+decoration2+decoration1]) cylinder(h = mainWooden, d = mainWoodenDiameter);
      translate([0, 0, chamberWooden+decoration4+decoration3+decoration2+decoration1+mainWooden]) cylinder(h = topWooden2, d = topWoodenDiameter);
      translate([0, 0, chamberWooden+decoration4+decoration3+decoration2+decoration1+mainWooden+topWooden2]) cylinder(h = beadFerruleWood, d = beadFerruleWoodDiameter);
      translate([0, 0, chamberWooden+decoration4+decoration3+decoration2+decoration1+mainWooden+topWooden2+beadFerruleWood]) cylinder(h = topWooden1, d = topWoodenDiameter);
      translate([0, 0, chamberWooden+decoration4+decoration3+decoration2+decoration1+mainWooden+topWooden2+beadFerruleWood+topWooden1]) cylinder(h = topFerruleWood, d = topFerruleWoodDiameter);
      translate([0, 0, chamberWooden+decoration4+decoration3+decoration2+decoration1+mainWooden+topWooden2+beadFerruleWood+topWooden1+topFerruleWood]) cylinder(h = bellTenon, d = bellTenonDiameter);
    }
    cylinder(h = chamberBoreLength, d = chamberBore);
    cylinder(h = droneTopLOA, d = mainBore);
    rotate([90, 0, 0]) translate([0, hole1Pos, 0]) cylinder(h = 10, d = sideHoleDiameter);
    rotate([90, 0, 0]) translate([0, hole2Pos, 0]) cylinder(h = 10, d = sideHoleDiameter);
  }
}
