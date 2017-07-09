
///Explode
if (explode)
{
    var kami = instance_create_layer(drawX,drawY,"Interactive",obj_kamiAlly);
    
    audio_emitter_free(audio_emitter);
    instance_destroy();
}

