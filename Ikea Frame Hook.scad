module prism(l, w, h){
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

$fn=30; //smooth cylinder

h = 5;
w = 16;
l = 16;
slope = 15;
hole = 5;

screw_cap_width = 9.5;
screw_cap_height = 8;

pinH = 21;
pinWall = 4;
pinWall2 = 2;

translate([-w/2, -h - slope, 0]) {
    prism(w, h+slope, h);
}

translate([0, l/2, h/2]) {
    difference() {
        union() {
            cube([w, l, h],true);
            cylinder(screw_cap_height + 2, hole/2 + pinWall, hole/2 + pinWall);
            cylinder(pinH, hole/2 + pinWall2, hole/2 + pinWall2);
        }
        translate([0, 0, -h/2-1]) {
            //drill small hole
            cylinder(pinH + 10, hole/2, hole/2);
            //dril large hole for screw cap
            cylinder(screw_cap_height + 1, screw_cap_width/2, screw_cap_width/2); 
        }
    }
}

translate([0, l/2, screw_cap_height/2]) {
    cube([screw_cap_width - 0.2, 0.1, screw_cap_height], center=true);
    rotate(90) {
        cube([screw_cap_width - 0.2, 0.1, screw_cap_height], center=true);
    }
}
