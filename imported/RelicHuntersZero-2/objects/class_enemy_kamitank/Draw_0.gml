depth = -y;
draw_self();

//Pause Animation
old_image_speed = image_speed;
if (global.pause)
{
    image_speed = 0;
    path_end();
}
else image_speed = old_image_speed;

///draw alert Radius
if (defenseMode)
{
    if (defenseCooldownCurrent >= 1)
    {
        depth = layer_get_depth("Interactive_Over");
        draw_set_colour(K_BETU_RED);
        draw_set_alpha(radiusAlpha);
        draw_rectangle(x-radius-1,y-radius-1,x+radius+1,y+radius+1,true);
        draw_rectangle(x-radius,y-radius,x+radius,y+radius,true);
        draw_rectangle(x-radius+1,y-radius+1,x+radius-1,y+radius-1,true);
    }
}

//Debug
/*
draw_set_font(global.font_numberSmall);
draw_text(x,y-30,ai_state);

if (ai_state == 'PATROL')
{
    draw_text(x,y+30,string(ai_patrol_x)+','+string(ai_patrol_y));
}

/* */
/*  */
