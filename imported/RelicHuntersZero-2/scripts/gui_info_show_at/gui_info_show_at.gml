///@ gui_info_show_at(owner,x,y,layer,color,text)
if (global.guiInfo != noone) {

	global.guiInfo.owner = argument0;
	global.guiInfo.x = argument1;
	global.guiInfo.y = argument2;
	global.guiInfo.layer = layer_get_id(argument3);
	global.guiInfo.colorMain = argument4;
	global.guiInfo.mystring = argument5;
	
	global.guiInfo.myAlpha = 1;
	global.guiInfo.lifeMax = room_speed*0.75;
	
	global.guiInfo.visible = true;
}