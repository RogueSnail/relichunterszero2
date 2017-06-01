///Check canActivate, inherit and unlock

canActivate = true;
infoString = "";

if instance_exists(activationClient) && (isInteractiveObjectActive)
{
    if (global.character[activationClient.myPlayerId] != char_biu) //Biu can't pick up Overshield
    {
        if (activationClient.overshield >= activationClient.energy_max)
        {
            canActivate = false;
            infoString = loc_key("INFO_SHIELDMAX");
        }
    }
    else{
        canActivate = false;
        infoString = loc_key("INFO_CANTUSESHIELD");
    }
}

event_inherited();

if (unlock)
{
    if (instance_exists(activationClient))
    {
        activationClient.overshield += min(overshield, (activationClient.energy_max - activationClient.overshield));
        activationClient.energy_regen_time_current = activationClient.energy_regen_time-1;
        audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);
    }
    
    guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
    guiInfo.colorMain = K_BETU_BLUE;
    guiInfo.myString = loc_key("INFO_SHIELDPLUS");
    guiInfo.owner = activationClient;
    
    unlock = false;
    wantToActivate = false;
}





///Sync price tier
global.endPriceTier_overshield = priceTier;

