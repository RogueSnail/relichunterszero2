///Self-Activation

event_inherited();

if (!timedActive) isActive = false;

if (room==room_start) || (room==room_shop) || (room==room_endShop) || (global.pauseMenu)
{
    isActive = true;
}

//Also timedActivated by the pickup_coin


