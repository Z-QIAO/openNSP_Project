blockWidth = 19;
blockLengthSingle = 7;
blockLengthShoulder = 18;
blockLengthPinky = 13;
blockLengthLShape = 16;
blockLengthBack = 20;
blockDecoration = 2;
blockPinHoleSize =1.5;
blockOffset = 12;

chanterDiameter = 12;
chanterBore = 4.3;
chanterLength = 287;
chanterBrassLength = 312;
chanterBrassDiameter = 11.;
chanterLOA = 320;
chanterFootTenor = 8;

reedSocketDiameter = 13.5;
reedSocketBore = 6.5;
reedSocketLength = 16;

singleSlot = 2;
doubleSlot = 5;
slotHeight = 5;

/* [Block placements:] */
blockPosShoulder = 37;
blockPosHighF = 48;
blockPosHighEf = 65;
blockPosHighDf = 80.5;
blockPosMiddleBf = 90.5;
blockPosMiddleAf = 114;
blockPosPinky = 133;
blockPosLShape = 161.5;
blockPosBack = 184;

/* [Hole positions:] */
holePosHighB = 9;
holePosHighBf = 12.5;
holePosHighA = 20;
holePosHighAf = 25.7;
holePosHighG = 31;
holePosHighGf = 37.5;
holePosHighF = 44.8;
holePosHighE = 51.5;
holePosHighEf = 59.4;
holePosHighD = 66.8;
holePosHighDf = 75;
holePosHighC = 83.8;
holePosMiddleB = 96.6;
holePosMiddleBf = 104.5;
holePosMiddleA = 116.4;
holePosMiddleAf = 128;
holePosMiddleG = 139.6;
holePosMiddleGf = 155.2;
holePosMiddleF = 169.5;
holePosMiddleE = 184.5;
holePosMiddleEf = 199.5;
holePosMiddleD = 216.5;
holePosMiddleDf = 234.5;
holePosMiddleC = 254;
holePosLowB = 274.3;

/* [Hole sizes:] */
holeSizeHighB = 4;
holeSizeHighBf = 4;
holeSizeHighA = 4;
holeSizeHighAf = 4;
holeSizeHighG = 4;
holeSizeHighGf = 4;
holeSizeHighF = 4;
holeSizeHighE = 4;
holeSizeHighEf = 4;
holeSizeHighD = 4;
holeSizeHighDf = 4;
holeSizeHighC = 4;
holeSizeMiddleB = 4.3;
holeSizeMiddleBf = 4.3;
holeSizeMiddleA = 4.3;
holeSizeMiddleAf = 4.3;
holeSizeMiddleG = 4.3;
holeSizeMiddleGf = 4.3;
holeSizeMiddleF = 4.3;
holeSizeMiddleE = 4.3;
holeSizeMiddleEf = 4.3;
holeSizeMiddleD = 4.3;
holeSizeMiddleDf = 4.3;
holeSizeMiddleC = 4.3;
holeSizeLowB = 4.3;

/* [Keypad Seat sizes:] */
padSizeHighB = 8;
padSizeHighBf = 8;
padSizeHighA = 8;
padSizeHighAf = 8;
padSizeHighF = 8;
padSizeHighEf = 8;
padSizeHighDf = 8;
padSizeMiddleBf = 9.5;
padSizeMiddleAf = 9.5;
padSizeMiddleGf = 9.5;
padSizeMiddleF = 9.5;
padSizeMiddleE = 9.5;
padSizeMiddleEf = 9.5;
padSizeMiddleD = 9.5;
padSizeMiddleDf = 9.5;
padSizeMiddleC = 9.5;
padSizeLowB = 9.5;

/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;

