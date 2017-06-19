///Pick Up

if (activationClient != noone)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;

    if (wantToActivate) && (in_range)
    {
        if (activationClient.hp < activationClient.hp_max)
        {
            activationClient.hp += hp;
            
            audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);

			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_white, loc_key("INFO_HEALTHPLUS"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.colorMain = c_white;
            //guiInfo.myString = loc_key("INFO_HEALTHPLUS");
            //guiInfo.owner = activationClient;
            instance_destroy();
        }
        else
        {
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_black, loc_key("INFO_HEALTHFULL"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.colorMain = c_black;
            //guiInfo.myString = loc_key("INFO_HEALTHFULL");
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


