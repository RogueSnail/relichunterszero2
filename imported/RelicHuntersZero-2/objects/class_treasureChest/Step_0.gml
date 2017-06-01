///Open

event_inherited();

if (!canActivate) {
    if (activateTimeCurrent < activateTime) activateTimeCurrent++;
    else canActivate = true;
}

if instance_exists(activationClient) && (canActivate)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;

    if (wantToActivate) && (in_range)
    {
        unlock = true;
    }
}

