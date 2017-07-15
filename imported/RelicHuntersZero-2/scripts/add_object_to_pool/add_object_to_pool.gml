var pool = argument0;
var instance = argument1;
	
ds_stack_push(pool, instance.id);
instance_deactivate_object(instance.id);
