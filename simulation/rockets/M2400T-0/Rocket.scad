use <BodyTubes.scad>
use <NoseCone.scad>
use <Fins.scad>
use <CentreRings.scad>

$fn = 360;

external_dia = 14;
internal_dia = 13.4;
explosion = 15;

//bottom tube
tube(175, external_dia, internal_dia, "yellow", "aqua");

//1st centre ring
color("red")
translate([explosion, 0, 13])
centreRing(13.4, 11, 0.2);

//2nd centre ring
color("red")
translate([explosion, 0, 43])
centreRing(13.4, 11, 0.2);

//upper tube
translate([0, 0, 175+explosion])
tube(75, external_dia, internal_dia, "gold", "blue");

//nose cone
translate([0, 0, 175+75+explosion*2])
parabola(30, 1, external_dia, internal_dia, "khaki", "dodgerblue");

//fins
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