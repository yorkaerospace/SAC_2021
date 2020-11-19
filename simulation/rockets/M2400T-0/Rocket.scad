use <BodyTubes.scad>
use <NoseCone.scad>
use <Fins.scad>
use <CentreRings.scad>

$fn = 360;

out_dia = 14;
in_dia = 13.4;
explosion = 15;

//bottom tube
tube(175, out_dia, in_dia, "yellow", "aqua");

//inner tube
translate([0, 0, -59.7- explosion])
tube(59.7, 11, 9.84, "gray", "red");

//1st centre ring
color("orange")
translate([0, 0, -13-explosion])
centreRing(13.4, 11, 0.2);

//2nd centre ring
color("orange")
translate([0, 0, -43-explosion])
centreRing(13.4, 11, 0.2);

//engine block
color("red")
translate([0, 0, -explosion/2])
linear_extrude(0.5)
circle(13.4/2);


//upper tube
translate([0, 0, 175+explosion])
tube(75, out_dia, in_dia, "gold", "blue");


//nose cone
translate([0, 0, 175+75+explosion*2])
parabola(30, 1, out_dia, in_dia, "khaki", "dodgerblue");


//fins
translate([out_dia/2 + explosion/2, 0, 0])
rotate([0, 0, -90])
color("green")
fin(15, 12, 11, 9.5, 0.3);

translate([-out_dia/2 - explosion/2, 0, 0])
rotate([0, 0, 90])
color("green")
fin(15, 12, 11, 9.5, 0.3);

translate([0, -out_dia/2 - explosion/2, 0])
rotate([0, 0, 180])
color("green")
fin(15, 12, 11, 9.5, 0.3);

translate([0, out_dia/2 + explosion/2, 0])
rotate([0, 0, 0])
color("green")
fin(15, 12, 11, 9.5, 0.3);