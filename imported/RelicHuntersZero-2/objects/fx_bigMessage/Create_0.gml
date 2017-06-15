///Main Variables

textBig = "NEW TEXT UNLOCKED!";
textSmall = "CHECK OUT THIS NIFTY TEXT, ISNT IT COOL?";

textBigFont = global.font_menuLarge;
textBigColor = K_BETU_GREEN2;

textSmallFont = global.font_menuMedium;
textSmallColor = c_white;


if (instance_number(fx_bigMessage) == 1) active = true;
else active = false;

myAlpha = 0;
myAlphaSpeed = 2/room_speed;

lifeTime = 3000000;//room_speed*3;
lifeTimeCurrent = 0;
timeToDie = false;
myAlphaDieSpeed = 1/room_speed;


relicSprite1 = -1;
relicSprite1Draw = false;
relicSprite2 = -1;
relicSprite2Draw = false;
relicSprite3 = -1;
relicSprite3Draw = false;
relicCompleteSprite = -1;
hunterUnlockSprite = -1;

