///Buy
if instance_exists(activationClient) && (!unlock)
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
        }
        else
        {
            guiInfo = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gui_info);
            guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");
            guiInfo.colorMain = K_BETU_RED;
            guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

if (in_range) image_index = 1;
else image_index = 0;

