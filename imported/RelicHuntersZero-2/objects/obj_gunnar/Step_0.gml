///Price + Buy
event_inherited();

if instance_exists(activationClient)
{
    price = 0;
    
    if (instance_exists(activationClient.myGun)){
        var gun = activationClient.myGun;
        if (gun.weaponLevel <= 8) price = global.price_weaponUpgrade[gun.weaponLevel];
    
        //Resolve 
        if (point_distance(x,y,activationClient.x,activationClient.y) <= range) && (price) in_range = true;    
        
        if (wantToActivate) && (in_range)
        {
            if (global.bountyEndless >= price)
            {
                global.bountyEndless -= price;
                gun.weaponLevel++;
                wantToActivate = false;
                
                //Achievements & Stats
                global.statTotalWeaponUpgrades++;
                global.hasPurchasedAnything = true;
                if (gun.weaponLevel == 3) achievement_give("ACHIEVEMENT_GUNNAR_3");
                if (gun.weaponLevel == 9) achievement_give("ACHIEVEMENT_GUNNAR_9");
                steam_set_stat_int("STAT_TOTAL_UPGRADES", steam_get_stat_int("STAT_TOTAL_UPGRADES") + 1  ); 
                if (steam_get_stat_int("STAT_TOTAL_UPGRADES") >= 360) achievement_give("ACHIEVEMENT_GUNNAR_360");

				gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_white, loc_key("GUNNAR_INFO_UPGRADED"));
                //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
                //guiInfo.myString = loc_key("GUNNAR_INFO_UPGRADED");;
                //guiInfo.colorMain = c_white;
                //guiInfo.owner = activationClient;
                audio_play(activationClient.audio_emitter,false,1,sfx_buy);
                myBalloon.upgradeTalk = true;
            }
            else{
				gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
                //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
                //guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");;
                //guiInfo.colorMain = K_BETU_RED;
                //guiInfo.owner = activationClient;
                audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full); 
            }    
        }
    }
}

///Talk when player is nearby

if instance_exists(class_player)
{
    var distToPlayer = point_distance(x,y-8,class_player.x,class_player.y);
    
    if (distToPlayer <= 280) && (!instance_exists(obj_gunnar_balloon))
    {
            myBalloon = instance_create_layer(x,y,"Interactive",obj_gunnar_balloon);
            if (!image_xscale) myBalloon.x -= 50;
    }
}

