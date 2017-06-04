///Challenges
if (global.challengeCatapult) && (!catapultApplied) {
    grenade_count_max = grenade_count_max * global.challengeCatapultMultiplier;
    grenade_count = grenade_count_max;
    ai_grenade_chance = ai_grenade_chance * 2 * global.challengeCatapultMultiplier;
    catapultApplied = true;
}

var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{
///Animation & VFX

if (look_direction == 1) image_xscale = 1;
else image_xscale = -1;

//Hit Taken
if (hit_taken)
{   
    energy_regen_time_current = 0;
    
    if (shield)
    {
        shield_effect = instance_create_layer(x,y,"Interactive",fx_shield);
        //shield_effect.owner = id;
		owner_add_owned_instance(shield_effect);
        shield_effect.blue = false;
        hit_taken = false;
    }
    
    if (!shield)
    {
        hit_taken_count++;
        
        if (hit_taken_count >= hit_taken_max) hit_taken = false;
        if (image_index == image_number-1) image_speed = 0;
        
        if hit_taken_count = 1
        {
            sprite_index = sprite_hit;
            image_speed = 0.2;
            image_index = 0;
        }
    }
}
else
{
    if (moving) sprite_index = sprite_walk;
    else sprite_index = sprite_idle;
    
    if (dodging)
    {
        if (!instance_exists(myDash))
        {
            myDash = instance_create_layer(x,y,"Interactive",fx_duck_dash);
            myDash.owner = id;
            myDash.slowness = 2;
            myDash.alpha = 100;
        }
        if (!instance_exists(myDash2))
        {
            myDash = instance_create_layer(x,y,"Interactive",fx_duck_dash);
            myDash.owner = id;
            myDash.slowness = 4;
            myDash.alpha = 60;
        }
        sprite_index = sprite_dash;
    }
    image_speed = 0.2;
    hit_taken_count = 0;
}

///Life, Shield & Death

if (hp > hp_max) hp = hp_max;
if (energy > energy_max) energy = energy_max;

if (!elite)
{
    shield = false;
}

if hp <= 0
{
    if (!no_score)
    {
        if (!critical_death)
        {
            if (global.allowKillFreeze) global.pause = room_speed*0.1;
            score_add(global.score_kill,false);
        }
        else
        {
            if (global.allowKillFreeze) global.pause = room_speed*0.15;
            score_add(global.score_kill+global.score_headshot,true);
        }
    }
    
    repeat(coins) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
    roll_ammo_drop(x,y);
    
    if (drop_gun)
    {
        if (random(1)<=drop_gun_chance) && (global.gameMode == gamemode_adventure) instance_create_layer(x,y,"Interactive",drop_gun);
        else 
        {
            var broken_gun = noone;
            if (drop_gun == obj_pickup_pistol) broken_gun = spr_broken_pistol;
            if (drop_gun == obj_pickup_pistol_assault) broken_gun = spr_broken_pistol_assault;
            if (drop_gun == obj_pickup_pistol_heavy) broken_gun = spr_broken_pistol_heavy;
            if (drop_gun == obj_pickup_sniper_rifle) broken_gun = spr_broken_sniper_rifle;
            if (drop_gun == obj_pickup_assault_rifle) broken_gun = spr_broken_assault_rifle;
            if (drop_gun == obj_pickup_shotgun) broken_gun = spr_broken_shotgun;
            if (drop_gun == obj_pickup_submachinegun) broken_gun = spr_broken_submachinegun;
            if (drop_gun == obj_pickup_machinegun) broken_gun = spr_broken_machinegun;
            if (drop_gun == obj_pickup_rocketlauncher) broken_gun = spr_broken_rocketlauncher;
            if (sprite_exists(broken_gun)) draw_persistent(broken_gun,0,x,y,1,1,irandom(360),c_white,1);
        }
    }

    //Revive body
    var corpseObject = fx_corpse;
    if (!critical_death) && (random(1) <= reviveChance){
        corpseObject = fx_corpseRevive;
    }
    
    myCorpse = instance_create_layer(x,y,"Interactive",corpseObject);
    myCorpse.image_xscale = image_xscale;
     
    if (pushed)
    {
        if (!critical_death) myCorpse.speed = push_speed*2;
        else myCorpse.speed = push_speed*4;
            
        myCorpse.direction = push_direction;
        random_death = irandom_range(1,3)
        if (random_death == 1) myCorpse.sprite_index = sprite_death;
        if (random_death == 2) myCorpse.sprite_index = sprite_death2;
        if (random_death == 3) myCorpse.sprite_index = sprite_death3;
    }
    
    if (critical_death)
    {
        audio_play_exclusive(audio_emitter,false,1,sfx_precision_kill1,sfx_precision_kill2,sfx_precision_kill3,sfx_precision_kill4,sfx_precision_kill5);
        
        myCorpse.sprite_index = sprite_death_precision;
        
        var mySkull = instance_create_layer(x+(11*image_xscale),y-49,"Interactive",fx_skull);
        mySkull.image_xscale = image_xscale;
    }
    
    if (elite) audio_play(audio_emitter,false,1,sfx_duck_death);
    else audio_play(audio_emitter,false,1,sfx_turtle_death);
    
    ds_list_add(global.audio_cleaner,audio_emitter);
    instance_destroy();
}

//Shield
if energy < energy_max
{
    energy_regen_time_current++;
    if energy_regen_time_current >= energy_regen_time
    {
        if (!energy) energy = 1;
        shield = true;
        energy += energy_regen_speed;
        if (energy > energy_max) energy = energy_max;
    }
    
    if energy_regen_time_current = energy_regen_time
    {
        myRecharge = instance_create_layer(x,y,"Interactive",fx_shield_up);   
        myRecharge.owner = id;
        myRecharge.blue = false;
        audio_play(audio_emitter,false,9,sfx_shield_regen_start);
    }
}

if (!energy) && (shield == true)
{
    myShieldEffect = instance_create_layer(x,y,"Interactive",fx_shield_explosion);
    myShieldEffect.owner = id;
    myShieldEffect.blue = false;
    
    mySparks = instance_create_layer(x,y,"Interactive",fx_shield_down);
    mySparks.owner = id;
    mySparks.blue = false;
    
    shield = false;
    
}

///AI & Movement

//Setup
ai_movetarget_x = -1;
ai_movetarget_y = -1;
distance_to_target = 99999;
current_distance = 0;
move_speed = speed_walk;
firing = false;

var myClosestPlayer = instance_nearest(x,y,faction_player);

distance_to_player = 0;
if (instance_exists(myClosestPlayer)) distance_to_player = point_distance(x,y,myClosestPlayer.x,myClosestPlayer.y);

if (grenade_count > grenade_count_max) grenade_count = grenade_count_max;

//Activate AI
if (hit_taken) want_to_activate = true;

if (!ai_active)
{
    if (aiActivationTimeCurrent >= aiActivationTime){
        if (distance_to_player < ai_activation_range) && instance_exists(myClosestPlayer) && (!want_to_activate)
        {
            if collision_line(x,y,myClosestPlayer.x,myClosestPlayer.y,obj_limit,false,true) < 0
            {
                want_to_activate = true;
            }
        }
        
        if (want_to_activate)
        {
            ai_active = true;
            activationFX = instance_create_layer(x,y,"Interactive",fx_activation);
            activationFX.owner = id;
        }
    }
    else aiActivationTimeCurrent++;
}

//Resolve AI
if (ai_active) && ( (distance_to_player < ai_shutdown_range) || (on_screen(x,y)) )
{
    //Find my Target (Faction Check)
    fuckingEnemy = instance_nearest(x,y,faction_monster);
    if (instance_exists(fuckingEnemy)) distance_to_enemy = point_distance(x,y,fuckingEnemy.x,fuckingEnemy.y);
    else distance_to_enemy = 99999;
    
    
    if ai_target_change_current >= ai_target_change || (!instance_exists(ai_target))
    {
        ai_target_change_current = 0;
        
        if (distance_to_enemy < distance_to_player)
        {
            ai_target = fuckingEnemy;
            distance_to_target = distance_to_enemy;
        }
        else 
        {
            ai_target = myClosestPlayer;
            distance_to_target = distance_to_player;
        }
    }
    else 
    {
        ai_target_change_current++;
        if (ai_target = myClosestPlayer) distance_to_target = distance_to_player;
        else distance_to_target = distance_to_enemy;
    }
        
    // Resolve AI with Target found
    
    if instance_exists(ai_target) && (!pushed)
    {
        //Aggro Control
        if (distance_to_target <= aggro_distance) aggro += aggro_add_close;
        if (ai_state == "PATROL" || ai_state == "COVER") aggro += aggro_add_patrol;
        if (ai_state == "CHASE") aggro -= aggro_cost_chase;
        
        if (ai_state == "PATROL" && distance_to_target > ai_patrol_max) aggro += aggro_add_close;
        
        
        if (aggro < 0) aggro = 0;
        if (aggro > aggro_max) aggro = aggro_max;
        
        if (energy <= ai_cover_shield_threshold) && (hp > ai_cover_hp_threshold) && (elite)
        {
            ai_state = "COVER";
        }
        
        if instance_exists(class_grenadeNew)
        {
            wow_look_out_dude = instance_nearest(x,y,class_grenadeNew);
            if (point_distance(x,y,wow_look_out_dude.x,wow_look_out_dude.y) <= wow_look_out_dude.detonationRadius+50) && ai_test_dash_chance(10)
            {
                ai_state = "DASH";
                dash_direction = 180+point_direction(x,y,wow_look_out_dude.x,wow_look_out_dude.y);
            }
        }
        
        //State Switches
        if ai_state == "CHASE"
        {
            if (aggro <= 0) 
            { 
                ai_state = "PATROL"; 
                exit; 
            }
            
            if (ai_test_dash_chance(1))
            { 
                ai_state = "DASH"; 
                dash_direction = irandom_range(-50,50) + point_direction(x,y,ai_target.x,ai_target.y);
                exit;
            }
        }
        
        if ai_state == "COVER"
        {
            if (energy >= energy_max) 
            { 
                ai_state = "PATROL"; 
                exit; 
            }
            if (hp <= ai_cover_hp_threshold) 
            { 
                ai_state = "CHASE"; 
                exit; 
            }
        }
        
        if ai_state == "PATROL"
        {
            if aggro >= aggro_min_chase
            {
                ai_state = "CHASE";
                exit;
            }
        }
        
        //State Descriptions
        if ai_state == "CHASE"
        {
            sight_forbidden = noone;
            sight_blocked = (collision_line(x,y,ai_target.x,ai_target.y,class_solid,false,true));
            if (sight_blocked) sight_forbidden = (collision_line(x,y,ai_target.x,ai_target.y,obj_limit,false,true));
            
            throwGrenade = false;
            if (sight_blocked) && (!sight_forbidden) && (grenade_count) && (ai_test_grenade_chance(ai_grenade_cover_multiplier)) && (distance_to_target <= 400) && (!instance_exists(ai_myGrenade)) throwGrenade = true;
            if (!sight_forbidden) && (grenade_count) && (distance_to_target <= 400) && (!instance_exists(ai_myGrenade)) && (ai_test_grenade_chance(1)) throwGrenade = true;
            
            if (throwGrenade)
            {
                ai_myGrenade = instance_create_layer(x,y,"Interactive",obj_grenade_enemyNew);
                ai_myGrenade.speed = 8;
                ai_myGrenade.direction = point_direction(x,y,ai_target.x,ai_target.y);
                grenade_count--;
            }
            
            if (distance_to_target > fire_range) || ( (sight_blocked) && (!ai_supression) ) || (sight_forbidden && (!ai_supression)) || (sight_blocked && ai_target != myClosestPlayer)
            {
                ai_movetarget_x = ai_target.x;
                ai_movetarget_y = ai_target.y;
                firing = false;
            }
            else
            {
                ai_movetarget_x = x;
                ai_movetarget_y = y;
                firing = true;
            }
            
            if (sight_forbidden) && (ai_supression) aggro -= aggro_cost_sight_forbidden;
        }
        
        if ai_state == "COVER"
        {
            move_speed = speed_sprint;
            sight_blocked = (collision_line(x,y,ai_target.x,ai_target.y,class_solid,false,true));
            if (distance_to_target <= fire_range) && (!sight_blocked) firing = true;
            
            //Checks for nearby covers
            if ds_priority_empty(ai_cover_priority)
            {
                cover_count = instance_number(obj_wall);
                for (i=0; i<cover_count; i++)
                {
                    cover_candidate = instance_find(obj_wall,i);
                    cover_distance = point_distance(x,y,cover_candidate.x,cover_candidate.y);
                    if cover_distance <= ai_cover_check_range
                    {
                        ds_priority_add(ai_cover_priority,cover_candidate,cover_distance);
                    }    
                }
            }
            
            //Look for best closest cover position against player (checks 4 sides)
            if (!ds_priority_empty(ai_cover_priority)) && (ai_cover_x == -1) && (ai_cover_y == -1)
            {
                tile_size = 64;
                current_distance = 99999;
                for (i=0; i<ds_priority_size(ai_cover_priority); i++)
                {
                    cover_candidate = ds_priority_delete_min(ai_cover_priority);
                    if instance_exists(cover_candidate)
                    {
                        //Side 1
                        checkX = cover_candidate.x-(tile_size/2);
                        checkY = cover_candidate.y+(tile_size/2);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,checkX,checkY)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        }
                        //Side2
                        checkX = cover_candidate.x+(tile_size*1.5);
                        checkY = cover_candidate.y+(tile_size/2);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,checkX,checkY)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        }
                        //Side3
                        checkX = cover_candidate.x+(tile_size/2);
                        checkY = cover_candidate.y-(tile_size/2);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,checkX,checkY)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        }
                        //Side4
                        checkX = cover_candidate.x+(tile_size/2);
                        checkY = cover_candidate.y+(tile_size*1.5);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,checkX,checkY)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        } 
                    }
                }
            }
            
            //Resolve
            if (ai_cover_x) && (ai_cover_y)
            {
                ai_movetarget_x = ai_cover_x;
                ai_movetarget_y = ai_cover_y;
                
                if point_distance(x,y,ai_cover_x,ai_cover_y) < 20
                {
                    ai_cover_x = -1;
                    ai_cover_y = -1;
                    ds_priority_clear(ai_cover_priority);
                }
            }
            
        }
        
        if ai_state == "PATROL"
        {
            if (ai_patrol_x) && (ai_patrol_y)
            {
                if (collision_point(ai_patrol_x,ai_patrol_y,class_solid,false,true) < 0)
                {
                    ai_movetarget_x = ai_patrol_x;
                    ai_movetarget_y = ai_patrol_y;
                }
                else
                {
                    ai_movetarget_x = x;
                    ai_movetarget_y = y;
                }
            }
            else
            {
                ai_patrol_x = x+(random_range(-400,400));
                ai_patrol_y = y+(random_range(-400,400));
            }
        }
        else
        {
            ai_patrol_x = -1;
            ai_patrol_y = -1;
        }
        
        if ai_state == "DASH"
        {
            ai_state = "PATROL";
            ai_dash_cooldown_current = 0;
            audio_play(audio_emitter,false,1,sfx_dash1,sfx_dash2,sfx_dash3);
            
            dodging = true;
            pushed = true;
            push_direction = dash_direction;
            push_speed = dash_speed;
            exit;
        }
        else if (ai_dash_cooldown_current < ai_dash_cooldown) ai_dash_cooldown_current++;
    }
}

