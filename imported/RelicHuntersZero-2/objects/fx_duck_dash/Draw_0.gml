if (instance_exists_fast(owner))
{
    if (owner.dodging = true ) 
	{
		draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,alpha);
	}
}
else {
	owner = noone;
}
