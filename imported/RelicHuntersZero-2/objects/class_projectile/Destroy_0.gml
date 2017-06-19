/// @description hit fx & cleanup

if ((hit == noone) && (global.count_particles < global.max_particles))
{
    hit = instance_create_layer(x,y,"Interactive",fx_hit);
    hit.type = ammo_type;
}

ds_list_destroy(damage_list);
ds_list_add(global.audio_cleaner,audio_emitter);