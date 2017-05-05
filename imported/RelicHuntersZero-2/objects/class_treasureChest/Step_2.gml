///Unlock

event_inherited();

if (unlock){
    open = instance_create(x,y,fxObject);
    open.spawnRelic = spawnRelic;
    open.spawnWeapon = spawnWeapon;
    open.spawnSprite = spawnSprite;
    open.spawnCoins = spawnCoins;
    open.spawnChallenge = spawnChallenge;
    open.activationClient = activationClient;
    instance_destroy();
}

