///Animation Done + Relic Unlock + Announcement

animationDone = true;
image_index = image_number-1;
image_speed = 0;

if (relic != noone)
{
    relic = instance_create(0,0,relic);
    
    relic.unlock = true;
    
    if (instance_exists(fx_bigMessage)) with (fx_bigMessage) instance_destroy();
        
    relic.announce = instance_create(x,y,fx_bigMessage);
    relic.announce.textBig = loc_key("HUD_UNLOCK_RELIC_PIECE");
    relic.announce.textSmall = loc_key("HUD_UNLOCK_RELIC_ALLPIECES");
    relic.announce.relicSprite1 = relic.relicSprite1;
    relic.announce.relicSprite1Draw = relic.relicSprite1Draw;
    relic.announce.relicSprite2 = relic.relicSprite2;
    relic.announce.relicSprite2Draw = relic.relicSprite2Draw;
    relic.announce.relicSprite3 = relic.relicSprite3;
    relic.announce.relicSprite3Draw = relic.relicSprite3Draw;    
    exit; 
}

if (endlessWeapon != noone)
{
    var weapon = instance_create(x,y,endlessWeapon);
    var wPos = get_bbox_center(weapon);
    weapon.x += x-wPos[0];
    weapon.y += y-wPos[1];
    exit;
}

if (endlessRelic != noone)
{
    var myRelic = instance_create(0,0,endlessRelic);
    myRelic.activationOverride = true;
    myRelic.activationClient = activationClient;
    myRelic.toggle = true;
    with (myRelic) {
        event_perform(ev_step,ev_step_begin);
        instance_destroy();
    }
    if (instance_exists(class_gui_dynamic_relic)) with (class_gui_dynamic_relic) timedActive = true;
    exit;
}


