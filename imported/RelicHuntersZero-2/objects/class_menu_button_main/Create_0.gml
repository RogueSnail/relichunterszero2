///Main Stuff

event_inherited();

var horAdjustment = 50;
if (room == room_menu) horAdjustment = 20;

textXOffset = __view_get( e__VW.XView, 0 )+(point_distance(x,y,bbox_left,y) - x) + horAdjustment;
textYOffset = 0;

myFont = global.font_menuLarge;

starPositionX = point_distance(x,y,bbox_right,y) - 32;
starPositionY = 0;

starScaleInitial = 1.5;
starScale = starScaleInitial;
starScaleSpeed = 0.025;
starScaleFinal = 1;



moveSpeed = 5;
moveDistance = 50;

startPositionX = x;
startPositionY = y;

selectPositionX = x+moveDistance;
selectPositionY = y;

