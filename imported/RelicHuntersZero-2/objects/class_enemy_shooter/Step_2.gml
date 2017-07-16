/// @description dynamic depth & death
// You can write your code in this editor
depth = -y;

//death
if hp <= 0
{
    if (!no_score)
    {
        if (!critical_death)
        {
            //if (global.allowKillFreeze) global.pause = 50000;//room_speed*0.05;
            score_add(global.score_kill,false);
        }
        else
        {
            //if (global.allowKillFreeze) global.pause = 75000;//room_speed*0.07;
            score_add(global.score_kill+global.score_headshot,true);
        }
    }
    
    repeat(coins) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
    roll_ammo_drop(x,y);
    
    if (drop_gun)
    {
        if (random(1)<=drop_gun_chance) && (global.gameMode == gamemode_adventure) instance_create_layer(x,y,"Interactive",drop_gun);
        else 
        {
            var broken_gun = noone;
            if (drop_gun == obj_pickup_pistol) broken_gun = spr_broken_pistol;
            if (drop_gun == obj_pickup_pistol_assault) broken_gun = spr_broken_pistol_assault;
            if (drop_gun == obj_pickup_pistol_heavy) broken_gun = spr_broken_pistol_heavy;
            if (drop_gun == obj_pickup_sniper_rifle) broken_gun = spr_broken_sniper_rifle;
            if (drop_gun == obj_pickup_assault_rifle) broken_gun = spr_broken_assault_rifle;
            if (drop_gun == obj_pickup_shotgun) broken_gun = spr_broken_shotgun;
            if (drop_gun == obj_pickup_submachinegun) broken_gun = spr_broken_submachinegun;
            if (drop_gun == obj_pickup_machinegun) broken_gun = spr_broken_machinegun;
            if (drop_gun == obj_pickup_rocketlauncher) broken_gun = spr_broken_rocketlauncher;
            if (sprite_exists(broken_gun)) draw_persistent(broken_gun,0,x,y,1,1,irandom(360),c_white,1);
        }
    }

    myCorpse = instance_create_layer(x,y,"Interactive",fx_corpse);
    myCorpse.image_xscale = image_xscale;
    if (pushed)
    {
        if (!critical_death) myCorpse.speed = push_speed*2;
        else myCorpse.speed = push_speed*4;
            
        myCorpse.direction = push_direction;
        random_death = irandom_range(1,3)
        if (random_death == 1) myCorpse.sprite_index = sprite_death;
        if (random_death == 2) myCorpse.sprite_index = sprite_death2;
        if (random_death == 3) myCorpse.sprite_index = sprite_death3;
    }
    
    if (critical_death)
    {
        audio_play_exclusive(audio_emitter,false,1,sfx_precision_kill1,sfx_precision_kill2,sfx_precision_kill3,sfx_precision_kill4,sfx_precision_kill5);
        
        myCorpse.sprite_index = sprite_death_precision;
        
        var mySkull = instance_create_layer(x+(11*image_xscale),y-49,"Interactive",fx_skull);
        mySkull.image_xscale = image_xscale;
    }
    
    if (elite) audio_play(audio_emitter,false,1,sfx_duck_death);
    else audio_play(audio_emitter,false,1,sfx_turtle_death);
    
    instance_destroy();
}
