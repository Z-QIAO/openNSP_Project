midsection_len = 30;
tenon_len = 16;
tenon_diameter = 13.5;
bottom_inside = tenon_diameter - 0.3;
wall_thickness = 3.5;
bottom_outside = bottom_inside + wall_thickness;
top_outside = tenon_diameter;
top_inside = tenon_diameter - wall_thickness;
bottom_len = tenon_len + 2;

// Mid-section
difference(){
  cylinder(
      midsection_len,
      bottom_outside,
      bottom_outside
  );
  cylinder(
    midsection_len,
    top_inside,
    top_inside
  );
};

// Bottom section
translate([0, 0, -1 * bottom_len]) {
  difference(){
    cylinder(
      bottom_len,
      bottom_outside,
      bottom_outside
    );
    cylinder(
      bottom_len,
      bottom_inside,
      bottom_inside
    );
  };
};

// Top section
translate([0, 0, midsection_len]) {
  difference(){
    cylinder(
      tenon_len,
      top_outside,
      top_outside
    );
    cylinder(
      tenon_len,
      top_inside,
      top_inside
    );
  };
};