image_speed = 0;
ds_list_destroy(damage_list);
ds_list_destroy(hit_list);
global.shock_enabled = false;
ds_list_add(global.audio_cleaner,audio_emitter);
instance_destroy();

