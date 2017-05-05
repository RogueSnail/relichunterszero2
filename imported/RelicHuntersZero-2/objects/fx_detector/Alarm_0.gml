///Create child if possible, create arrow
if (allowChild)
{
    var child = instance_create(x,y,fx_detector);
    if (!instance_exists(fx_detectorArrow)) var arrow = instance_create(x,y,fx_detectorArrow);
    
    child.allowChild = false;
}

