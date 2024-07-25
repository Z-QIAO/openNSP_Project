// openNSP_project, end caps section version 1.0
// Zexuan Qiao, 2024
// under GPL license ver3

capLOA = 12; //.1
chamber = 8.5; //.1
bore = 8; //.1
mainDiameter = 10; //.1
pin = 2; //.1
bell = 20; //.1
endOffset = 2; //.1
decoration = 2; //.1
decoPos = 2; //.1

decoDiameter = mainDiameter + 2;
/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;

difference(){
union(){
cylinder(h = chamber, d1 = mainDiameter, d2 = mainDiameter + endOffset);
translate([0,0,chamber]) cylinder(h = capLOA - chamber, d1 = bell, d2 = bell - endOffset);
translate([0,0,decoPos]) cylinder(h = decoration, d = decoDiameter);
}
cylinder(h = chamber, d = bore);
cylinder(h = capLOA, d = pin);
}
