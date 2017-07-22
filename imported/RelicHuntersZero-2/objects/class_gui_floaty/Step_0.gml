///Float Up

if (visible == true) {
	if (lockToOwner)
	{
	    if (owner != noone)
	    {
	        x = owner.x;
	        y = owner.y;
	        offsetY -= floatSpeed * delta_time * ms_to_s;
	    }
	    else y -= floatSpeed * delta_time * ms_to_s;
	}
	else
	{
	    y -= bounceSpeed;
	    bounceSpeed -= bounceGravity;
	    if (bounceSpeed) < (-1*bounceAbsoluteLimit) bounceSpeed = (-1*bounceAbsoluteLimit);

	    x += bounceHorizontalSpeed * bounceHorizontalDirection;
	    if (bounceHorizontalSpeed) bounceHorizontalSpeed -= bounceHorizontalFriction;
	    else bounceHorizontalSpeed = 0;
	}
}