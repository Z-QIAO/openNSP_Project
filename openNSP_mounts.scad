// openNSP_project, mounts section version 1.0
// Zexuan Qiao, 2024
// under GPL license ver3

mountLOA = 13.5; //.1
bore = 10; //.1
mainDiameter = 12.5; //.1
bellDiameter = 16; //.1
bell = 5; //.1
endOffset = 1; //.1
decoration = 2; //.1
decoPos = 2; //.1

decoDiameter = mainDiameter + 2;

/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;

difference(){
union(){
cylinder(h = mountLOA - bell, d1 = mainDiameter, d2 = mainDiameter + endOffset);
translate([0,0,mountLOA - bell]) cylinder(h = bell, d1 = bellDiameter, d2 = bellDiameter - endOffset);
translate([0,0,decoPos]) cylinder(h = decoration, d = decoDiameter);
}
cylinder(h = mountLOA, d = bore);
}