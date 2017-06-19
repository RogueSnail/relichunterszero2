/// @description dynamic depth & death
// You can write your code in this editor
depth = -y;

//Death
if (hp <= 0)
{
    var corpseSprite = sprite_death;
    
    if (no_score == false)
    {
        if (!critical_death)
        {
            if (global.allowKillFreeze) global.pause = 50000;//room_speed*0.05;
            score_add(myRegularScore,false);
            
            var randomDeath = irandom_range(1,2)
            if (randomDeath == 1) corpseSprite = sprite_death;
            if (randomDeath == 2) corpseSprite = sprite_death2;
        }
        else
        {
            if (global.allowKillFreeze) global.pause = 75000;//room_speed*0.075;
            score_add(myRegularScore+myPrecisionScore,true);
            
            var randomDeath = irandom_range(1,3)
            if (randomDeath == 1) corpseSprite = sprite_precision1;
            if (randomDeath == 2) corpseSprite = sprite_precision2;
            if (randomDeath == 3) corpseSprite = sprite_precision3;
        }
    }
    
    repeat(myCoinDropAmount) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
    
    //Revive body
    var corpseObject = fx_corpse;
    if (!isWormZombie) && (!critical_death) && (random(1) <= reviveChance){
        corpseObject = fx_corpseRevive;
    }
    
    myCorpse = instance_create_layer(x,y,"Interactive",corpseObject);
    myCorpse.image_xscale = image_xscale;
    myCorpse.sprite_index = corpseSprite;
    
    if (pushed)
    {
        myCorpse.speed = push_speed*2;
        myCorpse.direction = push_direction;
    }
    
    audio_play(audio_emitter,false,1,deathSfx);
    
    if (critical_death) {
        audio_play_exclusive(audio_emitter,false,1,sfx_precision_kill1,sfx_precision_kill2,sfx_precision_kill3,sfx_precision_kill4,sfx_precision_kill5);
        
        var mySkull = instance_create_layer(x+(11*image_xscale),y-49,"Interactive",fx_skull);
        mySkull.image_xscale = image_xscale;
    }
    
    if (isWormZombie) {
        repeat(8) instance_create_layer(x+random_range(-10,10),y+random_range(-49,-20),"Interactive",fx_worm);
    }
    
    instance_destroy();
}
