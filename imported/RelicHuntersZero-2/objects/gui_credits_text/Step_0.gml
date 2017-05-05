///Roll Up, Animate black overlay

y += rollSpeed;

if (timeToBlackCurrent < timeToBlack) timeToBlackCurrent++;
else if (blackAlpha < 1) blackAlpha += blackAlphaSpeed;

