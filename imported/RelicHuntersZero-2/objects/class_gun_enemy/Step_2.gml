<<<<<<< HEAD
/// @description check events and refs
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

if (instance_exists_fast(owner)) {
    x = owner.x;
    y = owner.y-15;
	depth = (owner.depth)-1;
}
else {
	instance_destroy();
	dispatch_event(EVENT_INSTANCE_REMOVED,id);
}
