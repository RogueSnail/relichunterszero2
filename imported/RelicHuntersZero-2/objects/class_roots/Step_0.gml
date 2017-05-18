event_inherited();

if (hp < 0)
{
    audio_play_exclusive(audio_emitter,false,1,sfx_debris1,sfx_debris2,sfx_debris3);
    ds_list_add(global.audio_cleaner,audio_emitter);
    
    myBreakObject = instance_create_layer(x,y,"Interactive",fx_roots_break);
    myBreakObject.sprite_index = breakSprite;
    instance_destroy();
}

