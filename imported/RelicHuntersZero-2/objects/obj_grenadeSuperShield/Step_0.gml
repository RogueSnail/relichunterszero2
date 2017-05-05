///Conditional Detonation
event_inherited();
{
    var targetPlayer = instance_nearest(x,y,class_player);
    if instance_exists(targetPlayer){
        targetPlayer.superShield = true;
        targetPlayer.superShieldTime = room_speed*6;
        audio_play(targetPlayer.audio_emitter,false,9,sfx_shield_regen_start);
        
        guiInfo = instance_create(targetPlayer.x,targetPlayer.y,gui_info);
        guiInfo.colorMain = K_BETU_ORANGE;
        guiInfo.myString = loc_key("INFO_SUPERSHIELD");
        guiInfo.owner = targetPlayer;
    }
    instance_destroy();
}

