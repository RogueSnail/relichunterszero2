/// @description MACROS (Constants) for the game

	/*
	Should be initialized on game's bootstrap;
	*/
	
// Languages
#macro lang_english 1;
#macro lang_ptbr 2;
#macro lang_huebr 3;
#macro lang_russian 4;
#macro lang_japanese 5;
#macro lang_german 6;
#macro lang_french 7;
#macro lang_spanish 8;
#macro lang_czech 9;
#macro lang_korean 10;
#macro lang_dutch 11;
#macro lang_italian 12;
#macro lang_chineseTr 13;
#macro lang_chineseSp 14;
#macro lang_indonesian 15;
#macro lang_polish 16;
#macro lang_hungary 17;
#macro lang_thai 18;
#macro lang_norwegian 19;
#macro lang_danish 20;
#macro lang_roumanian 21;
#macro lang_pirate 22;
#macro lang_hebrew 23;
#macro lang_swedish 24;
#macro lang_greek 25;
#macro lang_vietnam 26;
#macro lang_turkish 27;
#macro lang_arabic 28;
#macro lang_ptpt 29;
#macro lang_suomi 30;

// Modes
#macro gamemode_adventure 0;
#macro gamemode_endless 1;

//Characters
#macro K_CHAR_JIMMY 1;
#macro char_pinky 2;
#macro char_raff 3;
#macro char_biu 4;
#macro char_punny 5;
#macro char_ass 6;
#macro char_rider 7;
#macro char_random 99;

//Animation
#macro an_loop 1;
#macro an_clamp 2 ;
#macro an_clamp_forever 3;

//Factions
#macro f_player 0;
#macro f_enemy 1;
#macro f_all 2;

//Ammo
#macro type_light 0;
#macro type_medium 1;
#macro type_heavy 2;
#macro type_grenade 3;

//Colors
#macro K_BETU_RED make_color_rgb(178,0,65);
#macro K_BETU_GREEN2 make_color_rgb(99,210,0);
#macro K_BETU_GREEN make_color_rgb(0,178,45);
#macro K_BETU_BLUE make_color_rgb(0,88,178);
#macro K_BETU_ORANGE make_color_rgb(255,94,0);
#macro K_BETU_YELLOW make_color_rgb(244,246,0);
#macro K_BETU_MAGENTA_PAUSE make_color_rgb(255,26,96);
#macro K_BETU_MAGENTA make_colour_rgb(239,4,68);

//Aiming Options
#macro K_AUTOAIM_OFF 0;
#macro K_AUTOAIM_ASSIST 1;
#macro K_AUTOAIM_FULL 2;

//Projectiles
#macro K_PROJECTILE_BASIC 0;
#macro K_PROJECTILE_FLAME 1;
#macro K_PROJECTILE_ROCKET 2;
#macro K_PROJECTILE_SONIC 3

//Input
#macro K_INPUT_JOYSTICK1 0;
#macro K_INPUT_JOYSTICK2 1;
#macro K_INPUT_KEYBOARD 4;
#macro K_INPUT_ALL 9;