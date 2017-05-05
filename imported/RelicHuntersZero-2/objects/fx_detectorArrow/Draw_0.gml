///Draw Event
if (instance_exists(parent))
{
    draw_sprite_ext(sprite_index,image_index,parent.x+lengthdir_x(dist,targetDirection), parent.y+lengthdir_y(dist,targetDirection), 0.5, 0.4, targetDirection, c_blue, myAlpha);
}

