///Buy

priceCurrent = priceArray [ min(priceTier,9) ];

if instance_exists(activationClient)
{
    var displayWarning = false;
    
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range)
    {
        if (global.bountyEndless >= priceCurrent)
        {
            if (canActivate)
            {
                global.bountyEndless -= priceCurrent;
                unlock = true;
                audio_play(activationClient.audio_emitter,false,1,sfx_buy);
                priceTier++;
                global.hasPurchasedAnything = true;
            }
            else displayWarning = true;
        }
        else{
            displayWarning = true;
            infoString = loc_key("INFO_NOTENOUGHBOUNTY");
        }
    }
    
    if (displayWarning){
        guiInfo = instance_create_depth(activationClient.x,activationClient.y,activationClient.depth,gui_info);
        guiInfo.myString = infoString;
        guiInfo.colorMain = K_BETU_RED;
        guiInfo.owner = activationClient;
        audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
    }
}

//Animation
if (in_range) image_index = 1;
else image_index = 0;

