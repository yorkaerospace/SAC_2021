module centreRing(out_dia, in_dia, thickness)
{
    linear_extrude(thickness)
    difference()
    {
        circle(out_dia/2);
        circle(in_dia/2);
    }
}

centreRing(13.4, 11, 0.2);