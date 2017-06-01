///Draw if not digging
if (isActive) && (owner) && instance_exists(owner)
{
    if (!owner.isDigging) && (owner.animation_current != "dig") draw_self();
}

