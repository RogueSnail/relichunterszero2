///Main Draw
if instance_exists(owner)
{
    if (owner.in_range)
    {
        if (!allowDraw){
            if (allowDrawTimeCurrent < allowDrawTime) allowDrawTimeCurrent += delta_time;
            else allowDraw = true;
        }
        else{
            var whiteBarWidth = 16;
            var whiteBarHeight = 16;
            var whiteBarWidthPerString = 5;
            var alphaSpeed = 0.002;
        
            whiteBarWidth += (whiteBarWidthPerString * (myStringLength+2) );
    
            if (!drawCompleted){
                bgAlpha += alphaSpeed;
                textAlpha += alphaSpeed;
                if (bgAlpha) && (textAlpha) drawCompleted = true;
            }
            
            draw_set_font(global.font_shopPrice);
            draw_set_valign(fa_center);
            draw_set_halign(fa_center);
            draw_rectangle_colour(x, y-(whiteBarHeight/2), x+whiteBarWidth, y+(whiteBarHeight/2), c_white, c_white, c_white, c_white, false );
            draw_set_color(c_black);
            draw_text(x+(whiteBarWidth/2),y,string_hash_to_newline(myString));
        }
    }  
    else {
        drawCompleted = false;
        bgAlpha = 0;
        textAlpha = 0;
        allowDraw = false;
        allowDrawTimeCurrent = 0;
    }
}

