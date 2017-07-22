/// Follow Owner Position
if instance_exists_fast(owner)
{
    x = owner.x;
    if (isActive) 
	{
		y = owner.y-15;
		depth = (owner.depth)-1;
    }
	else 
	{
		y = owner.y-35;
		depth = (owner.depth)+1;
	}
}
