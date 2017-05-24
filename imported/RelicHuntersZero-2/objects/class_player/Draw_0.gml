///Draw Event + Digging

if (!isDigging) 
{
    draw_self();
    if (animation_current == "dig") draw_sprite_ext(spr_shovel_dig,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
else{
    draw_sprite_part( sprite_index,image_index,0,0,sprite_width,sprite_height-digDepth,x-sprite_xoffset,(y-sprite_yoffset)+digDepth );
   
    if (animation_current != "dig") draw_sprite(spr_shovel_idle,image_index,x,y);
    else draw_sprite_part( spr_shovel_dig,image_index,0,0,sprite_width,sprite_height-digDepth,x-sprite_xoffset,(y-sprite_yoffset)+digDepth );
    
    var digProgress = digDepthMax/3;
    var digImage = 0;
    
    if (digDepth < digProgress) digImage = 0;
    if (digDepth >= digProgress) && (digDepth < (digProgress*2)) digImage = 1;
    if (digDepth >= (digProgress*2)) digImage = 2;
 
    draw_sprite_ext(spr_digPile,digImage,x,y,1,1,0,myDirtColor,1);
}

