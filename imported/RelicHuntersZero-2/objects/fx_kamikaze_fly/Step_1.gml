time++;

if instance_exists_fast(owner) 
{ 
	if (time >= slowness)
	{
	    x = owner.x;
	    y = owner.y;
    
	    draw_height = owner.draw_height;
    
	    image_xscale = owner.image_xscale;
    
	    time = 0;
	}
}
else {
	owner = noone;
}
