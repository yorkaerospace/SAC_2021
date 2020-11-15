use <BodyTubes.scad>
use <NoseCone.scad>

$fn = 360;

tube(175, 14, 13.4, "yellow", "aqua");

translate([40, 0, 0])
tube(75, 14, 13.4, "gold", "blue");

translate([-40, 0, 0])
parabola(30, 1, 14, 13.4, "khaki", "dodgerblue");