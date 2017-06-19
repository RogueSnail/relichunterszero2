///Purchase and Activate
event_inherited();

if (activationClient != noone)
{   
    if (unlock) && (spawnObject)
    {
        var spawnRelic = instance_create_layer(0,0,"Interactive",spawnObject);
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


