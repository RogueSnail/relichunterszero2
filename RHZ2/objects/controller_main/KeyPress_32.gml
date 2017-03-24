/// @description Insert description here
// You can write your code in this editor

show_debug_message("aqui");

with(global.playerBaseInstance) {	

	tempInstance = instance_copy(false);
	tempInstance.x = irandom_range(0, room_width);
	tempInstance.y = irandom_range(0, room_height);
		
	//set a random anim
	randAnim = irandom_range(0, anim_player_count-1);
	//show_debug_message(string(randAnim));
	tempInstance.sprite_index = spriteAnimations[randAnim];
	object_set_sprite(tempInstance.sprite_index, spriteAnimations[randAnim]);	
}
