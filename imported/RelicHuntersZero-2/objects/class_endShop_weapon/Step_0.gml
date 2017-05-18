///Unlock
event_inherited();

if instance_exists(activationClient)
{   
    if (unlock) && (spawnObject)
    {
        var pickup = instance_create_layer(x,y,"Interactive",spawnObject);
        pickup.activationClient = activationClient;
        pickup.wantToActivate = true;
        pickup.in_range = true;
        
        instance_destroy();
    }
}


