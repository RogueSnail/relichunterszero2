///gui_info_weapon_create(owner,color,string);

var owner,color,text;

owner=argument0;
color=argument1;
text=argument2;

if instance_exists(owner)
{
    var guiInfo = instance_create_layer(owner.x,owner.y,"Interactive",gui_info);
    
    guiInfo.colorMain = color;
    guiInfo.myString = text;
    guiInfo.owner = owner;
    
    return true;
}
else return false;
