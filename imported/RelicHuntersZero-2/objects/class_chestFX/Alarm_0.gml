///Spawn coins

repeat (10) instance_create(x,y,obj_pickup_coin);
spawnCoins--;

if (spawnCoins) alarm[0] = room_speed*0.5;

