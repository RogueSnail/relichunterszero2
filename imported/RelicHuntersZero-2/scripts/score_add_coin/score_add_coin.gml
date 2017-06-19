//show score
var myScore = argument0;

if (global.gameMode == gamemode_adventure) global.score_total += myScore;
else if (global.gameMode == gamemode_endless) 
{
    global.bountyEndless += myScore;
    global.scoreEndless += myScore;
}
global.statTotalBounty += myScore;	
    
//if (instance_exists(global.dynamicBounty))  {
	global.dynamicBounty.timedActive = true;
//}

var layer_id = layer_get_id("GUI");
layer_add_instance(layer_id, global.guiScore);
with (global.guiScore) {
	showScore = true;
	value += myScore;
	coin = true;
}