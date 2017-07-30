time++;

if (instance_exists_fast(owner))
{
	if (time >= slowness)
	{
	    x = owner.x;
	    y = owner.y;
    
	    image_xscale = owner.image_xscale;
    
	    time = 0;
	}
}
else {
	owner = noone;
}

