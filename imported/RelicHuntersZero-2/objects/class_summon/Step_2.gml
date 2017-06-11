/// @description dynamic depth & death
// You can write your code in this editor
depth = -y;


//death
if (hp <= 0)
{
    var corpseSprite = sprite_death;
    
    myCorpse = instance_create_layer(x,y,"Interactive",fx_corpse);
    myCorpse.image_xscale = image_xscale;
    myCorpse.sprite_index = corpseSprite;
    
    if (pushed)
    {
        myCorpse.speed = push_speed*2;
        myCorpse.direction = push_direction;
    }
    
    audio_play(audio_emitter,false,1,sfx_kami_death);
    
    if (critical_death) audio_play_exclusive(audio_emitter,false,1,sfx_precision_kill1,sfx_precision_kill2,sfx_precision_kill3,sfx_precision_kill4,sfx_precision_kill5);
    
    instance_destroy();
}
