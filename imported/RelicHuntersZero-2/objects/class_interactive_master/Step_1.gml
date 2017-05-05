///Reset my own activation before Player checks

if (!activationOverride){
    activationClient = noone;
    wantToActivate = false;
    in_range = false;
}

///Release Client Lock (bug-proofing)

if (isClientLocked)
{
    if (clientLockReleaseCurrent < clientLockRelease) clientLockReleaseCurrent++;
    else isClientLocked = false;
}
else clientLockReleaseCurrent = 0;



