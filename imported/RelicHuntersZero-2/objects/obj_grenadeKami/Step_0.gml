///Conditional Detonation
event_inherited();
if (enemyTrigger) detonationTimeCurrent = detonationTime;

if (goBoom){
    instance_create(x,y,fx_explosionKami); 
    instance_destroy();
}

