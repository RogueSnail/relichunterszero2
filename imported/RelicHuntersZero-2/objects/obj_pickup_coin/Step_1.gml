/// @description check events and refs
/*
if (magnet_player != noone) {

	for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
	{
		if (magnet_player == (global.eventManager.removedInstances[i])) {
			magnet_player = noone;
			break;
		}
	}
}