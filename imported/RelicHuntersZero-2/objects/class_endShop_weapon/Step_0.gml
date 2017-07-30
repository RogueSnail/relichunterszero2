///Unlock
event_inherited();

if (activationClient != noone)
{   
    if (unlock) && (spawnObject)
    {
        var pickup = instance_create_layer(x,y,"Interactive",spawnObject);
		owner_add_activated_instance_ex(pickup, activationClient);
        pickup.wantToActivate = true;
        pickup.in_range = true;
        
        instance_destroy();
    }
}


