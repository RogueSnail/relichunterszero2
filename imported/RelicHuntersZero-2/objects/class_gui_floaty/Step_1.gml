
if (!instance_exists_fast(owner)) owner = noone;

if (!global.pause)
{
	if (visible == true) {
		///Update Alpha and Duration

		if (lifeCurrent < lifeMax) lifeCurrent += delta_time * ms_to_s * global.target_fps;
		else myAlpha -= fadeSpeed * delta_time * ms_to_s * global.target_fps;

		if (myAlpha <= 0) {
			//instance_destroy();
			visible = false;
		}

		///Update Scale

		if (scaleOrientation)
		{
		    if (myScale < scaleGrow) myScale += min(scaleSpeedGrow, abs(scaleGrow-myScale)) * delta_time * ms_to_s * global.target_fps;
		    else
		    {
		        myScale = scaleGrow;
		        scaleOrientation = -1;
		    }
		}
		else 
		{
		    if (myScale > scaleShrink) myScale -= min(scaleSpeedShrink, abs(scaleShrink-myScale)) * delta_time * ms_to_s * global.target_fps;
		    else myScale = scaleShrink
		}
	}
}

