///Main Config + Create Buttons

slotInput = -1;
slotCharacter = -1;
myPlayerId = -1;

mySpecialOkButton = instance_create(x-36,y+264,menu_char_buttonOk);
mySpecialCancelButton = instance_create(x+122,y+300,menu_char_buttonCancel);

myStatCard = instance_create(x+90,y+40,menu_char_playerStat);

mySpecialCancelButton.owner  = id;
mySpecialOkButton.owner  = id;
myStatCard.owner = id;

cardName = "P1";
cardSprite = spr_card_jimmy;

inputSprite = spr_char_inputKey;

