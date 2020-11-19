/*units: cm
tube 1: lenghth = 175
tube 2: length = 75
out_dia = 14
in_dia = 13.4
wall = 0.3
*/
$fn = 360;
//bottom cylinder
module tube(length, out_dia, in_dia, out_col="red", in_col="yellow")
{
    difference() {
    color(out_col)
    cylinder(length, r=out_dia/2);
    translate([0, 0, -1])
        color(in_col)
        cylinder(length+2, r=in_dia/2);
    }
}

tube(10, 5, 4);