//Look Direction
if instance_exists(ai_target)
{
    if (ai_target.x > x) look_direction = 1;   
    else look_direction = 0;
}

//Force to stop when firing a burst
if (my_gun) && (my_gun!= noone)
{
    if (my_gun.fire_burst_current)
    {
        ai_movetarget_x = x;
        ai_movetarget_y = y;
        firing = true;
    }
}

//Resolve
path_update();

moving = false;
if (ai_movetarget_x) && (ai_movetarget_y) && point_distance(x,y,ai_movetarget_x,ai_movetarget_y) > 3
{
    moving = true;
}


// Push
if (pushed)
{
    path_end();
    move_step_ext(x + lengthdir_x(push_speed, push_direction),y + lengthdir_y(push_speed, push_direction),0,class_solid,0,0,0,0,0,0);

    push_speed -= push_friction;
    if push_speed < 0 
    {
        push_speed = 0;
        push_duration_current = 0;
        pushed = false;
        dodging = false;
    }
    
    push_duration_current++;
    if push_duration_current >= push_duration
    {
        push_duration_current = 0;
        pushed = false;
        dodging = false;
    }
}
else push_speed = 0;


///Audio
audio_emitter_position(audio_emitter, x, y, 0);

}
}
///Anti-Bug: Destroy If Inside Wall

if collision_point(x,y,obj_limit,false,true)
{
    myCorpse = instance_create_layer(x,y,"Interactive",fx_corpse);
    myCorpse.image_xscale = image_xscale;
    if (pushed)
    {
        myCorpse.speed = push_speed*2;
        myCorpse.direction = push_direction;
        myCorpse.sprite_index = sprite_death;
    }
    
    instance_destroy();
}

