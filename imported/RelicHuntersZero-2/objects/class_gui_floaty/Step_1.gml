var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{
///Update Alpha and Duration

if (lifeCurrent < lifeMax) lifeCurrent++;
else myAlpha -= fadeSpeed;

if (myAlpha <= 0) instance_destroy();

///Update Scale

if (scaleOrientation)
{
    if (myScale < scaleGrow) myScale += min(scaleSpeedGrow, abs(scaleGrow-myScale));
    else
    {
        myScale = scaleGrow;
        scaleOrientation = -1;
    }
}
else if (!scaleOrientation)
{
    if (myScale > scaleShrink) myScale -= min(scaleSpeedShrink, abs(scaleShrink-myScale));
    else myScale = scaleShrink
}

}
}
