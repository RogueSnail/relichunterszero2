/// @description Insert description here
// You can write your code in this editor

show_debug_message("aqui");

var tempPlayerInstance;

with(global.playerBaseInstance) {	

	tempPlayerInstance = instance_copy(false);
	tempPlayerInstance.x = irandom_range(0, room_width);
	tempPlayerInstance.y = irandom_range(0, room_height);
		
	//set a random anim
	randAnim = irandom_range(0, anim_player_count-1);
	//show_debug_message(string(randAnim));
	tempPlayerInstance.sprite_index = spriteAnimations[randAnim];
	object_set_sprite(tempPlayerInstance.sprite_index, spriteAnimations[randAnim]);
}

var tempWeaponInstance;

with(global.weaponBaseInstance) {	

	tempWeaponInstance = instance_copy(false);
	tempWeaponInstance.x = tempPlayerInstance.x;
	tempWeaponInstance.y = tempPlayerInstance.y;
	
	weapon_set_animation_frame("highlight");
}
