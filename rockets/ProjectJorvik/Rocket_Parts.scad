use <BodyTubes.scad>
use <NoseCone.scad>
use <Fins.scad>
use <CentreRings.scad>

$fn = 360;

out_dia = 14;
in_dia = 13.4;

//bottom tube
translate([-10, 0, 0])
tube(231, out_dia, in_dia, "yellow", "aqua");

//inner tube
translate([-10, -20, 0])
tube(59.7, 11, 9.84, "gray", "red");

//1st centre ring
color("orange")
translate([-10, -40, 13])
centreRing(13.4, 11, 0.2);

//2nd centre ring
color("orange")
translate([-10, -40, 43])
centreRing(13.4, 11, 0.2);

//engine block
color("red")
translate([-10, -20, 60.3 + 5])
linear_extrude(0.5)
circle(13.4/2);

//1st launch lug
translate([-10 - out_dia/2, -out_dia/2, 34])
tube(3, 1, 0.8, "blue", "grey");

//2nd launch lug
translate([-10 - out_dia/2, -out_dia/2, 175/2])
tube(3, 1, 0.8, "blue", "grey");

//nose cone
translate([10, 0, 0])
parabola(30, 1, out_dia, in_dia, "khaki", "dodgerblue");

//fins
for(i = [0:3])
{
    translate([-20, i * 5, 0])
    rotate([0, 0, 90])
    color("green")
    fin(15, 12, 11, 9.5, 0.3);
}