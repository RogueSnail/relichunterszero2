///Pick Up

if instance_exists(activationClient)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;

    if (wantToActivate) && (in_range)
    {
        if (global.character[activationClient.myPlayerId] != char_biu) //Biu can't pick up Super Shield
        {
            activationClient.superShieldTime = max(superShieldTime, activationClient.superShieldTime);
            activationClient.energy = activationClient.energy_max;
            activationClient.superShield = true;
            
            audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);
            
			gui_info_show_at(activationClient, activationClient.x,activationClient.y, "Interactive_Over", K_BETU_ORANGE, loc_key("INFO_SUPERSHIELD"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.colorMain = K_BETU_ORANGE;
            //guiInfo.myString = loc_key("INFO_SUPERSHIELD");
            //guiInfo.owner = activationClient;
            instance_destroy();
        }
        else{
			gui_info_show_at(activationClient, activationClient.x,activationClient.y, "Interactive_Over", K_BETU_ORANGE, loc_key("INFO_CANTUSESHIELD"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.colorMain = K_BETU_RED;
            //guiInfo.myString = loc_key("INFO_CANTUSESHIELD");
            //guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

//Betu Goze
if (!on_top_of_object)
{
    myObject = collision_point(x,y,obj_wall,false,true);
    if (instance_exists(myObject)) on_top_of_object = true;
}

if (on_top_of_object)
{
    if (!instance_exists(myObject))
    {
        y+=32;
        on_top_of_object = false;
    }
}

///Animation
if (in_range) image_index = 1;
else image_index = 0;


