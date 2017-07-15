var pool = argument0;

if (ds_stack_empty(pool)) 
{
	fill_object_pool(pool, 1, fx_blood, "Interactive");
}

{
    var instance = ds_stack_pop(pool);
    instance_activate_object(instance);
	return instance;
}
