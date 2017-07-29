///Draw if not digging
if (isActive) && (owner) && instance_exists_fast(owner)
{
    if (!owner.isDigging) && (owner.animation_current != "dig") draw_self();
}

