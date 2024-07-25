// openNSP_project, common stock version 1.0
// Zexuan Qiao, 2024
// under GPL license ver3

mainStockLOA = 100; //.1

ferruleWood = 25; //.1
ferruleWoodDiameter = 37.8; //.1

decoration1 = 1; //.1
decoration2 = 3; //.1
decoration3 = 1; //.1
decoration1Diameter = 42; //.1
decoration2Diameter = 45; //.1
decoration3Diameter = 42; //.1

main = 46; //.1
mainDiameter1 = 39; //.1
mainDiameter2 = 41.4; //.1

groove = 4; //.1
grooveDiameter = 38; //.1

bagEnd = 20; //.1

inside = 70; //.1
insideDiameter1 = 32.3; //.1
insideDiameter2 = 38.5; //.1

smallGBore = 8; //.1
smallG_X = -12; //.1
smallG_Y = 0; //.1
smallDBore = 8; //.1
smallD_X = -2.8; //.1
smallD_Y = 11.6; //.1
bigGBore = 9.5; //.1
bigG_X = 10.6; //.1
bigG_Y = 4; //.1
bigDBore = 10; //.1
bigD_X = 0; //.1
bigD_Y = -10.5; //.1


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
translate([0,0, mainStockLOA - inside]) cylinder(h = inside, d1 = insideDiameter1, d2 = insideDiameter2);
translate([smallG_X,-smallG_Y, 0]) cylinder(h = mainStockLOA, d = smallGBore);
translate([smallD_X, -smallD_Y,0]) cylinder(h = mainStockLOA, d = smallDBore);
translate([bigG_X, -bigG_Y,0]) cylinder(h = mainStockLOA, d = bigGBore);
translate([bigD_X, -bigD_Y, 0]) cylinder(h = mainStockLOA, d = bigDBore);
}
