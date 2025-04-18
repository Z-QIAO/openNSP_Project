// openNSP_project, blowpipe version 1.0
// Zexuan Qiao, 2024
// under GPL license ver3
// speical thanks to Francis Wood for the extra data on the blowpipe design.

tenon1 = 20;
tenon1Diameter = 12.8;
valveHandle = 6;
valveHeight = 5.1;

main = 20; // [12:1:50]
mainDiameter =14;

shoulder1 = 4;
shoulder2 = 2;
shoulder3 = 4;
shoulder4 = 2;
shoulder1Diameter = 18;
shoulder2Diameter = 16;
shoulder3Diameter = 15;
shoulder4Diameter = 16;

taper1 = 4.6;
taper2 = 42;
taper1Diameter = 16;
taper2Diameter = 19;

tenon2 = 19;
tenon2Diameter = 12.8;

bore = 8.3;

/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;

rotate([0, 90, 0]) difference() {
  union() {
    rotate([0, -180, 0]) cylinder(h = tenon1, d = tenon1Diameter);
    translate([0, 0, 0]) cylinder(h = shoulder1, d =shoulder1Diameter);
    translate([0, 0, 4]) cylinder(h = shoulder2, d =shoulder2Diameter);
    translate([0, 0, 7]) cylinder(h = shoulder3, d =shoulder3Diameter);
    translate([0, 0, 8]) cylinder(h = shoulder4, d =shoulder4Diameter); // Decoration
    cylinder(h = main, d = mainDiameter);
    translate([0, 0, main]) cylinder(h = taper1, d1 = taper1Diameter, d2 = taper2Diameter);
    translate([0, 0, main+taper1]) cylinder(h = taper2, d1 = taper2Diameter, d2 = tenon2Diameter);
    translate([0, 0, main+taper1]) cylinder(h = taper2, d1 = taper2Diameter, d2 = tenon2Diameter);
    translate([0, 0, main+taper1+taper2]) cylinder(h = tenon2, d = tenon2Diameter);
  }
  cylinder(h = main+taper1+taper2+tenon2, d = bore);
  rotate([0, -180, 0]) cylinder(h = tenon1, d = bore);
  rotate([0, 90, 0]) translate([tenon1-valveHandle, -valveHandle/2, valveHeight]) cube(valveHandle);
}
