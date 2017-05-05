///Adjust offset + There can be only one
event_inherited();
myFont = global.font_tinyText;
lifeMax = room_speed*0.75;
floatSpeed = floatSpeed*0.5;
offsetY = -79;

drawOutline = false;
colorOutline = c_white;

//There can be only one
while (instance_number(gui_info) > 1)
{
    otherGui = instance_find(gui_info,0);
    if (instance_exists(otherGui) && (otherGui != id))
    {
        with (otherGui) instance_destroy();
    }
    else {
        otherGui = instance_find(gui_info,1);
        if (instance_exists(otherGui) && (otherGui != id))
        {
            with (otherGui) instance_destroy();
        }
    }
}
/*
for (var i=0; i<instance_number(gui_info); i++)
{
    otherGui = instance_find(gui_info,i);
    if otherGui != id
    {
        with (otherGui) instance_destroy();
    }
}
*/

/* */
/*  */
