///Barrel Spawn

if !(instance_exists(myBarrel))
{
    spawnTimeCurrent++;
    
    if (spawnTimeCurrent >= spawnTimeWarning) && (!startAnimating)
    {
        if (!instance_exists(myWarning)) myWarning = instance_create_layer(get_bbox_centerX(id),y-30,"Interactive",fx_activation);
    }
    
    if (spawnTimeCurrent >= spawnTime)
    {
        startAnimating = true;
        image_speed = 0.2;
        depth = -y;
    }
}

