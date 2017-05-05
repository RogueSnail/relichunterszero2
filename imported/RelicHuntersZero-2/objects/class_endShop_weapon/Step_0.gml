///Unlock
event_inherited();

if instance_exists(activationClient)
{   
    if (unlock) && (spawnObject)
    {
        var pickup = instance_create(x,y,spawnObject);
        pickup.activationClient = activationClient;
        pickup.wantToActivate = true;
        pickup.in_range = true;
        
        instance_destroy();
    }
}


