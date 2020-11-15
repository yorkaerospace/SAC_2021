/*units: cm
tube 1: lenghth = 175
tube 2: length = 75
out_dia = 14
in_dia = 13.4
wall = 0.3
*/
$fn = 360;
//bottom cylinder
module tube(L, out_d, in_d)
{
difference() {
cylinder(L, out_d, out_d);
translate([0, 0, -1])
    cylinder(L+2, in_d, in_d);
}
}
