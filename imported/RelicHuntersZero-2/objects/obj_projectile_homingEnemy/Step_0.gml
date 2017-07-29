///Homing Update
event_inherited();
if (instance_exists_fast(myGun)) myHomingTargetClass = myGun.myHomingTargetClass;
weapon_homing_update(myHomingTargetClass,true);

