var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{

	/// @description check events and refs
	if (owner != noone) {

		for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
		{
			if (owner == (global.eventManager.removedInstances[i])) {
				owner = noone;
				break;
			}
		}
	}


	if (visible == true) {
		///Update Alpha and Duration

		if (lifeCurrent < lifeMax) lifeCurrent += delta_time * ms_to_s;
		else myAlpha -= fadeSpeed * delta_time * ms_to_s;

		if (myAlpha <= 0) {
			//instance_destroy();
			visible = false;
		}

		///Update Scale

		if (scaleOrientation)
		{
		    if (myScale < scaleGrow) myScale += min(scaleSpeedGrow, abs(scaleGrow-myScale)) * delta_time * ms_to_s;
		    else
		    {
		        myScale = scaleGrow;
		        scaleOrientation = -1;
		    }
		}
		else if (!scaleOrientation)
		{
		    if (myScale > scaleShrink) myScale -= min(scaleSpeedShrink, abs(scaleShrink-myScale)) * delta_time * ms_to_s;
		    else myScale = scaleShrink
		}
	}

}
}
