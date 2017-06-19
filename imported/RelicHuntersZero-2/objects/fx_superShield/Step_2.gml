///Follow Owner or Die

if (instance_exists(owner)) 
{
    x = owner.x;
    y = owner.y;
        
    depth = owner.depth-1;
}
else instance_destroy();

///Hit Effect

if (animationTrigger){
    image_index = 0;
    image_speed = animationSpeed;
    animationTrigger = false;
        
    if (instance_exists(owner)) {
        audio_play_exclusive(owner.audio_emitter,false,1,sfx_biu_shield_hit1,sfx_biu_shield_hit2,sfx_biu_shield_hit3,sfx_biu_shield_hit4,sfx_biu_shield_hit5,sfx_biu_shield_hit6,sfx_biu_shield_hit7);
    }
}
else{
    animationTriggerTimeCurrent += delta_time;
    if (animationTriggerTimeCurrent >= animationTriggerTime){
        animationTrigger = true;
        animationTriggerTimeCurrent=0;
    }
}

if (instance_exists(owner)){
    if (owner.superShieldTime - owner.superShieldTimeCurrent) <= 3500000/*room_speed*3.5*/{
        animationTriggerTime = 500000;//room_speed*0.5;
    }
}

