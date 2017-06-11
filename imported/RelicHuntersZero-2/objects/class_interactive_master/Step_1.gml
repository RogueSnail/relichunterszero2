///Reset my own activation before Player checks

if (!activationOverride){
    activationClient = noone;
    wantToActivate = false;
    in_range = false;
}

/// @description check events and refs
if (activationClient != noone) {

	for (var i = array_length_1d(global.eventManager.removedInstances) - 1; i > -1; i--;)
	{
		if (activationClient == (global.eventManager.removedInstances[i])) {
			activationClient = noone;
			break;
		}
	}
}


///Release Client Lock (bug-proofing)

if (isClientLocked)
{
    if (clientLockReleaseCurrent < clientLockRelease) clientLockReleaseCurrent += delta_time;
    else isClientLocked = false;
}
else clientLockReleaseCurrent = 0;



