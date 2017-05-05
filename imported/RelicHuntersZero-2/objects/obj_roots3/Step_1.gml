maxhp = 150;
sprite = spr_root3;
sprite_hit = spr_root3_hit;
sprite_dirt = spr_longbox_dirt;

reflection_object_setup(-50,sprite_index,image_index);
shadow_object_setup(0,spr_longbox_reflection,image_index,global.default_shadow_yscale);

depth = -y+96;

