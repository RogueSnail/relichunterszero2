///Main Variables

event_inherited();

myScale = 1.25;
image_xscale = 1.25;
image_yscale = 1.25;

energy_max = 0;
hp_max = 400;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));
damage = 20;

speed_walk = 3;
speed_sprint = 3;

ai_dash_chance = 5;
ai_dash_cooldown = room_speed*2;

