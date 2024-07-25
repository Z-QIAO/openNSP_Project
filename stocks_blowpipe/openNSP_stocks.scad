// openNSP_project, chanter and blowpipe stock version 1.1
// Zexuan Qiao, 2024
// under GPL license ver3

stockLOA = 80; //.1

ferruleWood = 25; //.1
ferruleWoodDiameter = 20.6; //.1

decoration1 = 1; //.1
decoration2 = 2; //.1
decoration3 = 1; //.1
decoration1Diameter = 23; //.1
decoration2Diameter = 24.5; //.1
decoration3Diameter = 23; //.1

mainDiameter1 = 22.3; //.1
mainDiameter2 = 22.7; //.1

groove = 4; //.1
grooveDiameter = 20; //.1

bagEnd = 8; //.1

boreDiameter1 = 15.5; //.1
tenon = 26; //.1
boreDiameter2 = 13.5; //.1

main = stockLOA-ferruleWood-decoration1-decoration2-decoration3-groove-bagEnd;

/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;

rotate([0,-90,0]) difference(){
union(){
cylinder(h = ferruleWood, d = ferruleWoodDiameter);
translate([0,0,ferruleWood]) cylinder(h = decoration1, d = decoration1Diameter);
translate([0,0,ferruleWood+decoration1]) cylinder(h = decoration2, d = decoration2Diameter);
translate([0,0,ferruleWood+decoration1+decoration2])cylinder(h = decoration3, d = decoration3Diameter);
translate([0,0,ferruleWood+decoration1+decoration2+decoration3]) cylinder(h = main, d1 = mainDiameter1, d2 = mainDiameter2);
translate([0,0,ferruleWood+decoration1+decoration2+decoration3+main]) cylinder(h = groove, d = grooveDiameter);
translate([0,0,ferruleWood+decoration1+decoration2+decoration3+main]) cylinder(h = groove, d = grooveDiameter);
translate([0,0,ferruleWood+decoration1+decoration2+decoration3+main+groove]) cylinder(h = bagEnd, d = mainDiameter2);
}
translate([0,0,0]) cylinder(h = tenon, d = boreDiameter2);
translate([0,0,tenon]) cylinder(h = stockLOA-tenon, d = boreDiameter1);
}
