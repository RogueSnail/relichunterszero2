///Activation + Alpha Animation

if (!active)
{
    isSlotFree = true;
    
    for (var i=0; i<instance_number(fx_bigMessage); i++)
    {
        otherMessage = instance_find(fx_bigMessage,i);
        if (otherMessage.active) isSlotFree = false;
    }
    
    if (isSlotFree) active = true;
}
else{
    if (!timeToDie)
    {
        if (myAlpha < 1) myAlpha += myAlphaSpeed * delta_time * ms_to_s;
        
        if (lifeTimeCurrent < lifeTime) lifeTimeCurrent += delta_time;
        else timeToDie = true;
    }
    else
    {
        if (myAlpha > 0) myAlpha -= myAlphaDieSpeed * delta_time * ms_to_s;
        else instance_destroy();
    }
}

//Digging Hack
if (global.relicDetected) lifeTimeCurrent = 0;

