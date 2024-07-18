// openNSP_project, chanter section version 1.3
// Zexuan Qiao, 2024
// under GPL license ver3

/* [Chanter basic:] */
// the main external diameter of the chanter
chanterDiameter = 12;
// the length of the visible section of the chanter
chanterLOA = 320;
chanterBrassLength = 25;
chanterBrassDiameter = 11;
chanterFootTenor = 8;
// chanter bore size
chanterBore = 4.3;

/* [decorations:] */
shoulder1 = [0, 4, 18];
shoulder2 = [4, 2, 16];
shoulder3 = [7, 4, 13];
shoulder4 = [8, 2, 15];
centreRing = [127, 2, 14];
ring1 = [222, 6, 14];
ring2 = [223, 4, 16];
ring3 = [263, 6, 14];
ring4 = [264, 4, 16];
ring5 = [281, 6, 13];
ring6 = [282, 4, 15];

/* [Reed socket and tenon:] */
reedSocketDiameter = 13.5;
reedSocketLength = 16;
// close end
reedSocketBore1 = 6.5;
// open end, enlarge this number can get a tapered socket
reedSocketBore2 = 6.5;

/* [Keymount blocks:] */
blockWidth = 19;
blockLengthSingle = 7;
blockLengthShoulder = 18;
blockLengthPinky = 13;
blockLengthLShape = 16;
blockLengthBack = 20;
blockDecoration = 2;
blockPinHoleSize =1.5;
blockOffset = 15;
singleSlot = 2;
doubleSlot = 5;
slotHeight = 5;
doubleSpace = 1.5;

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

/* [Finger hole: EW, NS, position] */
highG = [4, 4, 31]; //.1
highGf = [4, 4, 37.5]; //.1
highE = [4, 4, 51.5]; //.1
highD = [4, 4, 66.8]; //.1
highC = [4, 4, 83.8]; //.1
middleB = [4.3, 4.3, 96.6]; //.1
middleA = [4.3, 4.3, 116.4]; //.1
middleG = [4.3, 4.3, 139.6]; //.1

/* [Key hole: EW, NS, position, pad size] */
_highB = true;
highB = [4, 4, 9, 8]; //.1
_highBf = true;
highBf = [4, 4, 12.5, 8]; //.1
_highA = true;
highA = [4, 4, 20, 8]; //.1
_highAf = true;
highAf = [4, 4, 25.7, 8]; //.1
_highF = true;
highF = [4, 4, 44.8, 8]; //.1
_highEf = true;
highEf = [4, 4, 59.4, 8]; //.1
_highDf = true;
highDf = [4, 4, 75, 8]; //.1
_middleBf = true;
middleBf = [4.3, 4.3, 104.5, 9.5]; //.1
_middleAf = true;
middleAf = [4.3, 4.3, 128, 9.5]; //.1
_middleGf = true;
middleGf = [4.3, 4.3, 155.2, 9.5]; //.1
_middleF = true;
middleF = [4.3, 4.3, 169.5, 9.5]; //.1
_middleE = true;
middleE = [4.3, 4.3, 184.5, 9.5]; //.1
_middleEf = true;
middleEf = [4.3, 4.3, 199.5, 9.5]; //.1
_middleD = true;
middleD = [4.3, 4.3, 216.5, 9.5]; //.1
_middleDf = true;
middleDf = [4.3, 4.3, 234.5, 9.5]; //.1
_middleC = true;
middleC = [4.3, 4.3, 254, 9.5]; //.1
_lowB = true;
lowB = [4.3, 4.3, 274.3, 9.5]; //.1

/* [Utilities] */
// Segments, the higher the value, the smoother the surface would be.
$fn = 20;

chanterLength = chanterLOA - chanterBrassLength - chanterFootTenor;

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
        translate([0, 0, -blockWidth/2-blockOffset/2]) rotate([-90, 0, 0]) cylinder(h =blockLength, d = blockWidth+chanterDiameter+blockOffset);
      }
      translate([0, 0, blockWidth/2+blockOffset/2]) rotate([-90, 0, 0]) cylinder(h =blockLength, d = blockWidth+chanterDiameter+blockOffset);
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

