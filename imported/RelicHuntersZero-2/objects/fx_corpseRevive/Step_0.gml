///Revive

event_inherited();

if (reviveTimeCurrent >= reviveTime) && (!speed) && (!image_speed)   {
    myRevive = instance_create(x,y,fx_reviveZombie);
    myRevive.image_xscale = image_xscale;
    instance_destroy();
}
else reviveTimeCurrent++;

