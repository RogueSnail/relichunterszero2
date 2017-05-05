///Pickup
if (vertical_speed_start < interactive_speed) && (instance_exists(other))
{
    var myScore = 10;
    if (global.character[1] == char_ass || global.character[2] == char_ass) myScore += 12;
    if (global.relic_morning_star == 2) myScore += 12;
    if (global.character[1] == char_rider || global.character[2] == char_rider) myScore = floor(myScore*0.7);
    
    if (global.gameMode == gamemode_adventure) global.score_total += myScore;
    else if (global.gameMode == gamemode_endless) 
    {
        global.bountyEndless += myScore;
        global.scoreEndless += myScore;
    }
    global.statTotalBounty += myScore;
    gui = instance_create(0,0,gui_score);
    gui.value += myScore;
    gui.coin = true;
    
    if (instance_exists(global.dynamicBounty)) global.dynamicBounty.timedActive = true;
    
    if audio_emitter_exists(other.audio_emitter) audio_play(other.audio_emitter, false, 1, sfx_coin1, sfx_coin2, sfx_coin3);
    instance_destroy();
}

