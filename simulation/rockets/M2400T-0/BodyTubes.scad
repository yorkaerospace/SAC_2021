/*units: cm
tube 1: lenghth = 175
tube 2: length = 75
out_dia = 14
in_dia = 13.4
wall = 0.3
*/
$fn = 360;
//bottom cylinder
module tube(L, out_d, in_d, out_col="red", in_col="yellow")
{
    difference() {
    color(out_col)
    cylinder(L, r=out_d);
    translate([0, 0, -1])
        color(in_col)
        cylinder(L+2, r=in_d);
    }
}

tube(10, 5, 4);