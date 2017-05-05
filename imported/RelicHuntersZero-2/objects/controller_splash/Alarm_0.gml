///Logo
rogueLogo = instance_create(room_width/2,room_height/2,class_gui_fader);
rogueLogo.sprite_index = spr_splash_roguelogo;
rogueLogo.fadeInDuration = room_speed*0.15;
audio_play_sound(sfx_roguesnail,1,false);

