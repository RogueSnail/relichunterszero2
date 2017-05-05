///Hehehehehe

if (!dropHugeGun) && (global.gameMode != gamemode_endless)
{
    bigFGun = instance_create(x,y,obj_pickup_bossGun);
    bigFGun.image_xscale = image_xscale;
    
    dropHugeGun = true;
    
    instance_create(4416,2368,obj_teleporter_secret);
}

