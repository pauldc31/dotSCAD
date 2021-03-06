/**
* crystal_ball.scad
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-crystal_ball.html
*
**/ 

include <__comm__/__nearest_multiple_of_4.scad>;
include <__comm__/__frags.scad>;
include <__comm__/__ra_to_xy.scad>;
include <__comm__/__edge_r.scad>;
include <__comm__/__shape_pie.scad>;
include <__comm__/__shape_arc.scad>;

module crystal_ball(radius, theta = 360, phi = 180, thickness) {
    phis = is_num(phi) ? [0, phi] : phi;
    
    frags = __frags(radius);

    angle  = [90 - phis[1], 90 - phis[0]];

    shape_pts = is_undef(thickness) ? 
        __shape_pie(
            radius, 
            angle , 
            $fn = __nearest_multiple_of_4(frags)
        ) :
        __shape_arc(
            radius, 
            angle, 
            width = thickness,
            width_mode = "LINE_INWARD",
            $fn = __nearest_multiple_of_4(frags)
        );

    ring_extrude(
        shape_pts, 
        angle = theta, 
        radius = 0, 
        $fn = frags
    );

    // hook for testing
    test_crystal_ball_pie(shape_pts);
}

// override it to test
module test_crystal_ball_pie(shape_pts) {

}