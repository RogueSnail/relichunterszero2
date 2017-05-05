///Coin Drop

repeat(10) instance_create(x,y,obj_pickup_coin);

coinDrops--;

if (coinDrops) alarm[0] = room_speed*0.5;
else
{
    var fader = instance_create_depth(x,y,fade_depth,fx_fadeToBlack);
    fader.durationInSeconds = 4;
    alarm[1] = room_speed*6;
}

