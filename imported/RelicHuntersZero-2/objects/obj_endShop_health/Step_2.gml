///Check canActivate, inherit and unlock

canActivate = true;
infoString = "";

if instance_exists(activationClient) && (isInteractiveObjectActive)
{
    if (activationClient.hp >= activationClient.hp_max)
    {
        canActivate = false;
        infoString = loc_key("INFO_HEALTHFULL");
    }
}

event_inherited();

if (unlock)
{
    if (instance_exists(activationClient))
    {
        activationClient.hp += hp;
        audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);
    }
    
    guiInfo = instance_create(activationClient.x,activationClient.y,gui_info);
    guiInfo.colorMain = c_white;
    guiInfo.myString = loc_key("INFO_HEALTHPLUS");
    guiInfo.owner = activationClient;
    
    unlock = false;
    wantToActivate = false;
}





///Sync price tier
global.endPriceTier_health = priceTier;

