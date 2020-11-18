use <BodyTubes.scad>
use <NoseCone.scad>
use <Fins.scad>

$fn = 360;

external_dia = 14;
internal_dia = 13.4;
explosion = 15;

tube(175, external_dia, internal_dia, "yellow", "aqua");

translate([0, 0, 175+explosion])
tube(75, external_dia, internal_dia, "gold", "blue");

translate([0, 0, 175+75+explosion*2])
parabola(30, 1, external_dia, internal_dia, "khaki", "dodgerblue");


translate([external_dia/2 + explosion/2, 0, 0])
rotate([0, 0, -90])
color("green")
fin(15, 12, 11, 9.5, 0.3);

translate([-external_dia/2 - explosion/2, 0, 0])
rotate([0, 0, 90])
color("green")
fin(15, 12, 11, 9.5, 0.3);

translate([0, -external_dia/2 - explosion/2, 0])
rotate([0, 0, 180])
color("green")
fin(15, 12, 11, 9.5, 0.3);

translate([0, external_dia/2 + explosion/2, 0])
rotate([0, 0, 0])
color("green")
fin(15, 12, 11, 9.5, 0.3);