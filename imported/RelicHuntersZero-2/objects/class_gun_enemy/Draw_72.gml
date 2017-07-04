/// @description check events and refs
if (owner != noone) {

	/// @description check events and refs
	if (owner.ai_target != noone) {

		for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
		{
			if (owner.ai_target == (global.eventManager.removedInstances[i])) {
				owner.ai_target = noone;
				break;
			}
		}
	}

	for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
	{
		if (owner == (global.eventManager.removedInstances[i])) {
			owner = noone;
			break;
		}
	}
}