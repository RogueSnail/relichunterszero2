///Conditional Detonation
event_inherited();
if (enemyTrigger) detonationTimeCurrent = detonationTime;

if (goBoom){
    var explosion = instance_create(x,y,fx_explosion_regular);
    explosion.radius = detonationRadius;
    explosion.damage = damage;
    instance_destroy();
}

