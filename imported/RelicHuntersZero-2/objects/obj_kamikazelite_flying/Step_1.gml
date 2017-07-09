/// @description check events and refs
if (ai_target != noone) {

	for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
	{
		if (ai_target == (global.eventManager.removedInstances[i])) {
			ai_target = noone;
			break;
		}
	}
}
