depth=-y-5;

if (global.unlock_medium2)
{
    instance_create_layer(x,y,"GUI",obj_pickup_mediumammo);
    instance_destroy();
}

//Betu Goze
if (!on_top_of_object)
{
    myObject = collision_point(x,y,obj_wall,false,true);
    if (instance_exists_fast(myObject)) on_top_of_object = true; 
}

if (on_top_of_object)
{
    if (!instance_exists_fast(myObject))
    {
        y+=32;
        on_top_of_object = false;
    }
}


