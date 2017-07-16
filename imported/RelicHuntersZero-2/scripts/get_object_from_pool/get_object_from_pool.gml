///get_object_from_pool(pool_index)
//see macros, create_object_pool, init_object_pools
var pool_index = argument0;
var instance = global.pool[pool_index, global.pool_at[pool_index]++];

//instance.visible = true;
instance_activate_object(instance);

global.pool_at[pool_index] = global.pool_at[pool_index] mod global.pool_size[pool_index];

return instance;