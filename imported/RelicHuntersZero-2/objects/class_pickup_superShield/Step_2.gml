///Pick Up

if (instance_exists_fast(activationClient))
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
            instance_destroy();
        }
        else{
			gui_info_show_at(activationClient, activationClient.x,activationClient.y, "Interactive_Over", K_BETU_ORANGE, loc_key("INFO_CANTUSESHIELD"));
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

//Checks whether it is on top of a box
if (!on_top_of_object)
{
    myObject = collision_point(x,y,obj_wall,false,true);
    if (instance_exists_fast(myObject)) on_top_of_object = true; 
}

if (on_top_of_object)
{
    if (!instance_exists_fast(myObject))
    {
        y+=32;
        on_top_of_object = false;
    }
}

///Animation
if (in_range) image_index = 1;
else image_index = 0;