module keyblockMount(blockLength, blockPos) {
  translate([0, blockPos, 0]) {
    intersection() {
      intersection() {
        difference() {
          translate([0, 0, -blockWidth/2]) cube([blockWidth/2, blockLength, blockWidth]);
          translate([blockWidth/2, 0, -blockWidth/2]) cylinder(h=blockWidth, d = blockDecoration);
          translate([blockWidth/2, blockLength, -blockWidth/2]) cylinder(h=blockWidth, d = blockDecoration);
          translate([blockWidth/2-2, blockLength/2, -blockWidth/2]) cylinder(h=blockWidth, d = blockPinHoleSize); // aix hole
        }
        translate([0, 0, -blockWidth/2-blockOffset/2]) {
          rotate([-90, 0, 0]) {
            cylinder(h =blockLength, d = blockWidth+chanterDiameter+blockOffset);
          }
        }
      }
      translate([0, 0, blockWidth/2+blockOffset/2]) {
        rotate([-90, 0, 0]) {
          cylinder(h =blockLength, d = blockWidth+chanterDiameter+blockOffset);
        }
      }
    }
  }
}

module pinkyBlock() {
  translate([0, blockPosPinky, 0]) {
    intersection() {
        union() {
          translate([0, 0, -blockWidth/2]) cube([blockWidth/2, blockLengthPinky, blockWidth]);
          rotate([90, 0, 0]) cylinder(h = blockLengthPinky/4, d1 = blockWidth, d2 = chanterDiameter);
          rotate([-90, 0, 0]) translate([0, 0, blockLengthPinky ])cylinder(h = blockLengthPinky/4, d1 = blockWidth, d2 = chanterDiameter);
        }
      translate([0, -blockLengthPinky, -blockWidth/2-blockOffset/2])rotate([-90, 0, 0]) cylinder(h =blockLengthPinky*3, d = blockWidth+chanterDiameter+blockOffset);
      translate([0, -blockLengthPinky, 0]) rotate([-90, 0, 0])cylinder(h = blockLengthPinky*3, d = blockWidth);
    }
  }
}

module keypadSeatCut(holeCentre, padHeight, padSize ) {
  translate ([0, holeCentre, 4]) {
    difference() {
      cylinder(h = 10, d =padSize);
      cylinder(h= padHeight, d1 = padSize, d2 =0);
    }
  }
}

module keySlot(start, end, width, height) {
  rotate([0, -90, 0])translate([5, start, -width/2])cube([height, abs(end-start), width]);
}

