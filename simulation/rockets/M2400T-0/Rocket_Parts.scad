use <BodyTubes.scad>
use <NoseCone.scad>
use <Fins.scad>
use <CentreRings.scad>

$fn = 360;

out_dia = 14;
in_dia = 13.4;

//bottom tube
translate([-20, 0, 0])
tube(175, out_dia, in_dia, "yellow", "aqua");

//inner tube
translate([-20, -20, 0])
tube(59.7, 11, 9.84, "gray", "red");

//1st centre ring
color("orange")
translate([-20, -40, 13])
centreRing(13.4, 11, 0.2);

//2nd centre ring
color("orange")
translate([-20, -40, 43])
centreRing(13.4, 11, 0.2);

//engine block
color("red")
translate([-20, -20, 60.3 + 5])
linear_extrude(0.5)
circle(13.4/2);

//1st launch lug
translate([-20 - out_dia/2, -out_dia/2, 34])
tube(3, 1, 0.8, "blue", "grey");

//2nd launch lug
translate([-20 - out_dia/2, -out_dia/2, 175/2])
tube(3, 1, 0.8, "blue", "grey");


//upper tube
tube(75, out_dia, in_dia, "gold", "blue");


//nose cone
translate([20, 0, 0])
parabola(30, 1, out_dia, in_dia, "khaki", "dodgerblue");

//fins
for(i = [0:3])
{
    translate([-35, i * 5, 0])
    rotate([0, 0, 90])
    color("green")
    fin(15, 12, 11, 9.5, 0.3);
}