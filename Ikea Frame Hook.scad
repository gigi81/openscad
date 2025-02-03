module prism(l, w, h){
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

h = 5;
w = 16;
l = 15;
slope = 10;
hole=5;
hole2=10;

pinH = 10;
pinWall = 2;

translate([-w/2, -h - slope, 0]) {
    prism(w, h+slope, h);
}

translate([0, l/2, h/2]) {
    difference() {
        union() {
            cube([w, l, h],true);
            cylinder(pinH, hole/2 + pinWall, hole/2 + pinWall);
        }
        translate([0, 0, -h/2-1]) {
            cylinder(pinH + 10, hole/2, hole/2);
            cylinder(h/2, hole2/2, hole2/2);
        }
    }
}
