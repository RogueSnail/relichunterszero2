///Main Attributes
event_inherited();

name = loc_key("WPNAME_KEYTAR");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_keytar;
dropCasing = false;

allowPrecision = false;
shake_amount = 15;
projectile_obj = obj_sonicboom;
projectile_speed = 25;
projectile_speed_decay = 0.12;
projectile_damage = 40;
projectile_range = 420;
projectile_power = 7;
projectile_recoil = 4;
projectile_piercing = 3;
accuracy = 1;
accuracy_aiming = 1;
ammo = 10;
ammo_type = type_medium;
ammo_cost = 3;
reload_time = room_speed*2;
fire_rate = room_speed*0.15;
fire_automatic = false;

crosshair_recoil = 0.1;
sound = "keytar";

goesThroughWalls = true;

joypadRumbleFactor = 0.6;

