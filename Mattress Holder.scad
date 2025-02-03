use <dovetail/dovetail.scad>;

// Your amazing design you want to cut
module amazing_design(height) {
    cube(size=[50, 50, height], center=true);
}

height = 10;

// First, setup the cutting position: middle cut
position = [0, 0, 0];

// Next, setup the dimension of the cut: use the bounding box of your design
dimension = [50, 50, 10];

// Finally, setup the dovetail:
// - Teeth count
// - Teeth height
// - Teeth Clearance
teeth = [5, 8, 0.5];

// Now, cut !

// Extract the first part...
//amazing_design(height);

translate([0, 14, -5]) {
    cube([50, 20, 20], true);
}

intersection() {
    cube([50, 10, 9.5], true);
    cutter(position=[0, 0.25, 0], dimension=dimension, teeths=teeth, male=false);
}

translate([0, -10, 0]) {
    translate([0, -15, -5]) {
        cube([50, 20, 20], true);
    }

    translate([0, -1.5, -10]) {
        cube([50, 10, 10], true);
    }

    intersection() {
        cube([50, 10, 10], true);
        cutter(position=[0, 0.25, 0], dimension=dimension, teeths=teeth, male=true);
    }
}