/*units: cm
length = 30
out_dia = 14
in_dia = 13.4
wall = 0.3
*/

$fn = 360;
module parabola (L, K, D1, D2, out_col="orange", in_col="red")
{
    R1 = D1/2;
    R2 = D2/2;
    para1 = [for (x =[0:L-1]) [x, R1*((2*(x/L)-K*pow((x/L),2))/(2-K))]];
    tmp1 = [[L, R1], [L, 0]];
    outer = concat(para1, tmp1);
    
    para2 = [for (x =[0:L-1]) [x, R2*((2*(x/L)-K*pow((x/L),2))/(2-K))]];
    tmp2 = [[L, R2], [L, 0]];
    inner = concat(para2, tmp2);
    
    translate([0, 0, L])
    difference() {
        color(out_col)
        rotate_extrude()
        rotate([0, 0, -90])
        polygon(outer);
        
        color(in_col)
        translate([0, 0, R2-R1])
        rotate_extrude()
        rotate([0, 0, -90])
        polygon(inner);
        
    }
}

parabola(L=30, K=1, D1=14, D2=13.4);