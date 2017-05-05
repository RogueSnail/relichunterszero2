///Physics

depth= -y;

if (vertical_speed_start) vertical_speed += fake_gravity;
else depth= 999999999999999;

casing_height += vertical_speed;
casing_angle += angular_speed;

if casing_height >= 0 && (vertical_speed_start)
{
    casing_height = 0;
    vertical_speed = 0;
    vertical_speed_start -= random_range(bounce_min,bounce_max);
        
    if (vertical_speed_start <= vertical_speed_start_min)
    {
        vertical_speed_start = 0;
        angular_speed = 0;
    }
    else 
    {
        angular_speed = random_range(angular_min,angular_max);
        vertical_speed = -vertical_speed_start;
    }
}

///Subimage
if (ammo_type == type_light) casing_subimage = 0;
if (ammo_type == type_medium) casing_subimage = 1;
if (ammo_type == type_heavy) casing_subimage = 2;

