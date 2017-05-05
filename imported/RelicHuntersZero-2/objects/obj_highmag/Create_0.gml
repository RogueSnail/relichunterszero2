///Main Attributes
event_inherited();

name = loc_key("WPNAME_HIGHMAG");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_highmag;
shake_amount = 5;
projectile_speed = 50;
projectile_speed_decay = 0.3;
projectile_damage = 15;
projectile_range = 450;
projectile_power = 1;
projectile_recoil = 4;
accuracy = 10;
accuracy_aiming = 3;
ammo = 100;
ammo_type = type_light;
ammo_cost = 1;
reload_time = room_speed*3;
fire_rate = room_speed*0.07;
fire_automatic = true;
crosshair_recoil = 0.22;

sound = "smg";
weaponClass = "smg";

joypadRumbleFactor = 0.35;

