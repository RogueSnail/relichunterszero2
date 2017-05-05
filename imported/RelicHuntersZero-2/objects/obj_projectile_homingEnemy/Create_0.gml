///Homing Setup + myHomingTargetClass
event_inherited();

speed = 4;
maxSpeed = 12;
decay = -0.02;

myHomingTargetClass = class_player;
weapon_homing_setup(3,0.008,0.1,180,5,100,1200);

