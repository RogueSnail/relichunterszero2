///Activation Control

isActive = false;

if (instance_exists(owner))
{
    if (owner.isActive) && (instance_exists(owner.owner))
    {        
        if (owner.owner.inputShield)
        {
            if (owner.owner.stamina >= staminaMin)
            {
                isActive = true;
                owner.owner.stamina -= staminaCost;
            }
        }
        if (owner.owner.throw) isActive = true;
    }
}

