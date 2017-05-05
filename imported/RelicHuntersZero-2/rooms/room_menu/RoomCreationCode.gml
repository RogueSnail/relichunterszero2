show_debug_message("room_menu");

controller = instance_create_layer(0,0,"Instances",controller_menu_main);

fade = instance_create_layer(x,y,"FadeLayer",fx_fadeFromBlack);
with(fade) {
	durationInSeconds = 1;
}


