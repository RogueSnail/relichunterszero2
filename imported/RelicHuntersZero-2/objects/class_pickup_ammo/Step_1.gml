if (activationClient != noone) {
	for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
	{
		if (activationClient == (global.eventManager.removedInstances[i])) {
			activationClient = noone;
			break;
		}
	}
}