difference() {

  union() {
    rotate([90, 0, 0]) {
      cylinder(h = reedSocketLength, d =reedSocketDiameter);
    } // stock tenon

    rotate([-90, 0, 0]) {
      cylinder(h = chanterLength, d = chanterDiameter);
      cylinder(h = chanterBrassLength, d = chanterBrassDiameter);
      cylinder(h = chanterLOA, d = chanterFootTenor);
    } // chanter main

    rotate([0, 0, 0]) {
      keyblockMount(blockLengthShoulder, blockPosShoulder);
      keyblockMount(blockLengthSingle, blockPosHighDf);
      keyblockMount(blockLengthLShape, blockPosLShape);
    } // left blocks

    rotate([0, 180, 0]) {
      keyblockMount(blockLengthShoulder, blockPosShoulder);
      translate([0, blockPosLShape, 0]) {
        intersection() {
            difference() {
              translate([0, 0, -blockWidth/2]) cube([blockWidth/2, blockLengthLShape/2, blockWidth]);
              translate([blockWidth/2, 0, -blockWidth/2]) cylinder(h=blockWidth, d = blockDecoration);
            }
            translate([0, 0, -blockWidth/2-blockOffset/2]) rotate([-90, 0, 0]) cylinder(h =blockLengthLShape/2, d = blockWidth+chanterDiameter+blockOffset);
          translate([0, 0, blockWidth/2+blockOffset/2]) rotate([-90, 0, 0]) cylinder(h =blockLengthLShape/2, d = blockWidth+chanterDiameter+blockOffset);
        }
      } // L block right side
    } // right blocks

    rotate([0, 90, 0]) {
      keyblockMount(blockLengthSingle, blockPosHighEf);
      keyblockMount(blockLengthSingle, blockPosHighF);
      keyblockMount(blockLengthBack, blockPosBack);
    } // back blocks

    rotate([0, 135, 0]) {
      keyblockMount(blockLengthSingle, blockPosMiddleBf);
      keyblockMount(blockLengthSingle, blockPosMiddleAf);
    } // left back blocks

    mirror([1, 0, 0]) pinkyBlock();
    pinkyBlock();

    rotate([-90, 0, 0]) {
      translate([0, 0, 0]) cylinder(h = 4, d =18);
      translate([0, 0, 4]) cylinder(h = 2, d =16);
      translate([0, 0, 7]) cylinder(h = 4, d =13);
      translate([0, 0, 8]) cylinder(h = 2, d =15);
      translate([0, 0, 222]) cylinder(h = 6, d =14);
      translate([0, 0, 223]) cylinder(h = 4, d =16);
      translate([0, 0, 263]) cylinder(h = 6, d =14);
      translate([0, 0, 264]) cylinder(h = 4, d =16);
      translate([0, 0, 281]) cylinder(h = 6, d =13);
      translate([0, 0, 282]) cylinder(h = 4, d =15);
    }// Decoration
  }


  union() {
    rotate([0, 0, 0]) {
      translate([0, holePosHighGf, 0]) cylinder(h = 10, d = holeSizeHighGf);// F sharp finger
      translate([0, holePosHighE, 0]) cylinder(h = 10, d = holeSizeHighE); // E finger
      translate([0, holePosHighD, 0]) cylinder(h = 10, d = holeSizeHighD); // D finger
      translate([0, holePosHighC, 0]) cylinder(h = 10, d = holeSizeHighC); // C finger
      translate([0, holePosMiddleB, 0]) cylinder(h = 10, d = holeSizeMiddleB); // B finger
      translate([0, holePosMiddleA, 0]) cylinder(h = 10, d = holeSizeMiddleA); // A finger
      translate([0, holePosMiddleG, 0]) cylinder(h = 10, d = holeSizeMiddleG); // G finger
    } //front holes

    rotate([0, 180, 0]) {
      translate([0, holePosHighG, 0])cylinder(h = 10, d = holeSizeHighG);// Thumb G
      translate([0, holePosHighF, 0])cylinder(h = 10, d = holeSizeHighF);// F
      keypadSeatCut(holePosHighF, 0.7, padSizeHighF);
      keySlot(holePosHighF, blockPosHighF+blockLengthSingle, singleSlot, slotHeight);

      translate([0, holePosHighEf, 0])cylinder(h = 10, d = holeSizeHighEf);// E flat
      keySlot(holePosHighEf, blockPosHighEf+blockLengthSingle, singleSlot, slotHeight);
      keypadSeatCut(holePosHighEf, 0.7, padSizeHighEf);

      translate([0, holePosMiddleGf, 0])cylinder(h = 10, d = holeSizeMiddleGf); // G flat
      translate([0, holePosMiddleF, 0]) cylinder(h = 10, d = holeSizeMiddleF); // F
      keypadSeatCut(holePosMiddleGf, 0.8, padSizeMiddleGf);
      keypadSeatCut(holePosMiddleF, 0.8, padSizeMiddleF);
      keySlot(blockPosPinky-blockLengthPinky/4, holePosMiddleF, doubleSlot, slotHeight);

      translate([0, holePosMiddleC, 0]) cylinder(h = 10, d = holeSizeMiddleC); // C
      translate([0, holePosLowB, 0]) cylinder(h = 10, d = holeSizeLowB); //Low B
      keypadSeatCut(holePosMiddleC, 0.8, padSizeMiddleC);
      keypadSeatCut(holePosLowB, 0.8, padSizeLowB);
      keySlot(blockPosBack, holePosLowB, doubleSlot, slotHeight);
    } //back holes and pad seats

    rotate([0, -90, 0]) {
      translate([0, holePosHighBf, 0]) cylinder(h = 10, d = holeSizeHighBf); // B flat
      translate([0, holePosHighA, 0]) cylinder(h = 10, d = holeSizeHighA); // A
      keypadSeatCut(holePosHighBf, 0.7, padSizeHighBf);
      keypadSeatCut(holePosHighA, 0.7, padSizeHighA);
      keySlot(holePosHighBf, blockPosShoulder+blockLengthShoulder, doubleSlot, slotHeight);

      translate([0, holePosMiddleE, 0]) cylinder(h = 10, d = holeSizeMiddleE); // E
      translate([0, holePosMiddleDf, 0]) cylinder(h = 10, d = holeSizeMiddleDf); // D flat
      keypadSeatCut(holePosMiddleDf, 0.8, padSizeMiddleDf);
      keypadSeatCut(holePosMiddleE, 0.8, padSizeMiddleE);
      keySlot(blockPosPinky-blockLengthPinky/4, holePosMiddleDf, doubleSlot, slotHeight);
    } // right holes and pad seats

    rotate([0, 90, 0]) {
      translate([0, holePosHighB, 0]) cylinder(h = 10, d = holeSizeHighB); // B
      keySlot(holePosHighB, blockPosShoulder+blockLengthShoulder, doubleSlot, slotHeight );
      keypadSeatCut(holePosHighB, 0.7, padSizeHighB);

      translate([0, holePosHighAf, 0]) cylinder(h = 10, d = holeSizeHighAf); // A flat
      translate([0, holePosHighDf, 0]) cylinder(h = 10, d = holeSizeHighDf); // D flat
      keypadSeatCut(holePosHighAf, 0.7, padSizeHighAf);
      keypadSeatCut(holePosHighDf, 0.7, padSizeHighDf);
      keySlot(holePosHighDf, blockPosHighDf+blockLengthSingle, singleSlot, slotHeight );

      translate([0, holePosMiddleEf, 0]) cylinder(h = 10, d = holeSizeMiddleEf); // E flat
      translate([0, holePosMiddleD, 0]) cylinder(h = 10, d = holeSizeMiddleD); // D
      keypadSeatCut(holePosMiddleEf, 0.8, padSizeMiddleEf);
      keypadSeatCut(holePosMiddleD, 0.8, padSizeMiddleD);
      keySlot(blockPosPinky-blockLengthPinky/4, holePosMiddleD, doubleSlot, slotHeight);
    } // left holes and pad seats

    rotate([0, -135, 0]) {

      translate([0, holePosMiddleBf, 0]) cylinder(h = 10, d = holeSizeMiddleBf); // B flat
      keypadSeatCut(holePosMiddleBf, 0.8, padSizeMiddleBf);
      keySlot(blockPosMiddleBf, holePosMiddleBf, singleSlot, slotHeight );

      translate([0, holePosMiddleAf, 0]) cylinder(h = 10, d = holeSizeMiddleAf); // A flat
      keypadSeatCut(holePosMiddleAf, 0.8, padSizeMiddleAf);
      keySlot(blockPosMiddleAf, holePosMiddleAf, singleSlot, slotHeight );
    } // left back holes and pad seats

    rotate([0, 180, 0]) translate([0, blockPosPinky, 0]) translate([blockWidth/2-2, blockLengthPinky/2, -blockWidth/2]) cylinder(h=blockWidth, d = blockPinHoleSize); // right pinky block axis
    rotate([0, 90, 0]) translate([0, blockPosPinky, 0])
      translate([blockWidth/2-2, blockLengthPinky/2, -blockWidth/2]) cylinder(h=blockWidth, d = blockPinHoleSize); // back pinky block axis
    rotate([90, 0, 0]) cylinder(h = reedSocketLength, d = reedSocketBore); // reed socket bore
    rotate([-90, 0, 0]) cylinder(h = chanterLOA, d = chanterBore); // main bore
  }
}
