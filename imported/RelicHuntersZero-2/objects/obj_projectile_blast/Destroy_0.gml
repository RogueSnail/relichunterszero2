///Create mini-explosion
var blast = instance_create(x,y,fx_explosion_mini);
var blastDamage = damage * 4;

if (global.relic_midnight_beer == 2) blastDamage += round(blastDamage*global.midnightDamageMultiplier ); //Midnight Beer
if (global.relic_midnight_meal == 2) blastDamage += round(blastDamage*global.midnightDamageMultiplier ); //Midnight Meal

blast.damage = blastDamage;

