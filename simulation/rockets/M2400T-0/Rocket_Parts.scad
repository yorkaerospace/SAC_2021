use <BodyTubes.scad>
use <NoseCone.scad>
use <Fins.scad>

$fn = 360;

external_dia = 14;
internal_dia = 13.4;

translate([-20, 0, 0])
tube(175, external_dia, internal_dia, "yellow", "aqua");

tube(75, external_dia, internal_dia, "gold", "blue");

translate([20, 0, 0])
parabola(30, 1, external_dia, internal_dia, "khaki", "dodgerblue");


for(i = [0:3])
{
    translate([-35, i * 5, 0])
    rotate([0, 0, 90])
    color("green")
    fin(15, 12, 11, 9.5, 0.3);
}