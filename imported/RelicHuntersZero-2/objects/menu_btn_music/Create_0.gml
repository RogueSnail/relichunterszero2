///Button Config

event_inherited();
isAvailable = true;
myBoxSprite = spr_toggle_box_small;

myVariable = (global.musicVolume)*10;
myVariableMax = 10;

labelString = loc_key("SETTINGS_MUSIC");
myValueString = string(myVariable);

textOffsetX = (point_distance(x,y,bbox_right,y)) - 62;
textOffsetY = 0;

starPositionX = -1 * (point_distance(x,y,bbox_right,y)) + 32;
starPositionY = 0;


