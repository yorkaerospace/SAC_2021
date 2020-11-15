/*units: cm
length = 30
out_dia = 14
in_dia = 13.4
wall = 0.3
*/

$fn = 360;
module parabola (K=0.5, R1=14, L)
{
    //TODO generate wall thickness
    para1 = [for (x =[0:30]) [x, R1*((2*(x/L)-K*pow((x/L),2))/(2-K))]];
    para2 = para1;
    
    //para2 = [for (x =[0:30]) [x, R2*((2*(x/L)-K*pow((x/L),2))/(2-K))]];
    //difference
    
    translate([0, 0, 30])
    rotate([180, 0, 0])
    rotate_extrude()
    rotate([0, 0, 90])
    polygon(para1);
}

parabola(K=0.5, R1=14, L=30);