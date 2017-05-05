draw_self();

if (kill) && (!on_top_of_object)
{
    draw_persistent(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
    instance_destroy();
}   