module LBlock() {
  translate([0, blockPosLShape, 0]) {
    intersection() {
      difference() {
        translate([0, 0, -blockWidth/2]) cube([blockWidth/2, blockLengthLShape/2, blockWidth]);
        translate([blockWidth/2, 0, -blockWidth/2]) cylinder(h=blockWidth, d = blockDecoration);
      }
      translate([0, 0, -blockWidth/2-blockOffset/2]) rotate([-90, 0, 0]) cylinder(h =blockLengthLShape/2, d = blockWidth+chanterDiameter+blockOffset);
      translate([0, 0, blockWidth/2+blockOffset/2]) rotate([-90, 0, 0]) cylinder(h =blockLengthLShape/2, d = blockWidth+chanterDiameter+blockOffset);
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

rotate([0, 0, -90]) difference() {
  union() {
    rotate([90, 0, 0]) {
      cylinder(h = reedSocketLength, d =reedSocketDiameter);
    } // stock tenon

    rotate([-90, 0, 0]) {
      cylinder(h = chanterLength, d = chanterDiameter);
      cylinder(h = chanterLOA-chanterFootTenor, d = chanterBrassDiameter);
      cylinder(h = chanterLOA, d = chanterFootTenor);
    } // chanter main

    rotate([0, 0, 0]) {
      if (_highDf == true) keyblockMount(blockLengthSingle, blockPosHighDf);
      if (_highB == true || _highAf == true)     keyblockMount(blockLengthShoulder, blockPosShoulder);
      if (_middleEf == true || _middleD == true)keyblockMount(blockLengthLShape, blockPosLShape);
    } // right blocks

    rotate([0, 180, 0]) {
      if (_highBf == true || _highA == true)    keyblockMount(blockLengthShoulder, blockPosShoulder);
      if (_middleDf == true || _middleE == true) LBlock();
    } // left blocks

    rotate([0, 90, 0]) {
      if (_highF == true) keyblockMount(blockLengthSingle, blockPosHighF);
      if (_highEf == true) keyblockMount(blockLengthSingle, blockPosHighEf);
      if (_lowB == true || _middleC == true) keyblockMount(blockLengthBack, blockPosBack);
    } // back blocks

    rotate([0, 135, 0]) {
      if (_middleBf == true) keyblockMount(blockLengthSingle, blockPosMiddleBf);
      if (_middleAf == true) keyblockMount(blockLengthSingle, blockPosMiddleAf);
    } // left back blocks

    if (_middleEf == true || _middleD == true || _middleDf == true || _middleE == true || _middleGf == true || _middleF == true) {
      mirror([1, 0, 0]) pinkyBlock();
      pinkyBlock();
    }
    rotate([-90, 0, 0]) {

      translate([0, 0, centreRing[0]]) cylinder(h = centreRing[1], d = centreRing[2]);
      translate([0, 0, shoulder1[0]]) cylinder(h = shoulder1[1], d = shoulder1[2]);
      translate([0, 0, shoulder2[0]]) cylinder(h = shoulder2[1], d = shoulder2[2]);
      translate([0, 0, shoulder3[0]]) cylinder(h = shoulder3[1], d = shoulder3[2]);
      translate([0, 0, shoulder4[0]]) cylinder(h = shoulder4[1], d = shoulder4[2]);
      translate([0, 0, ring1[0]]) cylinder(h = ring1[1], d = ring1[2]);
      translate([0, 0, ring2[0]]) cylinder(h = ring2[1], d = ring2[2]);
      if (_lowB == true || _middleC == true) {
        translate([0, 0, ring3[0]]) cylinder(h = ring3[1], d = ring3[2]);
        translate([0, 0, ring4[0]]) cylinder(h = ring4[1], d = ring4[2]);
      }
      translate([0, 0, ring5[0]]) cylinder(h = ring5[1], d = ring5[2]);
      translate([0, 0, ring6[0]]) cylinder(h = ring6[1], d = ring6[2]);
    }// Decoration
  }

  union() {
    rotate([0, 0, 0]) {
      translate([0, highGf[2], 0]) scale([1, highGf[1]/highGf[0]]) cylinder(h = 10, d = highGf[0]);// F sharp finger
      translate([0, highE[2], 0]) scale([1, highE[1]/highE[0]]) cylinder(h = 10, d = highE[0]); // E finger
      translate([0, highD[2], 0]) scale([1, highD[1]/highD[0]]) cylinder(h = 10, d = highD[0]); // D finger
      translate([0, highC[2], 0]) scale([1, highC[1]/highC[0]]) cylinder(h = 10, d = highC[0]); // C finger
      translate([0, middleB[2], 0]) scale([1, middleB[1]/ middleB[0]]) cylinder(h = 10, d = middleB[0]); // B finger
      translate([0, middleA[2], 0]) scale([1, middleA[1]/ middleA[0]]) cylinder(h = 10, d = middleA[0]); // A finger
      translate([0, middleG[2], 0]) scale([1, middleG[1]/ middleG[0]]) cylinder(h = 10, d = middleG[0]); // G finger
    } //front holes

    rotate([0, 180, 0]) {
      translate([0, highG[2], 0]) scale([1, highG[1]/highG[0]]) cylinder(h = 10, d = highG[0]);// Thumb G
      if (_highF == true) {
        translate([0, highF[2], 0]) scale([1, highF[1]/highF[0]]) cylinder(h = 10, d = highG[0]);// F
        keypadSeatCut(highF[2], 0.7, highF[3]);
        keySlot(highF[2], blockPosHighF+blockLengthSingle, singleSlot, slotHeight);
      }
      if (_highEf == true) {
        translate([0, highEf[2], 0]) scale([1, highEf[1]/highEf[0]]) cylinder(h = 10, d = highEf[0]);// E flat
        keypadSeatCut(highEf[2], 0.7, highEf[3]);
        keySlot(highEf[2], blockPosHighEf+blockLengthSingle, singleSlot, slotHeight);
      }
      if (_middleGf == true) {
        translate([0, middleGf[2], 0]) scale([1, middleGf[1]/ middleGf[0]]) cylinder(h = 10, d = middleGf[0]); // G flat
        keypadSeatCut(middleGf[2], 0.8, middleGf[3]);
        translate([-doubleSpace, 0, 0])keySlot(blockPosPinky-blockLengthPinky/4, middleGf[2], singleSlot, slotHeight);
      }
      if (_middleF == true) {
        translate([0, middleF[2], 0])scale([1, middleF[1]/ middleF[0]]) cylinder(h = 10, d = middleF[0]); // F
        keypadSeatCut(middleF[2], 0.8, middleF[3]);
        translate([doubleSpace, 0, 0]) keySlot(blockPosPinky-blockLengthPinky/4, middleF[2], singleSlot, slotHeight);
      }
      if (_middleC == true) {
        translate([0, middleC[2], 0]) scale([1, middleC[1]/ middleC[0]]) cylinder(h = 10, d = middleC[0]); // C
        keypadSeatCut(middleC[2], 0.8, middleC[3]);
        translate([doubleSpace, 0, 0])keySlot(blockPosBack, middleC[2], singleSlot, slotHeight);
      }
      if (_lowB == true) {
        translate([0, lowB[2], 0]) scale([1, lowB[1]/ lowB[0]]) cylinder(h = 10, d = lowB[0]); //Low B
        keypadSeatCut(lowB[2], 0.8, lowB[3]);
        translate([-doubleSpace, 0, 0])keySlot(blockPosBack, lowB[2], singleSlot, slotHeight);
      }
    } //back holes and pad seats

    rotate([0, -90, 0]) {
      if (_highBf == true) {
        translate([0, highBf[2], 0]) scale([1, highBf[1]/highBf[0]]) cylinder(h = 10, d = highBf[0]); // B flat
        keypadSeatCut(highBf[2], 0.7, highBf[3]);
        translate([-doubleSpace, 0, 0]) keySlot(highBf[2], blockPosShoulder+blockLengthShoulder, singleSlot, slotHeight);
      }
      if (_highA == true) {
        translate([0, highA[2], 0]) scale([1, highA[1]/highA[0]]) cylinder(h = 10, d = highA[0]); // A
        keypadSeatCut(highA[2], 0.7, highA[3]);
        translate([doubleSpace, 0, 0]) keySlot(highA[2], blockPosShoulder+blockLengthShoulder, singleSlot, slotHeight);
      }
      if (_middleE == true) {
        translate([0, middleE[2], 0]) scale([1, middleE[1]/middleE[0]]) cylinder(h = 10, d = middleE[0]); // E
        keypadSeatCut(middleE[2], 0.8, middleE[3]);
        translate([doubleSpace, 0, 0]) keySlot(blockPosPinky-blockLengthPinky/4, middleE[2], singleSlot, slotHeight);
      }
      if (_middleDf == true) {
        translate([0, middleDf[2], 0]) scale([1, middleDf[1]/middleDf[0]]) cylinder(h = 10, d = middleDf[0]); // D flat
        keypadSeatCut(middleDf[2], 0.8, middleDf[3]);
        translate([-doubleSpace, 0, 0]) keySlot(blockPosPinky-blockLengthPinky/4, middleDf[2], singleSlot, slotHeight);
      }
    } // left holes and pad seats

    rotate([0, 90, 0]) {
      if ( _highB == true) {
        translate([0, highB[2], 0]) scale([1, highB[1]/highB[0]]) cylinder(h = 10, d = highB[0]); // B
        keypadSeatCut(highB[2], 0.7, highB[3]);
        translate([-doubleSpace, 0, 0]) keySlot(highB[2], blockPosShoulder+blockLengthShoulder, singleSlot, slotHeight );
      }
      if ( _highAf == true) {
        translate([0, highAf[2], 0]) scale([1, highAf[1]/highAf[0]]) cylinder(h = 10, d = highAf[0]); // A flat
        keypadSeatCut(highAf[2], 0.7, highAf[3]);
        translate([doubleSpace, 0, 0]) keySlot(highAf[2], blockPosShoulder+blockLengthShoulder, singleSlot, slotHeight );
      }
      if (_highDf == true) {
        translate([0, highDf[2], 0]) scale([1, highDf[1]/highDf[0]]) cylinder(h = 10, d = highDf[0]); // D flat
        keypadSeatCut(highDf[2], 0.7, highDf[3]);
        keySlot(highDf[2], blockPosHighDf+blockLengthSingle, singleSlot, slotHeight );
      }
      if (_middleEf == true) {
        translate([0, middleEf[2], 0]) scale([1, middleEf[1]/middleEf[0]]) cylinder(h = 10, d = middleEf[0]); // E flat
        keypadSeatCut(middleEf[2], 0.8, middleEf[3]);
        translate([doubleSpace, 0, 0]) keySlot(blockPosPinky-blockLengthPinky/4, middleEf[2], singleSlot, slotHeight);
      }
      if (_middleD == true) {
        translate([0, middleD[2], 0]) scale([1, middleD[1]/middleD[0]]) cylinder(h = 10, d = middleD[0]); // D
        keypadSeatCut(middleD[2], 0.8, middleD[3]);
        translate([-doubleSpace, 0, 0]) keySlot(blockPosPinky-blockLengthPinky/4, middleD[2], singleSlot, slotHeight);
      }
    } // right holes and pad seats

    rotate([0, -135, 0]) {
      if (_middleBf == true) {
        translate([0, middleBf[2], 0]) scale([1, middleBf[1]/middleBf[0]]) cylinder(h = 10, d = middleBf[0]); // B flat
        keypadSeatCut(middleBf[2], 0.8, middleBf[3]);
        keySlot(blockPosMiddleBf, middleBf[2], singleSlot, slotHeight);
      }
      if (_middleAf == true) {
        translate([0, middleAf[2], 0]) scale([1, middleAf[1]/middleAf[0]]) cylinder(h = 10, d = middleAf[0]); // A flat
        keypadSeatCut(middleAf[2], 0.8, middleAf[3]);
        keySlot(blockPosMiddleAf, middleAf[2], singleSlot, slotHeight);
      }
    } // left back holes and pad seats

    rotate([0, 180, 0]) translate([0, blockPosPinky, 0]) translate([blockWidth/2-2, blockLengthPinky/2, -blockWidth/2]) cylinder(h=blockWidth, d = blockPinHoleSize); // right pinky block axis
    rotate([0, 90, 0]) translate([0, blockPosPinky, 0])
      translate([blockWidth/2-2, blockLengthPinky/2, -blockWidth/2]) cylinder(h=blockWidth, d = blockPinHoleSize); // back pinky block axis
    rotate([90, 0, 0]) cylinder(h = reedSocketLength, d1 = reedSocketBore1, d2 = reedSocketBore2); // reed socket bore
    rotate([-90, 0, 0]) cylinder(h = chanterLOA, d = chanterBore); // main bore
  }
}
