owner = noone;
damage = 0;
push_power = 0;
push_direction = 0;
image_speed = 0.1;
if instance_exists(owner)
{
    //push_direction = owner.look_direction;
    //Estou setando isso na hora da porrada agora, foda-se
}
damage_list = ds_list_create();
damage_list_solid = ds_list_create();
max_hits = 1;

hasJoy = false;

