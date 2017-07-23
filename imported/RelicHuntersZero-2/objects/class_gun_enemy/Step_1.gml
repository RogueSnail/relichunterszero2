/// @description check events and refs
/*
if (owner != noone) {
	for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
	{
		if (owner == (global.eventManager.removedInstances[i])) {
			owner = noone;
			break;
		}
	}
}

if (owner != noone) {
	if (owner.ai_target != noone) {

		for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
		{
			if (owner.ai_target == (global.eventManager.removedInstances[i])) {
				owner.ai_target = noone;
				break;
			}
		}
	}
}


///Death
if (owner == noone) {
	instance_destroy();
}
