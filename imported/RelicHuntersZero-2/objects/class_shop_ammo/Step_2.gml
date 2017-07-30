///Buy
if (activationClient != noone) && (!unlock)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range)
    {
        if (global.score_total >= price)
        { 
            global.score_total -= price;
            unlock = true;
            audio_play(activationClient.audio_emitter,false,1,sfx_buy);
            
            announce = instance_create_layer(x,y,"Interactive",fx_bigMessage);
            announce.textBig = loc_key("HUD_UNLOCK_ITEM");
            announce.textSmall = loc_key("HUD_UNLOCK_ITEM_GENERIC") + string(weaponName);
            
            if (instance_exists(global.dynamicAmmo1)) && (sprite_index != spr_pickup_grenade)
            {
                var p = activationClient.myPlayerId;
                if (p == 1) { global.dynamicAmmo1.timedActive = true; global.dynamicAmmo1.activeTimeCurrent = 0; }
                else if (p == 2) { global.dynamicAmmo2.timedActive = true; global.dynamicAmmo2.activeTimeCurrent = 0; }
            }
        }
        else
        {
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");
            //guiInfo.colorMain = K_BETU_RED;
            //guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

if (in_range) image_index = 1;
else image_index = 0;

