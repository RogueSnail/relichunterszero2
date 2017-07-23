/// @description follow, cleanup, check events

if (instance_exists_fast(owner)) {
    x = owner.x;
    y = owner.y-15;
	depth = (owner.depth)-1;
}
else {
	instance_destroy();
	dispatch_event(EVENT_INSTANCE_REMOVED,id);
}
