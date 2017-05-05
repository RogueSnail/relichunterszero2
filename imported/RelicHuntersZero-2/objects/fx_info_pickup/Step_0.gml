///Update position and string
if (instance_exists(owner))
{
    myString = owner.name;
    x = owner.bbox_right + 8;
    y = owner.y;
    myStringLength = string_length(myString);
}
else instance_destroy();




