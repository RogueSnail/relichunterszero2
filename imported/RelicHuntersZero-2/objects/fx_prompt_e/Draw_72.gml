/// @description checking instance exists

if !instance_exists_fast(owner) 
{
	owner = noone;
	surface_free(circleSurface);
    instance_destroy();
}
else if instance_exists_fast(owner.activationClient)
{
	player = owner.activationClient;
}
else player = noone;
