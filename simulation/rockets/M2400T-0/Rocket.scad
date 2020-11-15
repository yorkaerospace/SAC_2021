use <BodyTubes.scad>
use <NoseCone.scad>

$fn = 360;

color("yellow")
tube(175, 14, 13.4);

color("orange")
translate([40, 0, 0])
tube(75, 14, 13.4);

color("green")
translate([-40, 0, 0])
parabola(K=0.5, R1=14, L=30);