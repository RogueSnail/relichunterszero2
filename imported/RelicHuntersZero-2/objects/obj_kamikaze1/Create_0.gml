///Main Variables

event_inherited();

energy_max = 0;
hp_max = 36;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));
damage = 12;

speed_walk = 3.25;
speed_sprint = 3.25;

ai_dash_chance = 5;
ai_dash_cooldown = 2000000;//room_speed*2;

image_xscale = 1.25;
image_yscale = 1.25;

