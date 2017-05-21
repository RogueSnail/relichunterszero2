///Override draw

depth = -y-50;
draw_set_alpha(1);
//draw_self(); <--- NO SPRITE ATM


if (image_index >= trigger_frame)
{
    depth = layer_get_depth("Interactive_Over");
    draw_set_colour(K_BETU_BLUE);
    draw_set_alpha(radiusAlpha);
    draw_rectangle(x-radius-1,y-radius-1,x+radius+1,y+radius+1,true);
    draw_rectangle(x-radius,y-radius,x+radius,y+radius,true);
    draw_rectangle(x-radius+1,y-radius+1,x+radius-1,y+radius-1,true);
}

