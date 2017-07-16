///Randomize Direction
//if (!active) return;
/*
if (!randomizeDir) 
{   
    sprite_subimage = irandom(3);
    randomizeDir = true;
    
    direction = random(360);
}
*/

if (!active) {
	//depth = layer_get_depth(layer_get_id("Dynamics"));
	layer_add_instance(layer_get_id("Dynamics"), id);
	//instance_deactivate_object(id);
	instance_deactivate_layer(layer_get_id("Dynamics"));
}