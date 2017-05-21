///Main Draw

if (flightState == "go") 
{
    depth = layer_get_depth("Interactive_Over");
}
else depth = -y;

if (targetDirection > 90) && (targetDirection < 270) image_xscale = -1;
else image_xscale = 1;

image_yscale = 1.25;

draw_sprite_ext(sprite_index,image_index,x,y-myHeight,image_xscale,image_yscale,image_angle,image_blend,1);

reflection_add_sprite_update(sprite_index,image_index,x,y+myHeight,image_xscale,1,image_angle,image_blend,1);


