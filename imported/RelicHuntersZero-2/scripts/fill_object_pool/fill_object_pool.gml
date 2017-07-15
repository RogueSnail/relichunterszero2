var pool = argument0;
var elements = argument1;
var object = argument2;
var layer_name = argument3;

for (var i = 0; i < elements; i += 1) {
	//var instance = instance_create_layer(0,0,layer_get_id(layer_name),object);
	var instance = instance_create(0,0,object);
	add_object_to_pool(pool, instance);
}
