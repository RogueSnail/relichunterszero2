///Purchase and Activate
event_inherited();

if instance_exists(activationClient)
{   
    if (unlock) && (spawnObject)
    {
        var spawnRelic = instance_create(0,0,spawnObject);
        spawnRelic.activationOverride = true;
        spawnRelic.activationClient = activationClient;
        spawnRelic.toggle = true;
        with (spawnRelic) {
            event_perform(ev_step,ev_step_begin);
            instance_destroy();
        }
        instance_destroy();
    }
}


