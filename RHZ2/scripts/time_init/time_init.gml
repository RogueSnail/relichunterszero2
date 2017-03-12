/// @description Inits global.time variable with target framerate (recommended 60)
/// @param fps target framerate

	/*
	Requires time_update() to be called every frame on Begin Step;
	*/
	
global.targetFps = argument0;
global.time = 1;
room_speed = global.targetFps;